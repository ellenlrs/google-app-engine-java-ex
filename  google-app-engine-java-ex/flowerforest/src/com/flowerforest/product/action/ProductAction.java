/**
 * 
 */
package com.flowerforest.product.action;

import java.util.logging.Logger;

import javax.jdo.PersistenceManager;

import org.apache.commons.lang.xwork.StringUtils;

import com.db.PMF;
import com.flowerforest.product.Product;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ellen.li
 * 
 */
public class ProductAction extends ActionSupport {

	/**
	 * serial no
	 */
	private static final long serialVersionUID = 1987094193891643182L;
	private static final Logger log = Logger.getLogger(ProductAction.class.getName());
	private String title;// 名稱
	private String size;// 尺寸
	private String desc;// 敘述
	private String spec;// 規格
	private String accessories;// 配件
	private String explain;// 說明
	private String distribution;// 配送
	private String memo;// 備註
	private String price;// 價格

	/**
	 * 
	 */
	public ProductAction() {
		// TODO Auto-generated constructor stub
	}

	public String insertFlower() {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Product product = new Product();
			product.setTitle(getTitle());
			if (StringUtils.isNotBlank(getPrice()))
				product.setPrice(Integer.parseInt(getPrice()));
			product.setSize(getSize());
			product.setDesc(getDesc());
			product.setSpec(getSpec());
			product.setAccessories(getAccessories());
			product.setExplain(getExplain());
			product.setDistribution(getDistribution());
			product.setMemo(getMemo());
			pm.makePersistent(product);
			addActionMessage("新增商品成功.");
			return SUCCESS;
		} catch (Exception e) {
			log.info(e.toString());
			addActionError("新增商品失敗.");
			return INPUT;
		} finally {
			pm.close();
		}

	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getAccessories() {
		return accessories;
	}

	public void setAccessories(String accessories) {
		this.accessories = accessories;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getDistribution() {
		return distribution;
	}

	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
}
