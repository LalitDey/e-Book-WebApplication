package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderImplement;
import com.db.DBConnect;
import com.entity.BookOrder;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

@WebServlet("/updateOrderStatus")
public class OrderStatusServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String order_id =req.getParameter("order_id") ;
			String Status = req.getParameter("orderStatus");
			
			BookOrder bo = new BookOrder();
			bo.setOder_id(order_id);
			bo.setOrder_status(Status);
			
			
			BookOrderImplement dao = new BookOrderImplement(DBConnect.getConn());
			
			boolean f = dao.updateOrderStatus(bo);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("msg", "Order-Status Updated");
				resp.sendRedirect("order.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
