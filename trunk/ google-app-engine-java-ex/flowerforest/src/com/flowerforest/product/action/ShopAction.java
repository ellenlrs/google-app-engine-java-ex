package com.flowerforest.product.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.flowerforest.product.CarItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShopAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4995868667291384983L;
	private static final Logger log = Logger.getLogger(ShopAction.class.getName());
	private String itemNo;
	private String itemNm;
	private String spec1;
	private String spec2;
	private String price;
	private String qty;
	private String sells;
	private ArrayList carItemList;
	private String func;

	// private ServletContext servletContext;

	public String shop() throws Exception {
		log.info("itemNo:" + itemNo);
		log.info("itemNm:" + itemNm);
		log.info("spec1:" + spec1);
		log.info("spec2:" + spec2);
		log.info("price:" + price);
		log.info("qty:" + qty);
		log.info("sells:" + sells);
		log.info("func:" + func);

		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(
				ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();

		String sellsNo = StringUtils.defaultString(request.getParameter("sells"));

		if (StringUtils.defaultString(func).equals("REMOVEALL")) {// 全部清除
			carItemList = (ArrayList) session.getAttribute(sellsNo);
			if (carItemList != null) {
				carItemList.removeAll(carItemList);
			}
			session.removeAttribute("itemSeq");
			session.removeAttribute(sellsNo);
		} else if (StringUtils.defaultString(request.getParameter("func")).equals("REMOVE")) {// 刪除購物車
			carItemList = (ArrayList) session.getAttribute(sellsNo);
			if (carItemList != null) {
				for (int i = 0; i < carItemList.size(); i++) {
					CarItem item = (CarItem) carItemList.get(i);
					if (item.getSeqno() == Integer.parseInt(request.getParameter("removeSeqno"))) {
						carItemList.remove(i);
						break;
					}
				}
			}
			session.setAttribute("itemSeq", session.getAttribute("itemSeq"));
			session.setAttribute(sellsNo, carItemList);
			request.setAttribute("car", carItemList);
		} else {

			// HttpServletRequest request = null;
			// HttpSession session = request.getSession();
			// String sellsNo = StringUtils.defaultString(request.getParameter("sells"));

			carItemList = (ArrayList) session.getAttribute(sellsNo);
			CarItem carItem = new CarItem();
			// log.info("CharaEncoding:" + request.getCharacterEncoding());
			// log.info("getContentType:" + request.getContentType());
			// log.info("getHeader:" + request.getHeader("Content-Type"));
			// for (Enumeration enum1 = request.getHeaderNames(); enum1.hasMoreElements();) {
			// String headerName = (String) enum1.nextElement();
			// log.info("Name = " + headerName + ";header:" + request.getHeader(headerName));
			// }
			try {
				carItem.setItemNm(java.net.URLDecoder.decode(StringUtils.defaultString(itemNm), "Utf-8"));
				carItem.setItemNo(java.net.URLDecoder.decode(StringUtils.defaultString(itemNo), "Utf-8"));
				carItem.setPrice(StringUtils.defaultString(price));
				carItem.setQty(StringUtils.defaultString(qty));
				carItem.setSpec1(java.net.URLDecoder.decode(StringUtils.defaultString(spec1), "Utf-8"));
				carItem.setSpec2(java.net.URLDecoder.decode(StringUtils.defaultString(spec2), "Utf-8"));
				int seqno = 1;
				if (carItemList == null) {
					carItemList = new ArrayList();
					carItem.setSeqno(seqno);
				} else {
					try {
						seqno = (Integer) session.getAttribute("itemSeq");
					} catch (Exception e2) {
						seqno = 1;
					}
					seqno++;
					carItem.setSeqno(seqno);
				}
				carItemList.add(carItem);
				session.setAttribute("itemSeq", seqno);
				session.setAttribute(sellsNo, carItemList);
				request.setAttribute("car", carItemList);
				// }
				request.setAttribute("sells", sells);
				log.info("carItemList.size():::" + carItemList.size());
				String sellsNoFromSession = ObjectUtils.toString(session.getAttribute("icSells"));
				String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
				String memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}

	public String getSpec1() {
		return spec1;
	}

	public void setSpec1(String spec1) {
		this.spec1 = spec1;
	}

	public String getSpec2() {
		return spec2;
	}

	public void setSpec2(String spec2) {
		this.spec2 = spec2;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getSells() {
		return sells;
	}

	public void setSells(String sells) {
		this.sells = sells;
	}

	public ArrayList getCarItemList() {
		return carItemList;
	}

	public void setCarItemList(ArrayList carItemList) {
		this.carItemList = carItemList;
	}

	public String getFunc() {
		return func;
	}

	public void setFunc(String func) {
		this.func = func;
	}
}
