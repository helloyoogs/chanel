package com.chanel.shop.dto;

public class SDto {
	private String sId;
	private String sName;
	private String sImg;
	private int sSize;
	private int sPrice;
	private int sStock;
	private String memberId;
	
	public SDto(String sId, String sName, String sImg, int sSize, int sPrice, int sStock, String memberId) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sImg = sImg;
		this.sSize = sSize;
		this.sPrice = sPrice;
		this.sStock = sStock;
		this.memberId = memberId;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	


}
