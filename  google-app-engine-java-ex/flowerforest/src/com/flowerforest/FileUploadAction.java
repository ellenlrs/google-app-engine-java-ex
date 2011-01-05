package com.flowerforest;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport {
	private static final long serialVersionUID = -2724120042141802414L;
	private String file;
	private String fileContentType;
	private String fileFileName;
	private InputStream photoStream;

	/**
	 * @return the file
	 */
	public String getFile() {
		return file;
	}

	/**
	 * @param file the file to set
	 */
	public void setFile(String file) {
		this.file = file;
	}

	/**
	 * @return the fileContentType
	 */
	public String getFileContentType() {
		return fileContentType;
	}

	/**
	 * @param fileContentType the fileContentType to set
	 */
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	/**
	 * @return the fileFileName
	 */
	public String getFileFileName() {
		return fileFileName;
	}

	/**
	 * @param fileFileName the fileFileName to set
	 */
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	/**
	 * @return the photoStream
	 */
	public InputStream getPhotoStream() {
		return photoStream;
	}

	/**
	 * @param photoStream the photoStream to set
	 */
	public void setPhotoStream(InputStream photoStream) {
		this.photoStream = photoStream;
	}

	public String text() throws Exception {
		Properties props = new java.util.Properties();
		props.load(new FileInputStream("messages_zh_CN.properties"));
		System.out.println(props.getProperty("head.welcome"));
		file = new String(file.getBytes("ISO-8859-1"), "gbk");
		// file = new String(file.getBytes("utf-8"), "big5");
		return "uploadTextInfo";
	}

	public String image() throws Exception {
		photoStream = IOUtils.toInputStream(file, "ISO-8859-1");
		return "iamge";
	}
}
