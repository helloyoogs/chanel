package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;

public class CDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cId = request.getParameter("cId");
		SDao dao = new SDao();
		dao.Cdelete(cId);

	}

}
