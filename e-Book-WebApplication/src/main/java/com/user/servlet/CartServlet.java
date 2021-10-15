package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImplements;
import com.dao.CartDAOImplements;
import com.db.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			BookDetails b= dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImplements dao2= new CartDAOImplements(DBConnect.getConn());
			boolean f = dao2.addToCart(c);
			
			HttpSession session = req.getSession();
			if (f) {
				
				session.setAttribute("Added", "Book Added to Cart");
				resp.sendRedirect("all_new_book.jsp");
				
//				System.out.println("Add Cart success");
			}
			else {
				
				session.setAttribute("NotAdded", "Something went Wrong");
				resp.sendRedirect("all_new_book.jsp");
				
//				System.out.println("Not Added");
			}
			
			
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	}
	
	
	
   

	
	
}
