package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;

public class CModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cId = request.getParameter("cId");
		String cQuantity = request.getParameter("cQuantity");
		String cPriceAll = request.getParameter("cPriceAll");
		String cPayment = request.getParameter("cPayment");
		
		SDao dao = new SDao(); //import하기. 서로 다른 패키지 안에 있다.
		dao.modify(cId, cQuantity,cPriceAll,cPayment);
	}

}
