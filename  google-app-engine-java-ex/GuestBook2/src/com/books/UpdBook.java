package com.books;

import java.io.IOException;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.PMF;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class UpdBook extends HttpServlet {
	private static final Logger log = Logger.getLogger(UpdBook.class.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		int id = Integer.parseInt(req.getParameter("id"));

		Key k = KeyFactory.createKey(Book.class.getSimpleName(), id);
		Book book = pm.getObjectById(Book.class, k);
		book.setAuthor(req.getParameter("author"));
		book.setTitle(req.getParameter("title"));
		book.setIsbn(req.getParameter("isbn"));
		book.setContent(req.getParameter("content"));
		book.setBookImg(req.getParameter("bookImg"));
		try {
			pm.makePersistent(book);
		} finally {
			pm.close();
		}

		resp.sendRedirect("/books/updBookOK.jsp");
	}
}