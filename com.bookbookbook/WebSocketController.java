package com.bookbookbook;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

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
	
	private Set<String> activeUsers = new HashSet<>(); // 유저 목록 저장을 위한 Set
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
    	String info = roomNum+"/"+chatMessage.getSender(); // 유저 이름을 가져옴
        activeUsers.add(info); // 유저를 목록에 추가
    	chatMessage.setType(MessageType.JOIN);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+ roomNum, chatMessage);     
        sendActiveUsers(roomNum); // 업데이트된 유저 목록 전송
    }
    
    @MessageMapping("/chat.removeUser/{roomNum}")
    public void removeUser(@Payload ChatMessageVO chatMessage,@DestinationVariable String roomNum) {
    	String info = roomNum+"/"+chatMessage.getSender(); // 유저 이름을 가져옴
        activeUsers.remove(info); // 유저를 목록에서 제거
    	chatMessage.setType(MessageType.LEAVE);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+roomNum, chatMessage);
        sendActiveUsers(roomNum); // 업데이트된 유저 목록 전송
    }
    // 유저 목록을 클라이언트에 전송하는 메소드
    private void sendActiveUsers(String roomNum) {
        messagingTemplate.convertAndSend("/topic/activeUsers/" + roomNum, activeUsers);
    }
}
