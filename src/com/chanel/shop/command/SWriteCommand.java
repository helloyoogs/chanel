package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;

public class SWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sId = request.getParameter("sId");
		String sName = request.getParameter("sName");
		String sImg = request.getParameter("sImg");
		String sSize = request.getParameter("sSize");
		String sPrice = request.getParameter("sPrice");
		String sStock = request.getParameter("sStock");	
		String memberId = request.getParameter("memberId");	
	
		SDao dao = new SDao();
		dao.write(sId, sName, sImg, sSize, sPrice, sStock,memberId);

	}

}
