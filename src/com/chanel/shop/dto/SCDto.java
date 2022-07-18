package com.chanel.shop.dto;

import java.sql.Timestamp;

public class SCDto {
	private String sName;
	private String sImg;
	private int sSize;
	private int sPrice;
	private int sStock;
	
	private int cId;
	private int cQuantity;
	private int cPriceAll;
	private String cPayment;
	Timestamp cDate;
	private String sId;
	private String memberId;
	
	public SCDto(String sName, String sImg, int sSize, int sPrice, int sStock, int cId, int cQuantity, int cPriceAll,
			String cPayment, Timestamp cDate, String sId, String memberId) {
		super();
		this.sName = sName;
		this.sImg = sImg;
		this.sSize = sSize;
		this.sPrice = sPrice;
		this.sStock = sStock;
		this.cId = cId;
		this.cQuantity = cQuantity;
		this.cPriceAll = cPriceAll;
		this.cPayment = cPayment;
		this.cDate = cDate;
		this.sId = sId;
		this.memberId = memberId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	public int getsSize() {
		return sSize;
	}

	public void setsSize(int sSize) {
		this.sSize = sSize;
	}

	public int getsPrice() {
		return sPrice;
	}

	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}

	public int getsStock() {
		return sStock;
	}

	public void setsStock(int sStock) {
		this.sStock = sStock;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getcQuantity() {
		return cQuantity;
	}

	public void setcQuantity(int cQuantity) {
		this.cQuantity = cQuantity;
	}

	public int getcPriceAll() {
		return cPriceAll;
	}

	public void setcPriceAll(int cPriceAll) {
		this.cPriceAll = cPriceAll;
	}

	public String getcPayment() {
		return cPayment;
	}

	public void setcPayment(String cPayment) {
		this.cPayment = cPayment;
	}

	public Timestamp getcDate() {
		return cDate;
	}

	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
}
