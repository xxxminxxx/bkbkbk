package com.bookbookbook.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private Integer userNum;     // 사용자 고유 번호
	private String userId;       // 사용자 아이디
	private String password;     // 사용자 비밀번호
	private String password2;    // 비밀번호 확인용
	private String userName;     // 사용자 이름
	private String userTel;      // 사용자 전화번호
	private String joinedDate;   // 가입 날짜
	private String birthDate;    // 생년월일
	private String nickname;     // 사용자 닉네임
	private String gender;       // 성별
	private String quitStatus;   // 탈퇴 상태
	private String banStatus;    // 정지 상태
	private Integer userLevel;   // 사용자 레벨
	private String kakaoId;      // 카카오 계정 연동 ID
	private String naverId;      // 네이버 계정 연동 ID
	private String reported;     // 신고 여부
	private String interestHobby; // 관심사/취미
	private String address;       // 주소
	
}
