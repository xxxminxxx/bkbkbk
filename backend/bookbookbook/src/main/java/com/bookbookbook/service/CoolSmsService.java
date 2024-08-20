package com.bookbookbook.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class CoolSmsService {

    private final DefaultMessageService messageService;

    @Value("${coolsms.from.number}")
    private String fromNumber;

    public CoolSmsService(
            @Value("${coolsms.api.key}") String apiKey,
            @Value("${coolsms.api.secret}") String apiSecret
    ) {
        this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
    }

    public void sendSms(String toNumber, String messageContent) {
        Message message = new Message();
        message.setFrom(fromNumber);
        message.setTo(toNumber);
        message.setText(messageContent);

        try {
            SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
            System.out.println(response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}