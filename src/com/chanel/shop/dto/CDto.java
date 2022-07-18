package com.chanel.shop.dto;


public class CDto {
	private int cId;
	private int cQuantity;
	private int cPriceAll;
	private String sId;
	private String memberId;
	
	public CDto(int cId, int cQuantity, int cPriceAll, String sId, String memberId) {
		super();
		this.cId = cId;
		this.cQuantity = cQuantity;
		this.cPriceAll = cPriceAll;
		this.sId = sId;
		this.memberId = memberId;
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
