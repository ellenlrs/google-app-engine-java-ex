package com.books;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.db.PMF;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")

public class Book {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private String title;

    @Persistent
    private String isbn;
    
    @Persistent
    private String content;
    
    @Persistent
    private String author;    

    @Persistent
    private Date createDate;

    public Book(String title, String isbn, String content, String author, Date createDate) {
        this.title = title;
        this.isbn = isbn;
        this.content = content;
        this.author = author;
        this.createDate = createDate;
    }

    // Accessors for the fields.  JDO doesn't use these, but your application does.
    public Book getBook(int id) {
    	
    	PersistenceManager pm = PMF.get().getPersistenceManager();
        
        Key k = KeyFactory.createKey(Book.class.getSimpleName(), id);
        Book e = pm.getObjectById(Book.class, k);    	
        try {
        pm.setDetachAllOnCommit(true);           
        } finally {
            pm.close();
        }
        return e;
    }
    public void updateBookAuthorTitle(Book e,String newAuthor, String newTitle) {
        
    	
    	//Book book = new Book(title, isbn, content, author, date);
    	e.setAuthor(newAuthor);
    	e.setTitle(newTitle);
        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(e);
        } finally {
            pm.close();
        }
            
        	
        
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
    
    public String getIsbn() {
        return isbn;
    } 
    public String getContent() {
        return content;
    } 
    public String getAuthor() {
        return author;
    } 
    public Date getCreateDate() {
        return createDate;
    }

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	} 

    
}