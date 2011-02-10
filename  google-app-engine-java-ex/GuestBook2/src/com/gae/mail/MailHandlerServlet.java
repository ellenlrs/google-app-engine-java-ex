package com.gae.mail;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

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

@SuppressWarnings("serial")
public class MailHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(MailHandlerServlet.class.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Properties props = new Properties();
		Session email = Session.getDefaultInstance(props, null);
		try {
			String sendto = checkNull(req.getParameter("sendto"));
			String mailbody = checkNull(req.getParameter("mailbody"));
			Message msg = new MimeMessage(email);
			msg.setFrom(new InternetAddress("ellenlrs@gmail.com", "Ellenlrs Admin"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendto, sendto));
			msg.setSubject("This is ellenlrs GAE mail");
			msg.setText(mailbody);
			Transport.send(msg);
			resp.sendRedirect("/index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			log.warning("MailHandlerServlet_doPost_ERROR" + e.toString());
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

	private String checkNull(String s) {
		if (s == null) {
			return "";
		}
		return s;
	}
}
