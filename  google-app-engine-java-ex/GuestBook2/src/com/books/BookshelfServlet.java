package com.books;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.PMF;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class BookshelfServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(BookshelfServlet.class.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		String title = req.getParameter("title");
		String isbn = req.getParameter("isbn");
		String content = req.getParameter("content");
		String author = req.getParameter("author");
		Date createDate = new Date();
		String isbn10 = "";
		String translator = "";
		String bookImg = "";
		String bookBiding = "";
		String bookPages = "";
		String publisher = "";
		Date publishDate = new Date();
		String language = "";
		String productDimensions = "";
		String shippingWeight = "";

		// Book book = new Book(title, isbn, content, author, date);
		Book book = new Book(title, isbn10, isbn, content, author, translator, bookImg, bookBiding, bookPages, publisher,
				publishDate, language, productDimensions, shippingWeight, createDate);

		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(book);
		} finally {
			pm.close();
		}

		resp.sendRedirect("/books/insertBookOK.jsp");
	}
}
