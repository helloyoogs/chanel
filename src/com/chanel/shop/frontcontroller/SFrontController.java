package com.chanel.shop.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanel.shop.command.Command;
import com.chanel.shop.command.OModifyCommand;
import com.chanel.shop.command.CDeleteCommand;
import com.chanel.shop.command.CContentCommand;
import com.chanel.shop.command.SCListCommand;
import com.chanel.shop.command.CModifyCommand;
import com.chanel.shop.command.CWriteCommand1;
import com.chanel.shop.command.CWriteCommand2;
import com.chanel.shop.command.CWriteCommand3;
import com.chanel.shop.command.CWriteCommand4;
import com.chanel.shop.command.CWriteCommand5;
import com.chanel.shop.command.SContentCommand;
import com.chanel.shop.command.SDeleteCommand;
import com.chanel.shop.command.SListCommand;
import com.chanel.shop.command.SModifyCommand;
import com.chanel.shop.command.SWriteCommand;

/**
 * Servlet implementation class BFrontController
 */
@WebServlet("*.do")
public class SFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("uri="+uri);
		System.out.println("conPath="+conPath);
		System.out.println("com="+com);
		
		//관리자용
	if(com.contains("/s_manager/list.do")) {
			command = new SListCommand();
			command.execute(request, response);
			viewPage = "/s_manager/list.jsp";
		} else if(com.contains("/s_manager/content_view.do")) {
			command = new SContentCommand();
			command.execute(request, response);
			viewPage="/s_manager/content_view.jsp";
		} else if(com.contains("/s_manager/modify.do")) {
			command = new SModifyCommand();
			command.execute(request, response);
			viewPage = "/s_manager/list.do"; //수정 완료 후 목록으로 돌아가기 위함
		} else if(com.contains("/s_manager/write_view.do")) {
			viewPage="/s_manager/write_view.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/s_manager/write.do")) {
			command = new SWriteCommand();
			command.execute(request, response);
			viewPage="/s_manager/list.do";
		} else if(com.contains("/s_manager/delete.do")) {
			command = new SDeleteCommand();
			command.execute(request, response);
			viewPage = "/s_manager/list.do";
		} 
	
		else if(com.contains("/s_manager/total_list.do")) {
			command = new SCListCommand();
			command.execute(request, response);
			viewPage = "/s_manager/total_list.jsp";
			} //관리자 전체 리스트 보기
	
	
	
		
		// 유저용
		else if(com.contains("/cart/cart.do")) {
			command = new SCListCommand();
			command.execute(request, response);
			viewPage = "/cart/cart.jsp";
		} //장바구니 리스트 부분

		else if (com.contains("/cart/content_view.do")) {
			command = new CContentCommand();
			command.execute(request, response);
			viewPage = "/cart/content_view.jsp";
		} else if (com.contains("/cart/modify.do")) {
			command = new CModifyCommand();
			command.execute(request, response);
			viewPage = "/cart/cart.do"; // 수정 완료 후 목록으로 돌아가기 위함
		} //장바구니 수정 
		
	else if(com.contains("/cart/flat.do")) {
			viewPage="/cart/flat.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/cart/write1.do")) {
			command = new CWriteCommand1();
			command.execute(request, response);
			viewPage="/cart/flat.do";
		} //장바구니 write 담기 - flat
		else if(com.contains("/cart/mary.do")) {
			viewPage="/cart/mary.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/cart/write2.do")) {
			command = new CWriteCommand2();
			command.execute(request, response);
			viewPage="/cart/mary.do";
		} //장바구니 write 담기 - mary
		else if(com.contains("/cart/sneakers.do")) {
			viewPage="/cart/sneakers.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/cart/write3.do")) {
			command = new CWriteCommand3();
			command.execute(request, response);
			viewPage="/cart/sneakers.do";
		} //장바구니 write 담기 - sneakers
		else if(com.contains("/cart/pump.do")) {
			viewPage="/cart/pump.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/cart/write4.do")) {
			command = new CWriteCommand4();
			command.execute(request, response);
			viewPage="/cart/pump.do";
		} //장바구니 write 담기 - pump
		else if(com.contains("/cart/sandle.do")) {
			viewPage="/cart/sandle.jsp"; //데이터를 따로 넘기진 않고, write_view.jsp로 이동
		} else if(com.contains("/cart/write5.do")) {
			command = new CWriteCommand5();
			command.execute(request, response);
			viewPage="/cart/sandle.do";
		} //장바구니 write 담기 - sandle
		
		else if(com.contains("/cart/Cdelete.do")) {
				command = new CDeleteCommand();
				command.execute(request, response);
				viewPage = "/cart/cart.do";
		} //장바구니 삭제
	
	
	
	
	//구매용
		else if(com.contains("/cart/order.do")) {
		command = new SCListCommand();
		command.execute(request, response);
		viewPage = "/cart/order.jsp";
		} //결제로 변경하는 페이지1

		else if (com.contains("/cart/content_view.do")) {
			command = new CContentCommand();
			command.execute(request, response);
			viewPage = "/cart/content_view.jsp";
		} else if (com.contains("/cart/order_modify.do")) {
			command = new OModifyCommand();
			command.execute(request, response);
			viewPage = "/cart/order.do"; // 수정 완료 후 목록으로 돌아가기 위함
		} //결제로 변경하는 페이지2
	
		else if(com.contains("/cart/order_list.do")) {
		command = new SCListCommand();
		command.execute(request, response);
		viewPage = "/cart/order_list.jsp";
		} //구매목록 리스트
	


		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); 
		dispatcher.forward(request, response);
	}
	
	

}

