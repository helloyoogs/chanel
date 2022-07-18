package com.hds.app.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hds.app.action.Action;
import com.hds.app.action.ActionForward;
import com.hds.app.board.dao.BoardDAO;
import com.hds.app.board.vo.BoardVO;
import com.hds.app.files.dao.FilesDAO;
import com.hds.app.files.vo.FilesVO;

public class BoardViewOk implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		//System.out.println("BoardViewOk 1");

		FilesDAO fDao = new FilesDAO();
		ActionForward forward = new ActionForward();

		//System.out.println("BoardViewOk 2");

		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		//req.setAttribute("board", bDao.getDetail(boardNum));
		
		//System.out.println("1");
		//System.out.println("null check");
		//System.out.println("null? " + (bDao.getBoardList()==null)   );
		//BoardDAO.getBoardList().indexof
		for(BoardVO getDetail : BoardDAO.getBoardList()) {
			if(getDetail.getBoardNum() == boardNum) {
				req.setAttribute("board", getDetail);		
				break;
			}
		}
		//BoardVO temp = new BoardVO();
		//temp.setBoardNum(boardNum);
		//req.setAttribute("board", BoardDAO.getBoardList().indexOf(temp));	

		//System.out.println("BoardViewOk 3");
		//System.out.println("2");
		req.setAttribute("files", fDao.getFiles(boardNum));
		fDao.Close();
		//System.out.println("BoardViewOk 4");
		BoardDAO bDao = new BoardDAO();		
		bDao.updateReadCount(boardNum);
		//System.out.println("BoardViewOk 5");
		bDao.Close();
		forward.setRedirect(false);
		forward.setPath("/app/board/boardView.jsp");

		//System.out.println("BoardViewOk 6");
		return forward;
	}
}










