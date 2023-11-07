package com.stoc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.stoc.util.SMTPAuthenticatior;
import com.stoc.controller.CommonController;

@Controller
public class CommonController {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	
	//PageControll
	/**
	 * 페이지 이동 요청 처리.
	 * - "/페이지위치" 경로를 가진 화면으로 이동한다. 
	 * - 파라미터 처리를 위해 return 을 ModelAndView 로 변경한다.
	 * 
	 * <화면요청 예시>
	 * /home
	 * 
	 * @param page         페이지명
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value = "/{page}", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView pageController(@PathVariable String page, HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		String url = page;
		mav.setViewName(url);
		return mav;
	}
	
	//sendMail
	/**
	 * 메일 발송 처리.
	 * 
	 * @param name
	 * @param email
	 * @param category
	 * @param nation
	 * @param phone
	 * @param note
	 * 
	 * @throws IOException 
	 */
	@RequestMapping(value = "/sendMailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody public String sendMailAjax(@RequestParam HashMap<String, Object> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> modelMap = new HashMap<String, Object>();
		String from = "stoc@yonggi0607.cafe24.com";
		String to = "stoc@stocaption.com";
		String subject =  "StoC 문의";
		String content = "";
		content += "구분 : ";
		content += params.get("param_gubun").toString();
		content += "<br><br>이름 : ";
		content += params.get("param_name").toString();
		content += "<br><br>연락처 : ";
		content += params.get("param_phone").toString();
		content += "<br><br>날짜 : ";
		content += params.get("param_date").toString();
		content += " ";
		content += params.get("param_time").toString();
		content += "<br><br>이메일 : ";
		content += params.get("param_email").toString();
		content += "<br><br>문의 내용 : <br>";
		content += params.get("param_note").toString();
		
		Properties properties = new Properties();
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.cafe24.com");
        properties.put("mail.smtp.auth", "true");
        
		try{
			//인증정보
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(properties, auth);
		    //메세지 생성
		    MimeMessage msg = new MimeMessage(ses);
		    //보내는 사람 메일주소
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		    //받는 사람 메일주소
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    //제목,내용
		    msg.setSubject(subject);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    //전송
		    Transport.send(msg);
		} catch(Exception e){
		    e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
}