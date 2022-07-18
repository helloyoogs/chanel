package com.hds.app.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hds.app.action.Action;
import com.hds.app.action.ActionForward;
import com.hds.app.member.dao.MemberDAO;

public class MemberFindPwOk implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		String memberEmail = req.getParameter("memberEmail");
		String memberId = req.getParameter("memberId");
		
		MemberDAO dao = new MemberDAO();
		req.setAttribute("memberPw", dao.findPw(memberEmail, memberId));
		forward.setRedirect(false);
		forward.setPath("/app/member/showPw.jsp");
		
		return forward;
	}
}
