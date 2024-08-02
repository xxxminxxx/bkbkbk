package com.bookbookbook;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.bookbookbook.domain.ChatMessageVO;
import com.bookbookbook.domain.ChatMessageVO.MessageType;
import com.bookbookbook.service.ActiveUserService;
import com.bookbookbook.service.ChatMessageCSVService;
import com.bookbookbook.service.MainService;

@Controller
public class WebSocketController {
	@Autowired
    private ChatMessageCSVService chatMessageCSVService;
	@Autowired
	private MainService mainService;
	@Autowired
    private ActiveUserService activeUserService;
	
	
	//private List<String> activeUsers = new ArrayList<>(); // 유저 목록 저장을 위한 리스트
    private final SimpMessageSendingOperations messagingTemplate;

    public WebSocketController(SimpMessageSendingOperations messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/chat.register")
    @SendTo("/topic/public")
    public ChatMessageVO register(@Payload ChatMessageVO message) {
        // 클라이언트가 JOIN 메시지를 보냈을 때 처리
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
    	String info = chatMessage.getSender(); // 유저 이름을 가져옴
    	activeUserService.addUser(roomNum,info); // 유저를 목록에 추가
    	chatMessage.setType(MessageType.JOIN);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+ roomNum, chatMessage);     
        sendActiveUsers(roomNum); // 업데이트된 유저 목록 전송
    }
    
    @MessageMapping("/chat.removeUser/{roomNum}")
    public void removeUser(@Payload ChatMessageVO chatMessage,@DestinationVariable String roomNum) {
    	String info = chatMessage.getSender(); // 유저 이름을 가져옴
    	activeUserService.removeUser(roomNum,info); // 유저를 목록에서 제거
    	chatMessage.setType(MessageType.LEAVE);
        chatMessage.setTime(LocalDateTime.now());
        messagingTemplate.convertAndSend("/topic/public/"+roomNum, chatMessage);
        sendActiveUsers(roomNum); // 업데이트된 유저 목록 전송
        if (activeUserService.getActiveUsers(roomNum).isEmpty()) {
            mainService.deleteChatroom(roomNum);
        }
    }
    // 유저 목록을 클라이언트에 전송하는 메소드
    private void sendActiveUsers(String roomNum) {
        messagingTemplate.convertAndSend("/topic/activeUsers/" + roomNum, activeUserService.getActiveUsers(roomNum));
    }
    
}
