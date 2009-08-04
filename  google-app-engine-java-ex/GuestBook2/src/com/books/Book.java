package com.books;
import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
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

    
}