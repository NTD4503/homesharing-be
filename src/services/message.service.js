const knex = require('../config/knex');
const Pusher = require('pusher');

// cấu hình Pusher
const pusher = new Pusher({
    appId: process.env.PUSHER_APP_ID,
    key: process.env.PUSHER_KEY,
    secret: process.env.PUSHER_SECRET,
    cluster: process.env.PUSHER_CLUSTER,
    useTLS: true,
});

function normalizePair(a, b) {
    return a < b ? [a, b] : [b, a];
}

exports.createOrGetConversation = async (user1, user2) => {
    const [u1, u2] = normalizePair(user1, user2); // vẫn giữ để insert

    let conversation = await knex('conversations')
        .where(function () {
            this.where({ user1_id: u1, user2_id: u2 })
                .orWhere({ user1_id: u2, user2_id: u1 }); // tìm ngược lại nữa
        })
        .first();

    if (!conversation) {
        const [newConversation] = await knex('conversations')
            .insert({ user1_id: u1, user2_id: u2 })
            .returning('*');

        conversation = newConversation;
    }

    return conversation;
};

exports.getConversationsByUser = async (userId) => {
    return knex('conversations')
        .where('user1_id', userId)
        .orWhere('user2_id', userId)
        .orderBy('updated_at', 'desc');
};

exports.sendMessage = async (conversation_id, sender_id, text, image_url = '') => {
    const [message] = await knex('messages')
        .insert({
            conversation_id,
            sender_id,
            text,
            image_url,
        })
        .returning('*');

    await knex('conversations')
        .where({ id: conversation_id })
        .update({ updated_at: new Date() });

    // Gửi sự kiện Pusher
    pusher.trigger(`chat-${conversation_id}`, 'new-message', message);

    return message;
};

exports.getMessagesByConversation = async (conversationId) => {
    return knex('messages')
        .where({ conversation_id: conversationId })
        .orderBy('created_at', 'asc');
};
