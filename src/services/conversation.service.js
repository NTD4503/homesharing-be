const knex = require('../config/knex');

/**
 * Tạo cuộc trò chuyện mới giữa 2 user (nếu chưa có)
 * @param {number} user1_id 
 * @param {number} user2_id
 * @returns conversation vừa tạo hoặc đã có
 */
async function createConversation(user1_id, user2_id) {
    try {
        // Sắp xếp id để tránh tạo trùng (user1_id < user2_id)
        const [firstUser, secondUser] = user1_id < user2_id ? [user1_id, user2_id] : [user2_id, user1_id];

        // Kiểm tra đã có conversation giữa 2 người chưa
        let conversation = await knex('conversations')
            .where({ user1_id: firstUser, user2_id: secondUser })
            .first();

        if (!conversation) {
            const [newConv] = await knex('conversations')
                .insert({ user1_id: firstUser, user2_id: secondUser })
                .returning('*');
            conversation = newConv;
        }

        return conversation;
    } catch (error) {
        console.error('Error in createConversation:', error);
        throw error;
    }
}

/**
 * Lấy danh sách cuộc trò chuyện của một user
 * @param {number} user_id
 * @returns danh sách conversations
 */
async function getConversationsByUser(user_id) {
    try {
        const conversations = await knex('conversations')
            .where('user1_id', user_id)
            .orWhere('user2_id', user_id)
            .orderBy('updated_at', 'desc');

        return conversations;
    } catch (error) {
        console.error('Error in getConversationsByUser:', error);
        throw error;
    }
}

module.exports = {
    createConversation,
    getConversationsByUser,
};
