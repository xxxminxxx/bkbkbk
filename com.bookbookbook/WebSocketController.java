package com.bookbookbook;

import java.time.LocalDateTime;
import java.util.Set;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.bookbookbook.ChatMessageVO.MessageType;

@Controller
public class WebSocketController {

    private final SimpMessageSendingOperations messagingTemplate;

    public WebSocketController(SimpMessageSendingOperations messagingTemplate, ChatRoomService chatRoomService) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatMessageVO chatMessage) {
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public", chatMessage);
    }

    @MessageMapping("/chat.addUser")
    public void addUser(@Payload ChatMessageVO chatMessage) {
        chatMessage.setType(MessageType.JOIN);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public", chatMessage);
    }
    
    @MessageMapping("/chat.removeUser")
    public void removeUser(@Payload ChatMessageVO chatMessage) {
        chatMessage.setType(MessageType.LEAVE);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public", chatMessage);
    }

}
