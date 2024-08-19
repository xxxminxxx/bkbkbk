package com.bookbookbook.service;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class LoginAttemptService {
    private static final int MAX_ATTEMPT = 5;
    private LoadingCache<String, Integer> attemptsCache;

    public LoginAttemptService() {
        attemptsCache = CacheBuilder.newBuilder()
                .expireAfterWrite(1, TimeUnit.DAYS)
                .build(new CacheLoader<String, Integer>() {
                    @Override
                    public Integer load(String key) {
                        return 0;
                    }
                });
    }

    public void loginSucceeded(String userId) {
        attemptsCache.invalidate(userId);
    }

    public void loginFailed(String userId) {
        int attempts = getAttempts(userId);
        attemptsCache.put(userId, attempts + 1);
    }

    public boolean isBlocked(String userId) {
        return getAttempts(userId) >= MAX_ATTEMPT;
    }

    public int getAttempts(String userId) {
        try {
            return attemptsCache.get(userId);
        } catch (Exception e) {
            return 0;
        }
    }

    public void resetAttempts(String userId) {
        attemptsCache.invalidate(userId);
    }

    public int getMaxAttempt() {
        return MAX_ATTEMPT;
    }
}