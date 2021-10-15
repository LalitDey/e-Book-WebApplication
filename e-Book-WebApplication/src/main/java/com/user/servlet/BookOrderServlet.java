package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderImplement;
import com.dao.CartDAOImplements;
import com.db.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;


@WebServlet("/order")
public class BookOrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		 HttpSession session = req.getSession();
		
		
		try {
			
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("userName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address=req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state=req.getParameter("state");
			String zipcode = req.getParameter("zipcode");
			String paymentType = req.getParameter("paymentType");
			
			
			String fullAdd = address+","+landmark+","+city+","+state+","+zipcode;
			
			CartDAOImplements dao =new CartDAOImplements(DBConnect.getConn());
			 List<Cart> blist= dao.getBookByUser(id);
			
			 if(blist.isEmpty()) {
				
				 session.setAttribute("error", "Please!! Add some items into your cart");
				 resp.sendRedirect("checkout.jsp");
				 
			 }
			 else {
				 
				 BookOrderImplement dao2=new BookOrderImplement(DBConnect.getConn());
				 BookOrder bo=null;
				 
				 
				 ArrayList<BookOrder> orderlist =new ArrayList<BookOrder>();
				 
				 Random rnd = new Random();
				 for(Cart c:blist) {
					
//						System.out.println(c.getBookName()+","+c.getAuthor()+","+c.getPrice());
					bo = new BookOrder();
					bo.setOder_id("BOOK-ORD-00"+rnd.nextInt(1000));
					bo.setUser_name(name);
					bo.setEmail(email);
					bo.setPhone(phone);
					bo.setFullAdd(fullAdd);
					bo.setBook_name(c.getBookName());
					bo.setAuthor(c.getAuthor());
					bo.setPrice(c.getPrice()+"");
					bo.setPaymentType(paymentType);
					bo.setOrder_time(bo.getOrder_time()+"");
					
					orderlist.add(bo);
					

					
				}
//				System.out.println(id+","+name+","+email+","+phone+","+fullAdd);
				
				if("noselect".equals(paymentType)) 
				{
					session.setAttribute("error", "Choose payment method");
					resp.sendRedirect("checkout.jsp");
				}
				else {
					
					
					boolean f=dao2.saveOrder(orderlist);
					if(f)
					{
						resp.sendRedirect("order_success.jsp");
					}
					else {
						session.setAttribute("error", "Your order Failed");
						resp.sendRedirect("checkout.jsp");
					}
					
				}
				
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
