package com.chanel.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;
import com.chanel.shop.dto.SCDto;

public class SCListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memberId = request.getParameter("memberId"); //get방식으로 url에 실어서 보냈음
				
		SDao dao = new SDao(); //db연결 객체 만듦
		ArrayList<SCDto> dtos = dao.cart(memberId);
		ArrayList<SCDto> dtos1 = dao.order_list(memberId);
		ArrayList<SCDto> dtos2 = dao.total_list();
		request.setAttribute("cart", dtos);
		request.setAttribute("order", dtos);
		request.setAttribute("order_list", dtos1);
		request.setAttribute("total_list", dtos2);

		

	}

}
