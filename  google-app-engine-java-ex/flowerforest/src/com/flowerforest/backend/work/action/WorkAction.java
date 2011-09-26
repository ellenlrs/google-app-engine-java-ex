package com.flowerforest.backend.work.action;

import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;

import com.db.PMF;
import com.flowerforest.backend.entity.Work;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.opensymphony.xwork2.ActionSupport;

public class WorkAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6800595507449547556L;
	private static final Logger log = Logger.getLogger(WorkAction.class.getName());
	private String title;// 名稱
	private String imgurl;
	private String imgwidth;
	private String imgheight;
	private String imgseq;
	private String id;

	public WorkAction() {

	}

	public String savework() {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Work work = new Work();
			work.setTitle(getTitle());
			work.setImgurl(getImgurl());
			work.setImgwidth(getImgwidth());
			work.setImgheight(getImgheight());
			work.setImgseq(getImgseq());
			work.setCreateDate(new Date());
			pm.makePersistent(work);
			addActionError("新增成功.");

		} catch (Exception e) {
			log.info(e.toString());
			addActionError("新增失敗.");
		} finally {
			pm.close();
		}
		return SUCCESS;
	}

	public String updateWork() {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Key k = KeyFactory.createKey(Work.class.getSimpleName(), Integer.parseInt(id));
			Work work = pm.getObjectById(Work.class, k);
			work.setTitle(getTitle());
			work.setImgurl(getImgurl());
			work.setImgwidth(getImgwidth());
			work.setImgheight(getImgheight());
			work.setImgseq(getImgseq());
			pm.makePersistent(work);
			addActionError("修改成功.");

		} catch (Exception e) {
			log.info(e.toString());
			addActionError("修改失敗.");
		} finally {
			pm.close();
		}
		return SUCCESS;
	}

	public String delwork() {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Key k = KeyFactory.createKey(Work.class.getSimpleName(), Integer.parseInt(id));
			Work work = pm.getObjectById(Work.class, k);
			pm.deletePersistent(work);
			addActionError("刪除成功.");

		} catch (Exception e) {
			log.info(e.toString());
			addActionError("刪除失敗.");
		} finally {
			pm.close();
		}
		return SUCCESS;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
