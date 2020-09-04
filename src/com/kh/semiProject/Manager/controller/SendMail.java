package com.kh.semiProject.Manager.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kh.semiProject.mQnA.model.vo.QnA;

public class SendMail {

	    static final String FROM = "cdi95@naver.com";
	    static final String FROMNAME = "개편한세상";
	    static final String TO = "cdi95@naver.com";
	    static final String SMTP_USERNAME = "unimik13@gmail.com";
	    static final String SMTP_PASSWORD = "alsdn123!@";
	    
	    static final String HOST = "imap.gmail.com";
	    static final int PORT = 587;
	    
	    static final String SUBJECT = "제목설정하기";
	    
//	    static final String BODY = String.join(
//	        System.getProperty("line.separator"),
//	        //여기에 requestMail 내용 스트링으로 가져오기
//	        
//	        "<h1>메일 내용</h1>",
//	        "<p>이 메일은 아름다운 사람이 보낸 아름다운 메일입니다!</p>."
//	    );
	    static final String BODY ="제발되라";
	    
	    public void sendMessage(QnA q) throws UnsupportedEncodingException, MessagingException {
	    		
	    		String requestText = "문의 사항 : " + q.getQnaTitle() + " 에 대한 답변  / "+q.getQnaDate()+")"
	    							+"문의 내용 <br>"+ q.getReText() + "===================================================" +
	    							"문의 담당자 : " + q.getRequester() + "<br>"+q.getReDate(); 
	    	
	    	
		        Properties props = System.getProperties();
		        props.put("mail.transport.protocol", "smtp");
		        props.put("mail.smtp.port", "587"); 
		        props.put("mail.smtp.starttls.enable", "true");
		        props.put("mail.smtp.auth", "true");
		        Session session = Session.getDefaultInstance(props);
		        MimeMessage msg = new MimeMessage(session);
		        msg.setFrom(new InternetAddress(FROM, FROMNAME));
		        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
		        msg.setSubject("RE:"+q.getQnaTitle());
		        msg.setContent(requestText, "text/html;charset=euc-kr");
		        
		        Transport transport = session.getTransport();
		        try {
		            System.out.println("Sending...");
		            
		            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
		            transport.sendMessage(msg, msg.getAllRecipients());
		            System.out.println("Email sent!");
		        } catch (Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            transport.close();
		        }
		    
	    }
	    public static void main(String[] args) throws Exception {
	    	QnA q = new QnA();
	    	new SendMail().sendMessage(q);
	    }

	    
	}

