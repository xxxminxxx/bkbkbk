package com.bookbookbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookbookbook.service.UserService;

import java.util.Map;

@RestController
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/pages/verify-temp-code")
    public ResponseEntity<?> verifyTempCode(@RequestBody Map<String, String> payload) {
        String userId = payload.get("userId");
        String tempCode = payload.get("tempCode");

        boolean isVerified = userService.verifyTempCode(userId, tempCode);

        if (isVerified) {
            return ResponseEntity.ok().body(Map.of("success", true));
        } else {
            return ResponseEntity.ok().body(Map.of("success", false));
        }
    }
}