package com.chanel.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;
import com.chanel.shop.dto.SDto;

public class SContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sId = request.getParameter("sId"); //get방식으로 url에 실어서 보냈음
		SDao dao = new SDao();//DB연결객체생성
		SDto dto = dao.contentView(sId);
		
		request.setAttribute("content_view", dto);
		request.setAttribute("mary", dto);
		request.setAttribute("sneakers", dto);
		request.setAttribute("pump", dto);
		request.setAttribute("sandle", dto);
		//request.setAttribute("delete_view", dto);

	}

}
