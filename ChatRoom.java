package com.bookbookbook;
import java.util.HashSet;
import java.util.Set;

import lombok.Data;

@Data
public class ChatRoom {
    private String roomId;
    private String roomName;
    private Set<String> participants = new HashSet<>();

}