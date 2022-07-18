package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;
import com.chanel.shop.dto.CDto;

public class CContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cId = request.getParameter("cId"); //get방식으로 url에 실어서 보냈음
		SDao dao = new SDao();//DB연결객체생성
		CDto dto = dao.content_view(cId);
		
		request.setAttribute("content_view", dto);
	}

}
