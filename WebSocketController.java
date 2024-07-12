package com.bookbookbook;

import java.time.LocalDateTime;
import java.util.Set;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.bookbookbook.ChatMessageVO.MessageType;


import java.time.LocalDateTime;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.bookbookbook.ChatMessageVO.MessageType;

@Controller
public class WebSocketController {

    private final SimpMessageSendingOperations messagingTemplate;

    public WebSocketController(SimpMessageSendingOperations messagingTemplate) {
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
        messagingTemplate.convertAndSend("/topic/public", chatMessage);
    }
}
/*
@Controller
public class WebSocketController {

    private final SimpMessageSendingOperations messagingTemplate;
    private final ChatRoomService chatRoomService;

    public WebSocketController(SimpMessageSendingOperations messagingTemplate, ChatRoomService chatRoomService) {
        this.messagingTemplate = messagingTemplate;
        this.chatRoomService = chatRoomService;
    }

    @MessageMapping("/chat.createRoom")
    public void createRoom(@Payload ChatRoom room) {
        chatRoomService.createChatRoom(room.getRoomId(), room.getRoomName());
    }

    @MessageMapping("/chat.getParticipants")
    public void getParticipants(@Payload String roomId) {
        Set<String> participants = chatRoomService.getParticipants(roomId);
        // Send participants list to the client
        messagingTemplate.convertAndSend("/topic/participants." + roomId, participants);
    }

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatMessage chatMessage) {
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public." + chatMessage.getRoomId(), chatMessage);
    }

    @MessageMapping("/chat.addUser")
    public void addUser(@Payload ChatMessage chatMessage) {
        chatMessage.setType(MessageType.JOIN);
        chatRoomService.addParticipant(chatMessage.getRoomId(), chatMessage.getSender());
        messagingTemplate.convertAndSend("/topic/public." + chatMessage.getRoomId(), chatMessage);

        // Update participants list for the room
        Set<String> participants = chatRoomService.getParticipants(chatMessage.getRoomId());
        messagingTemplate.convertAndSend("/topic/participants." + chatMessage.getRoomId(), participants);
    }
}
*/