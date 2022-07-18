package com.chanel.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.dao.SDao;
import com.chanel.shop.dto.SDto;

public class SListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		SDao dao = new SDao(); //db연결 객체 만듦
		ArrayList<SDto> dtos = dao.list();
		request.setAttribute("list", dtos);

		

	}

}
