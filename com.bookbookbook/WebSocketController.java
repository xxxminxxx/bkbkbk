package com.bookbookbook;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.bookbookbook.domain.ChatMessageVO;
import com.bookbookbook.domain.ChatMessageVO.MessageType;
import com.bookbookbook.service.ChatMessageCSVService;

@Controller
public class WebSocketController {
	@Autowired
    private ChatMessageCSVService chatMessageCSVService;
	
    private final SimpMessageSendingOperations messagingTemplate;


    public WebSocketController(SimpMessageSendingOperations messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    
    @MessageMapping("/chat.register")
    @SendTo("/topic/public")
    public ChatMessageVO register(@Payload ChatMessageVO message) {
        // 클라이언트가 JOIN 메시지를 보냈을 때 처리
        System.out.println("Received JOIN message: " + message);
        return message;
    }
    
    @MessageMapping("/chat.sendMessage/{roomNum}")
    public void sendMessage(@Payload ChatMessageVO chatMessage ,@DestinationVariable String roomNum) {
        chatMessage.setTime(LocalDateTime.now());
        chatMessageCSVService.saveChatMessage(chatMessage);
        messagingTemplate.convertAndSend("/topic/public/"+ roomNum, chatMessage);
    }

    @MessageMapping("/chat.addUser/{roomNum}")
    public void addUser(@Payload ChatMessageVO chatMessage,@DestinationVariable String roomNum) {
        chatMessage.setType(MessageType.JOIN);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+ roomNum, chatMessage);
        
    }
    
    @MessageMapping("/chat.removeUser/{roomNum}")
    public void removeUser(@Payload ChatMessageVO chatMessage,@DestinationVariable String roomNum) {
        chatMessage.setType(MessageType.LEAVE);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+roomNum, chatMessage);
    }
    
}
