package com.bookbookbook.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
public class ActiveUserService {
    private final Map<String, Set<String>> activeUsersByRoom = new HashMap<>();

    // 방에 사용자 추가
    public synchronized void addUser(String roomNum, String user) {
        activeUsersByRoom.computeIfAbsent(roomNum, k -> new HashSet<>()).add(user);
        System.out.println("1"+activeUsersByRoom);
    }

    // 방에서 사용자 제거
    public synchronized void removeUser(String roomNum, String user) {
        Set<String> users = activeUsersByRoom.get(roomNum);
        if (users != null) {
            users.remove(user);
            if (users.isEmpty()) {
                activeUsersByRoom.remove(roomNum);
            }
        } System.out.println("2"+activeUsersByRoom);
    }

    // 방의 활성 사용자 목록 가져오기
    public synchronized Set<String> getActiveUsers(String roomNum) {
    	 System.out.println("3"+activeUsersByRoom);
        return activeUsersByRoom.getOrDefault(roomNum, new HashSet<>());
    }
    
    public synchronized Map<String, Set<String>> getAllActiveUsers() {
        // 모든 방의 사용자 목록을 포함하는 맵을 반환
        Map<String, Set<String>> allActiveUsersByRoom = new HashMap<>(activeUsersByRoom);
        System.out.println("4" + allActiveUsersByRoom);
        return allActiveUsersByRoom;
    }
}
