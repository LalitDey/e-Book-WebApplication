package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAOImpliments;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/edit_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			UserDAOImpliments dao= new UserDAOImpliments(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			boolean f = dao.checkPassword(id, password);
			User us = new User();
			
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			if(f) {
				
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "Successfully Your data Update");
					resp.sendRedirect("editprofile.jsp");
				}
				else {
					
					session.setAttribute("error", "Something Wrong..");
					resp.sendRedirect("editprofile.jsp");
				}
				
			}
			else {
				session.setAttribute("error", "Password is Incorrect..");
				resp.sendRedirect("editprofile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	

}
