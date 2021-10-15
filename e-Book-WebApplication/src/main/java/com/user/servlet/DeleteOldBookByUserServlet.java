package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImplements;
import com.db.DBConnect;

@WebServlet("/deleteOldBookByUser")
public class DeleteOldBookByUserServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			int bid=Integer.parseInt(req.getParameter("bid"));
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			
			boolean f=dao.deleteOldBookByUser(email, "Old Book" , bid);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucmsg", "Book Removed");
				resp.sendRedirect("userOLDbook.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Book Not Removed");
				resp.sendRedirect("userOLDbook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
