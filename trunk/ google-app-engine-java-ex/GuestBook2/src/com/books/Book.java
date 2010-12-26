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

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
public class Book {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	@Persistent
	private String title;

	@Persistent
	private String isbn10;// isbn

	@Persistent
	private String isbn;// isbn13

	@Persistent
	private String content;

	@Persistent
	private String author;

	@Persistent
	private String translator;

	@Persistent
	private String bookImg;

	@Persistent
	private String bookBiding;

	@Persistent
	private String bookPages;

	@Persistent
	private String publisher;

	@Persistent
	private Date publishDate;

	@Persistent
	private String language;

	@Persistent
	private String productDimensions;

	@Persistent
	private String shippingWeight;

	@Persistent
	private Date createDate;

	public Book(String title, String isbn, String content, String author, Date createDate) {
		this.title = title;
		this.isbn = isbn;
		this.content = content;
		this.author = author;
		this.createDate = createDate;
	}

	public Book(String title, String isbn10, String isbn, String content, String author, String translator,
			String bookImg, String bookBiding, String bookPages, String publisher, Date publishDate, String language,
			String productDimensions, String shippingWeight, Date createDate) {
		super();
		this.title = title;
		this.isbn10 = isbn10;
		this.isbn = isbn;
		this.content = content;
		this.author = author;
		this.translator = translator;
		this.bookImg = bookImg;
		this.bookBiding = bookBiding;
		this.bookPages = bookPages;
		this.publisher = publisher;
		this.publishDate = publishDate;
		this.language = language;
		this.productDimensions = productDimensions;
		this.shippingWeight = shippingWeight;
		this.createDate = createDate;
	}

	// Accessors for the fields. JDO doesn't use these, but your application does.
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

	public void updateBookAuthorTitle(Book e, String newAuthor, String newTitle) {

		// Book book = new Book(title, isbn, content, author, date);
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

	public String getIsbn10() {
		return isbn10;
	}

	public void setIsbn10(String isbn10) {
		this.isbn10 = isbn10;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public String getBookBiding() {
		return bookBiding;
	}

	public void setBookBiding(String bookBiding) {
		this.bookBiding = bookBiding;
	}

	public String getBookPages() {
		return bookPages;
	}

	public void setBookPages(String bookPages) {
		this.bookPages = bookPages;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getProductDimensions() {
		return productDimensions;
	}

	public void setProductDimensions(String productDimensions) {
		this.productDimensions = productDimensions;
	}

	public String getShippingWeight() {
		return shippingWeight;
	}

	public void setShippingWeight(String shippingWeight) {
		this.shippingWeight = shippingWeight;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

}