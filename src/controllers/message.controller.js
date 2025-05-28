const chatService = require('../services/message.service');

exports.createOrGetConversation = async (req, res) => {
    const { user1_id, user2_id } = req.body;
    try {
        const conversation = await chatService.createOrGetConversation(user1_id, user2_id);
        res.json(conversation);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getConversationsByUser = async (req, res) => {
    const { userId } = req.params;
    try {
        const conversations = await chatService.getConversationsByUser(userId);
        res.json(conversations);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.sendMessage = async (req, res) => {
    const { conversation_id, sender_id, text, image_url } = req.body;
    try {
        const message = await chatService.sendMessage(conversation_id, sender_id, text, image_url);
        res.json(message);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getMessagesByConversation = async (req, res) => {
    const { conversationId } = req.params;
    try {
        const messages = await chatService.getMessagesByConversation(conversationId);
        res.json(messages);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
