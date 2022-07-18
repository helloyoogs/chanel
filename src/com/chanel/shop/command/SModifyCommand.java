package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;

public class SModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sId = request.getParameter("sId");
		String sName = request.getParameter("sName");
		String sImg = request.getParameter("sImg");
		String sSize = request.getParameter("sSize");
		String sPrice = request.getParameter("sPrice");
		String sStock = request.getParameter("sStock");	
		String memberId = request.getParameter("memberId");	
		
		SDao dao = new SDao(); //import하기. 서로 다른 패키지 안에 있다.
		dao.modify(sId, sName, sImg, sSize, sPrice, sStock,memberId);
	}

}
