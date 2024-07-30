package com.bookbookbook.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private Integer userNum;
	private String userId;
	private String password;
	private String userName;
	private String userTel;
	private String joinedDate;
	private String birthDate;
	private String nickname;
	private String gender;
	private String quitStatus;
	private String banStatus;
	private Integer userLevel;
	private String kakaoId;
	private String naverId;
	private String reported;
	
}
