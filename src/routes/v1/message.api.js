const express = require('express');
const router = express.Router();
const messageController = require('../../controllers/message.controller');

router.post('/chat/conversations', messageController.createOrGetConversation);
router.get('/chat/conversations/:userId', messageController.getConversationsByUser);
router.post('/chat/messages', messageController.sendMessage);
router.get('/chat/messages/:conversationId', messageController.getMessagesByConversation);

module.exports = router;
