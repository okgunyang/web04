package com.okhospital.controller;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.okhospital.dto.EmailDTO;

@Controller
@RequestMapping("/email/*")
public class SendMailController {
	private static final Logger logger = LoggerFactory.getLogger(SendMailController.class);

	//다음 서비스 작업 객체를 주입
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private JavaMailSender mailSender2;
	
	@Autowired
	private JavaMailSender mailSender3;
	
	@RequestMapping("sendNaverMail.do")
	public String sendNaverEmail(EmailDTO edto, Model model) throws Exception {
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
            mailHelper.setFrom(edto.getFrom());
            mailHelper.setTo(edto.getTo());
            mailHelper.setSubject(edto.getSubject());
            mailHelper.setText(edto.getContent(), true);
            mailSender.send(mail);
            logger.info("이메일 전송이 완료되었습니다.");
        } catch(Exception e) {
        	logger.info("이메일 전송이 실패되었습니다.");
            e.printStackTrace();
        }
		return "redirect:/";
	}

	@RequestMapping("sendGoogleMail.do")
	public String sendGoogleEmail(EmailDTO edto, Model model) throws Exception {
        try {
            MimeMessage mail = mailSender2.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
            mailHelper.setFrom(edto.getFrom());
            mailHelper.setTo(edto.getTo());
            mailHelper.setSubject(edto.getSubject());
            mailHelper.setText(edto.getContent(), true);
            mailSender.send(mail);
            logger.info("이메일 전송이 완료되었습니다.");
        } catch(Exception e) {
        	logger.info("이메일 전송이 실패되었습니다.");
            e.printStackTrace();
        }
		return "redirect:/";
	}
	
	@RequestMapping("sendDaumMail.do")
	public String sendDaumEmail(EmailDTO edto, Model model) throws Exception {
        try {
            MimeMessage mail = mailSender3.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
            mailHelper.setFrom(edto.getFrom());
            mailHelper.setTo(edto.getTo());
            mailHelper.setSubject(edto.getSubject());
            mailHelper.setText(edto.getContent(), true);
            mailSender.send(mail);
            logger.info("이메일 전송이 완료되었습니다.");
        } catch(Exception e) {
        	logger.info("이메일 전송이 실패되었습니다.");
            e.printStackTrace();
        }
		return "redirect:/";
	}
	
	@RequestMapping("onlineConsult.do")
	public String mailWriteForm(Model model) throws Exception {
		return "email/emailWriteForm";
	}
}