package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CommentDAOImplements;
import com.db.DBConnect;
import com.entity.Contact;

@WebServlet("/Comment")
public class ContactServlet extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String fname=req.getParameter("fname");
			String lname=req.getParameter("lname");
			String email = req.getParameter("email");
			String comment =req.getParameter("comment");
			
			Contact ct = new Contact();
			ct.setFirstName(fname);
			ct.setLastName(lname);
			ct.setEmail(email);
			ct.setComment(comment);
			
			CommentDAOImplements dao = new CommentDAOImplements(DBConnect.getConn());
			
			boolean f = dao.getComment(ct);
			
			HttpSession session = req.getSession();
			
			if(email !=null) {
				
				session.setAttribute("msg","Your comment is saved,we reply after sometime!!!");
				resp.sendRedirect("contact.jsp");
				
			}
			else {
				session.setAttribute("errormsg","Something went wrong!!");
				resp.sendRedirect("contact.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
