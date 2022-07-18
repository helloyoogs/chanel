package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;

public class CWriteCommand1 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cQuantity = request.getParameter("cQuantity");
		String cPriceAll = request.getParameter("cPriceAll");
		String sId = request.getParameter("sId");
		String memberId = request.getParameter("memberId");

		SDao dao = new SDao();
		dao.write1(cQuantity,cPriceAll,sId,memberId);
	}

}
