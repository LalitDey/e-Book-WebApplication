package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImplements;
import com.db.DBConnect;
import com.entity.BookDetails;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bookId = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("bstatus");
			
			BookDetails be = new BookDetails();   //be=> bookedit
			be.setBookId(bookId);
			be.setBookName(bookName);
			be.setAuthor(author);
			be.setPrice(price);
			be.setStatus(status);
			
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			boolean f =dao.updateEditBooks(be);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("SuccessMsg", "Book Updated successfully..");
				resp.sendRedirect("admin/all_books.jsp");
				
			}
			else {
				session.setAttribute("FailedMsg", "Updating Failed..");
				resp.sendRedirect("admin/all_books.jsp");
				
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
