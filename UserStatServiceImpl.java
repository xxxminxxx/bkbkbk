package com.bookbookbook.service;

import com.bookbookbook.dao.BookshelfDAO;
import com.bookbookbook.dao.UserDAO;
import com.bookbookbook.dao.UserStatDAO;
import com.bookbookbook.domain.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class UserStatServiceImpl implements UserStatService{

    // UserStatDAO 객체 주입
    private final UserStatDAO userStatDAO;

    // 페이지별 통계
    @Override
    public List<UserStatVO> getUserStatInfo1(UserStatVO userStatVO) {
        List<UserStatVO> userStatVO1 = userStatDAO.getUserStatInfo1(userStatVO);
        return userStatVO1;
    }

    // 권수별 통계
    @Override
    public List<UserStatVO> getUserStatInfo2(UserStatVO userStatVO) {
        List<UserStatVO> userStatVO2 = userStatDAO.getUserStatInfo2(userStatVO);
        return userStatVO2;
    }

}
