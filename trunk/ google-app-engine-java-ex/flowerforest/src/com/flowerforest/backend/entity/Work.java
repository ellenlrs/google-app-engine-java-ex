package com.flowerforest.backend.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
public class Work {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;// 編號

	@Persistent
	private String title;// 名稱
	private String imgurl;
	private String imgwidth;
	private String imgheight;
	private String imgseq;
	private Date createDate;

	public Work() {
		super();
	}

	public Work(String title) {
		super();
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getImgwidth() {
		return imgwidth;
	}

	public void setImgwidth(String imgwidth) {
		this.imgwidth = imgwidth;
	}

	public String getImgheight() {
		return imgheight;
	}

	public void setImgheight(String imgheight) {
		this.imgheight = imgheight;
	}

	public String getImgseq() {
		return imgseq;
	}

	public void setImgseq(String imgseq) {
		this.imgseq = imgseq;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
