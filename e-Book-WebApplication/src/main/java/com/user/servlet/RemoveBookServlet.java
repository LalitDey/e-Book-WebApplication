package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAOImplements;
import com.db.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImplements dao= new CartDAOImplements(DBConnect.getConn());
		boolean f=dao.deleteBook(bid,uid,cid);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg","Removed");
			resp.sendRedirect("checkout.jsp");
		}
		else {
			session.setAttribute("error","Something Wrong");
			resp.sendRedirect("checkout.jsp");
		}
	}
	
	
	

}
