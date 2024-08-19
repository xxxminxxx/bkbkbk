package com.bookbookbook.service;

import com.bookbookbook.domain.ChatMessageVO;
import org.springframework.stereotype.Service;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@Service
public class ChatMessageCSVService {

    private static final String CSV_FILE = "chat_history.csv";
    private static final String CSV_HEADER = "Sender,Type,Time,Message";

    public void saveChatMessage(ChatMessageVO message) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(CSV_FILE, true))) {
            if (!fileExists()) {
                writer.println(CSV_HEADER);
            }
            String line = String.format("%s,%s,%s,%s",
                    message.getSender(),
                    message.getType(),
                    message.getTime(),
                    message.getContent());
            writer.println(line);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean fileExists() {
        // 파일이 존재하는지 확인하는 로직
        // 필요에 따라 구현
        return true; // 임시로 true 반환
    }
}