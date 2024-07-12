package com.bookbookbook;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

@Service
public class ChatRoomService {
    private Map<String, ChatRoom> chatRooms = new HashMap<>();

    public ChatRoom createChatRoom(String roomId, String roomName) {
        ChatRoom newRoom = new ChatRoom();
        newRoom.setRoomId(roomId);
        newRoom.setRoomName(roomName);
        chatRooms.put(roomId, newRoom);
        return newRoom;
    }

    public ChatRoom getChatRoom(String roomId) {
        return chatRooms.get(roomId);
    }

    public void addParticipant(String roomId, String username) {
        ChatRoom room = chatRooms.get(roomId);
        if (room != null) {
            room.getParticipants().add(username);
        }
    }

    public Set<String> getParticipants(String roomId) {
        ChatRoom room = chatRooms.get(roomId);
        return room != null ? room.getParticipants() : new HashSet<>();
    }
}