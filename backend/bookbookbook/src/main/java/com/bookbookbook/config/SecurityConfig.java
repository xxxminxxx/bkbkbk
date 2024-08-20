package com.bookbookbook.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.FirewalledRequest;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.RequestRejectedException;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jakarta.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/**").permitAll()
            )
            .formLogin(formLogin -> formLogin.disable())
            .httpBasic(httpBasic -> httpBasic.disable())
            .logout()
               .logoutSuccessUrl("/")  // 로그아웃 성공 후 메인 페이지로 리다이렉트
               .invalidateHttpSession(true)
               .deleteCookies("JSESSIONID");
        
        return http.build();
    }
    
	/*
	 * //######################################################### //요청 URI에 인쇄 가능한
	 * ASCII 문자 이외의 문자가 포함되어 있을 때 발생하는 오류 해결
	 * 
	 * @Bean public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
	 * StrictHttpFirewall firewall = new StrictHttpFirewall();
	 * firewall.setAllowUrlEncodedPercent(true); firewall.setAllowSemicolon(true);
	 * firewall.setAllowBackSlash(true); firewall.setAllowUrlEncodedPeriod(true);
	 * return firewall; }
	 * 
	 * @Bean public WebSecurityCustomizer webSecurityCustomizer() { return (web) ->
	 * web.httpFirewall(allowUrlEncodedSlashHttpFirewall()); }
	 * 
	 * @Bean public HttpFirewall loggingHttpFirewall() { return new
	 * StrictHttpFirewall() {
	 * 
	 * @Override public FirewalledRequest getFirewalledRequest(HttpServletRequest
	 * request) throws RequestRejectedException { try { return
	 * super.getFirewalledRequest(request); } catch (RequestRejectedException ex) {
	 * logger.error("Rejected request " + request.getRequestURI() + ": " +
	 * ex.getMessage()); throw ex; } } }; }
	 */
    
    //##############################################################
}