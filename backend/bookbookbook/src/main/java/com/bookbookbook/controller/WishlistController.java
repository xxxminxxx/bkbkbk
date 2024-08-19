package com.bookbookbook.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookbookbook.service.WishlistService;

import jakarta.servlet.http.HttpSession;

@RestController	
@RequestMapping("/wishlist")
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    @PostMapping("/add")
    public ResponseEntity<String> addToWishlist(@RequestParam int bookNum, HttpSession session) {
        // 세션에서 userNum을 가져옴
        Integer userNum = (Integer) session.getAttribute("userNum");
        String userId = (String) session.getAttribute("userId");

        System.out.println(">>>userId: " + userId);
        System.out.println(">>>userNum: " + userNum);

        JSONObject jsonResponse = new JSONObject();

        if (userNum == null) {
            // userNum이 세션에 없으면 로그인 페이지로 리다이렉트
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Unauthorized");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .contentType(MediaType.APPLICATION_JSON)
                                 .body(jsonResponse.toString());
        }

        System.out.println(">>> Controller: 위시리스트 컨트롤러 addToWishlist 호출");

        // 중복 체크 후 위시리스트에 추가
        boolean added = wishlistService.addToWishlist(bookNum, userNum);

        if (added) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "책이 나의 서재에 저장되었습니다.");
            return ResponseEntity.ok()
                                 .contentType(MediaType.APPLICATION_JSON)
                                 .body(jsonResponse.toString());
        } else {
            jsonResponse.put("status", "duplicate");
            jsonResponse.put("message", "이미 나의 서재에 저장된 책입니다.");
            return ResponseEntity.status(HttpStatus.CONFLICT)
                                 .contentType(MediaType.APPLICATION_JSON)
                                 .body(jsonResponse.toString());
        }
    }
    
}
