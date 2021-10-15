package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDAOImplements;
import com.db.DBConnect;
import com.entity.BookDetails;

@WebServlet("/addOldBook")
@MultipartConfig
public class AddOldBookServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = "Old Book";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail =req.getParameter("user");

			BookDetails b = new BookDetails(bookName, author, price, categories, status, fileName, useremail);

			//		System.out.println(b);
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			

			
			
		//	 System.out.println(path);
			
			boolean f =dao.addBooks(b);
			
			HttpSession session = req.getSession();
			if(f)
			{
				
			/* Insert Image in proper place */
			String path = getServletContext().getRealPath("")+ "book_img";
			
			File file = new File(path);
			part.write(path + File.separator + fileName);
				
				session.setAttribute("SuccessMsg", "Book upload for sell...");
				resp.sendRedirect("sellbook.jsp");
			}
			else
			{
				session.setAttribute("FailedMsg", "Something Went Wrong...");
				resp.sendRedirect("sellbook.jsp");
			}
		

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
