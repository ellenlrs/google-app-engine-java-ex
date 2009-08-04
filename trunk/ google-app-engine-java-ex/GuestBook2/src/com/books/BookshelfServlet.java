package com.books;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import com.books.Book;
import com.db.PMF;

public class BookshelfServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(BookshelfServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String content = req.getParameter("content");
        String author = req.getParameter("author");        
        Date date = new Date();
        Book book = new Book(title, isbn, content, author, date);

        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(book);
        } finally {
            pm.close();
        }
       
        resp.sendRedirect("/books/insertBookOK.jsp");
    }
}
