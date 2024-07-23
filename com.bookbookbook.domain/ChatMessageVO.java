package com.bookbookbook.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatMessageVO {
	private MessageType type;
	private String content;
	private String sender;
	private LocalDateTime time;
	private String senderId;

	public enum MessageType {
		CHAT,
		JOIN,
		LEAVE
	}
}
