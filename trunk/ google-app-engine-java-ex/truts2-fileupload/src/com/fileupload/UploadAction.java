package com.fileupload;

import java.io.InputStream;

import org.apache.commons.io.IOUtils;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {

	private static final long serialVersionUID = -300329750248730163L;
	private String photo;
	private String photoContentType;
	private String photoFileName;
	private InputStream photoStream;
	
	public String upload() throws  Exception {
		photoStream = IOUtils.toInputStream(photo,"ISO-8859-1");
		return "success";
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public InputStream getPhotoStream() {
		return photoStream;
	}

	public void setPhotoStream(InputStream photoStream) {
		this.photoStream = photoStream;
	}

	

}
