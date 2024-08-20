package com.bookbookbook.controller;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.bookbookbook.domain.GoogleLoginResponse;
import com.bookbookbook.domain.GoogleOAuthRequest;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ApiRestController {
	
	// UserService 인스턴스를 위한 필드 선언
	private final UserService userService;
	
	@Autowired
	public ApiRestController(UserService userService) {
	    this.userService = userService;
	}

    @Value("${google.auth.url}")
    private String googleAuthUrl;

    @Value("${google.login.url}")
    private String googleLoginUrl;

    @Value("${google.client.id}")
    private String googleClientId;

    @Value("${google.redirect.url}")
    private String googleRedirectUrl;

    @Value("${google.secret}")
    private String googleClientSecret;


    // 구글 로그인창 호출
    // http://localhost:8080/login/getGoogleAuthUrl
    @GetMapping(value = "/login/getGoogleAuthUrl")
    public ResponseEntity<?> getGoogleAuthUrl(HttpServletRequest request) throws Exception {

        String reqUrl = googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId + "&redirect_uri=" + googleRedirectUrl
                + "&response_type=code&scope=email%20profile%20openid&access_type=offline";

        log.info("myLog-LoginUrl : {}",googleLoginUrl);
        log.info("myLog-ClientId : {}",googleClientId);
        log.info("myLog-RedirectUrl : {}",googleRedirectUrl);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(URI.create(reqUrl));

        //1.reqUrl 구글로그인 창을 띄우고, 로그인 후 /login/oauth_google_check 으로 리다이렉션하게 한다.
        return new ResponseEntity<>(headers, HttpStatus.MOVED_PERMANENTLY);
    }

    // 구글에서 리다이렉션
    @GetMapping(value = "/login/oauth_google_check")
    public ModelAndView  oauth_google_check(HttpServletRequest request,
                                     @RequestParam(value = "code") String authCode,
                                     HttpServletResponse response,
                                     HttpSession session,
                                     Model model) throws Exception{
    	ModelAndView mav = new ModelAndView();

        //2.구글에 등록된 레드망고 설정정보를 보내어 약속된 토큰을 받위한 객체 생성
        GoogleOAuthRequest googleOAuthRequest = GoogleOAuthRequest
                .builder()
                .clientId(googleClientId)
                .clientSecret(googleClientSecret)
                .code(authCode)
                .redirectUri(googleRedirectUrl)
                .grantType("authorization_code")
                .build();

        RestTemplate restTemplate = new RestTemplate();

        //3.토큰요청을 한다.
        ResponseEntity<GoogleLoginResponse> apiResponse = restTemplate.postForEntity(googleAuthUrl + "/token", googleOAuthRequest, GoogleLoginResponse.class);
        //4.받은 토큰을 토큰객체에 저장
        GoogleLoginResponse googleLoginResponse = apiResponse.getBody();

        log.info("responseBody {}",googleLoginResponse.toString());


        String googleToken = googleLoginResponse.getId_token();

        //5.받은 토큰을 구글에 보내 유저정보를 얻는다.
        String requestUrl = UriComponentsBuilder.fromHttpUrl(googleAuthUrl + "/tokeninfo").queryParam("id_token",googleToken).toUriString();

        //6.허가된 토큰의 유저정보를 결과로 받는다.
        String resultJson = restTemplate.getForObject(requestUrl, String.class);
        
        // JSON 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(resultJson);

        // 'sub' 필드가 사용자의 고유 ID입니다.
        String email = jsonNode.get("email").asText();
        String name = jsonNode.get("name").asText(); // 구글에서 제공하는 경우

        System.out.println("email"+email+name);
       
        // 1. userService.findByEmail(email); 
        UserVO user = userService.findByEmail(email);
        
        System.out.println("사용자가 성공적으로 받아와졌음"+user);
        
        if(user!=null) {
        	userService.updateGoogleStatus(email);
        	session.setAttribute("userId",user.getUserId());
        	session.setAttribute("userName", user.getUserName());
        	
        	mav.addObject("user", user);
        	mav.addObject("loginSuccess",true);
        }else {
        	mav.addObject("loginSuccess",false);
        }
        mav.addObject("googleEmail",email);
        mav.addObject("googleName",name);
        mav.setViewName("oauth_google_check");
        return mav;
        // 2. 1에서 받아온 email이 있는 경우 -> 로그인 시키기 
        // 2-1. update로 user 테이블의 googleId 칼럼 yes로 업데이트 시키기
        // 3. 1에서 받아온 email이 없는 경우 -> 회원 가입 페이지에 email을 id 칸에 넘기기
        // 3-1. user 테이블의 googleId 칼럼 yes로 넣으면서 user 테이블에 정보 넘기기 
        
    }
}