package com.gae.todo;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gae.todo.dao.Dao;
import com.google.appengine.api.users.User;

public class EmailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(EmailServlet.class.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		log.info("Your information log message");
		log.warning("Your warning log message");
		log.severe("Your severe log message");
		Properties props = new Properties();

		Session email = Session.getDefaultInstance(props, null);

		try {
			MimeMessage message = new MimeMessage(email, req.getInputStream());
			String summary = message.getSubject();
			String description = getText(message);
			Address[] addresses = message.getFrom();
			User user = new User(addresses[0].toString(), "gmail.com");
			Dao.INSTANCE.add(user.getNickname(), summary, description, "");

			String msgBody = "中文信測試";
			Message msg = new MimeMessage(email);
			msg.setFrom(new InternetAddress("ellenlrs@gmail.com", "Ellenlrs Admin"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("ellenlrs@gmail.com", "Ellenlrs"));
			msg.setSubject("Your Example.com account has been activated");
			msg.setText(msgBody);
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private boolean textIsHtml = false;

	/**
	 * Return the primary text content of the message.
	 */
	private String getText(Part p) throws MessagingException, IOException {
		if (p.isMimeType("text/*")) {
			String s = (String) p.getContent();
			textIsHtml = p.isMimeType("text/html");
			return s;
		}

		if (p.isMimeType("multipart/alternative")) {
			// prefer html text over plain text
			Multipart mp = (Multipart) p.getContent();
			String text = null;
			for (int i = 0; i < mp.getCount(); i++) {
				Part bp = mp.getBodyPart(i);
				if (bp.isMimeType("text/plain")) {
					if (text == null)
						text = getText(bp);
					continue;
				} else if (bp.isMimeType("text/html")) {
					String s = getText(bp);
					if (s != null)
						return s;
				} else {
					return getText(bp);
				}
			}
			return text;
		} else if (p.isMimeType("multipart/*")) {
			Multipart mp = (Multipart) p.getContent();
			for (int i = 0; i < mp.getCount(); i++) {
				String s = getText(mp.getBodyPart(i));
				if (s != null)
					return s;
			}
		}

		return null;
	}

}
