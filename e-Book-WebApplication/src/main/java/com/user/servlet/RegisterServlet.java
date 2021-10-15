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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			//System.out.println(name +" "+email+" "+phno +" "+password+" "+check);
			User user = new User();
			user.setName(name);
			user.setEmail(email);;
			user.setPhno(phno);
			user.setPassword(password);
			
			UserDAOImpliments dao= new UserDAOImpliments(DBConnect.getConn());
			boolean f = dao.userRegister(user);
			
			HttpSession session =req.getSession();
			
			if(check!= null)
			{
				if(f) 
				{
					//System.out.println("User Register Successfully...");
					session.setAttribute("successmsg", "Registration Success");
					resp.sendRedirect("register.jsp");
				}
				else {
					//System.out.println("Something Went Wrong ?");
					session.setAttribute("failedmsg", "Something went wrong on server ?");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				//System.out.println("Please check Terms & Condition...");
				session.setAttribute("failedmsg", "Please check Terms & Condition...");
				resp.sendRedirect("register.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
