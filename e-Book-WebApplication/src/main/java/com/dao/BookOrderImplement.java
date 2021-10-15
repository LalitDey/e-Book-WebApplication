package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;


public class BookOrderImplement implements BookOrderDAO{
	
	private Connection conn;

	public BookOrderImplement(Connection conn) {
		super();
		this.conn = conn;
	}



	public boolean saveOrder(List<BookOrder> blist) {
		boolean f = false;
		
		
		try {
			
			String sqlQuery = "insert into bookorder(oder_id,user_name,email,address,phone,book_name,author,price,payment) value(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			
			for(BookOrder b:blist) {
				
				ps.setString(1, b.getOder_id());
				ps.setString(2, b.getUser_name());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAdd());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBook_name());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				
				ps.addBatch();
				
				
			}
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}




	public List<BookOrder> getBooks(String email) {
		List<BookOrder> list =new ArrayList<BookOrder>();
		BookOrder bo = null;
		
		try {
			String sqlQuery="select * from bookorder where email=?";
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				bo=new BookOrder();
				bo.setId(rs.getInt(1));
				bo.setOder_id(rs.getString(2));
				bo.setUser_name((rs.getString(3)));
				bo.setEmail(rs.getString(4));
				bo.setFullAdd(rs.getString(5));
				bo.setPhone(rs.getString(6));
				bo.setBook_name(rs.getString(7));
				bo.setAuthor(rs.getString(8));
				bo.setPrice(rs.getString(9));
				bo.setPaymentType(rs.getString(10));
				bo.setOrder_time(rs.getString(11));
				
				list.add(bo);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}




	public List<BookOrder> getAllOrderBooksOnAdminPanel() {
		
		List<BookOrder> list =new ArrayList<BookOrder>();
		
		try {
			
			String sqlForOredredBook = "select * from bookorder";
			PreparedStatement ps = conn.prepareStatement(sqlForOredredBook);
			
			ResultSet  rs = ps.executeQuery();
			
			while(rs.next()) {
				
				BookOrder bo4admin = new BookOrder();
				
				bo4admin.setOder_id(rs.getString(2));
				bo4admin.setUser_name((rs.getString(3)));
				bo4admin.setEmail(rs.getString(4));
				bo4admin.setFullAdd(rs.getString(5));
				bo4admin.setPhone(rs.getString(6));
				bo4admin.setBook_name(rs.getString(7));
				bo4admin.setAuthor(rs.getString(8));
				bo4admin.setPrice(rs.getString(9));
				bo4admin.setPaymentType(rs.getString(10));
				bo4admin.setOrder_time(rs.getString(11));
				
				list.add(bo4admin);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}




	public boolean updateOrderStatus(BookOrder ord) {
		boolean f=false;
		
		try {
			
			String Sql4updateOrder = "update bookorder set id=?,user_name=?,email=?, address=?,phone=?,book_name=?,author=?,price=?,payment=?, order_status=?,order_time=? where oder_id=? ";
			PreparedStatement ps= conn.prepareStatement(Sql4updateOrder);
			//ps.setInt(1, ord.getId());
			ps.setInt(1, ord.getId());
			ps.setString(2, ord.getOrder_status());
			ps.setString(3, ord.getUser_name());
			ps.setString(4, ord.getEmail());
			ps.setString(5, ord.getFullAdd());
			ps.setString(6, ord.getPhone());
			ps.setString(7, ord.getBook_name());
			ps.setString(8, ord.getAuthor());
			ps.setString(9, ord.getPrice());
			ps.setString(10, ord.getPaymentType());
			ps.setString(11, ord.getOrder_time());
			ps.setString(12, ord.getOrder_status());
			
			int i =ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	

}
