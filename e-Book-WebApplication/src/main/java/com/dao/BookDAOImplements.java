package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.BookDetails;
import com.mysql.cj.xdevapi.Result;

public class BookDAOImplements implements BookDAO {
	private Connection conn;

	public BookDAOImplements(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails b) {
		boolean f = false;
		try {

			String sqlquery = "insert into bookdetails(bookname,author,price,bookCategory,status,photo,email) value(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sqlquery);

			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

/// GET ALL BOOKS IN THE all_books.jsp....

	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {

			String sql = "select * from bookdetails";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public BookDetails getBookById(int id) {

		BookDetails b = null;

		try {

			String sql = "select * from bookdetails where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	//UPDATE QUERY
	

	public boolean updateEditBooks(BookDetails be) {   //be => book-edit 
		boolean f = false;

		try {
			String sql= "update bookdetails set bookname=?,author=?,price=?,status=? where bookid=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, be.getBookName());
			ps.setString(2, be.getAuthor());
			ps.setString(3, be.getPrice());
			ps.setString(4, be.getStatus());
			ps.setInt(5, be.getBookId());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}


	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			
			String sql = "delete from bookdetails where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			
			if (i==1) {
				f=true;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}


	public List<BookDetails> getNewBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		
		BookDetails b=null;
		try {
			
			String sqlquery = "select * from bookdetails where bookCategory = ? and status=? order by bookid DESC" ;
			
			PreparedStatement ps = conn.prepareStatement(sqlquery);
			
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				BookDetails bd = new BookDetails();
				bd.setBookId(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getString(4));
				bd.setBookCategory(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhotoName(rs.getString(7));
				bd.setEmail(rs.getString(8));
				list.add(bd);
				i++;
				
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	


	public List<BookDetails> getRecentBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		
		try {
			String sqlQuery="select * from bookdetails where status = ? order by bookid desc";
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			//ps.setString(1, "Old Book");
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<5)
			{
				BookDetails rb=new BookDetails();
				rb.setBookId(rs.getInt(1));
				rb.setBookName(rs.getString(2));
				rb.setAuthor(rs.getString(3));
				rb.setPrice(rs.getString(4));
				rb.setBookCategory(rs.getString(5));
				rb.setStatus(rs.getString(6));
				rb.setPhotoName(rs.getString(7));
				rb.setEmail(rs.getString(8));
				
				list.add(rb);
				i++;
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
				
				return list;
	}


	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b =null;
		
		
		try {
			String sqlQuery="select * from bookdetails where   bookCategory = ? and status = ? order by bookid desc";
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<5)
			{
				BookDetails ob=new BookDetails();
				ob.setBookId(rs.getInt(1));
				ob.setBookName(rs.getString(2));
				ob.setAuthor(rs.getString(3));
				ob.setPrice(rs.getString(4));
				ob.setBookCategory(rs.getString(5));
				ob.setStatus(rs.getString(6));
				ob.setPhotoName(rs.getString(7));
				ob.setEmail(rs.getString(8));
				
				list.add(ob);
				i++;
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
				
				return list;
	}

//	GET ALL BOOKS IN ANOTHER PAGE ALLRECENT BOOK,ALL OLD BOOK,ALL NEW BOOK
	

	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b =null;
		
		try {
			String allrecentbooksql = "select * from bookdetails where status = ? order by bookid desc";

			PreparedStatement ps = conn.prepareStatement(allrecentbooksql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				BookDetails arb = new BookDetails();
				arb.setBookId(rs.getInt(1));
				arb.setBookName(rs.getString(2));
				arb.setAuthor(rs.getString(3));
				arb.setPrice(rs.getString(4));
				arb.setBookCategory(rs.getString(5));
				arb.setStatus(rs.getString(6));
				arb.setPhotoName(rs.getString(7));
				
				list.add(arb);
				
				
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b =null;
		
		try {
			String allnewbooksql = "select * from bookdetails where bookCategory = ? and status=? order by bookid desc";

			PreparedStatement ps = conn.prepareStatement(allnewbooksql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				BookDetails anb = new BookDetails();
				anb.setBookId(rs.getInt(1));
				anb.setBookName(rs.getString(2));
				anb.setAuthor(rs.getString(3));
				anb.setPrice(rs.getString(4));
				anb.setBookCategory(rs.getString(5));
				anb.setStatus(rs.getString(6));
				anb.setPhotoName(rs.getString(7));
				
				list.add(anb);
				
				
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b =null;
		
		try {
			String alloldbooksql = "select * from bookdetails where bookCategory = ? and status=? order by bookid desc";

			PreparedStatement ps = conn.prepareStatement(alloldbooksql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				BookDetails aob = new BookDetails();
				aob.setBookId(rs.getInt(1));
				aob.setBookName(rs.getString(2));
				aob.setAuthor(rs.getString(3));
				aob.setPrice(rs.getString(4));
				aob.setBookCategory(rs.getString(5));
				aob.setStatus(rs.getString(6));
				aob.setPhotoName(rs.getString(7));
				
				list.add(aob);
				
				
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	public List<BookDetails> getBookByOldBookByUser(String email, String category) {
		{
			List<BookDetails> list = new ArrayList<BookDetails>();
			
			try {
				String sqlQueryForGetUploadOldBookByUser ="select * from bookdetails where bookCategory=? and email=?";
				PreparedStatement ps =conn.prepareStatement(sqlQueryForGetUploadOldBookByUser);
				
				ps.setString(1, category);
				ps.setString(2, email);
				
				ResultSet rs =  ps.executeQuery();
				while(rs.next()) {
					BookDetails	uobu=new BookDetails();
					uobu.setBookId(rs.getInt(1));
					uobu.setBookName(rs.getString(2));
					uobu.setAuthor(rs.getString(3));
					uobu.setPrice(rs.getString(4));
					uobu.setBookCategory(rs.getString(5));
					uobu.setStatus(rs.getString(6));
					uobu.setPhotoName(rs.getString(7));
					
					list.add(uobu);
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
	}

	@Override
	public boolean deleteOldBookByUser(String email, String category,int bid) {
		
		boolean f=false;
		
		try {
			String SqlQueryForDeleteOldBookByUser ="delete from bookdetails where bookid=? and bookCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(SqlQueryForDeleteOldBookByUser);
			ps.setInt(1, bid);
			ps.setString(2, category);
			ps.setString(3, email);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		
		try {
			
			String sqlQueryForSearchBook = "select * from bookdetails  where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sqlQueryForSearchBook);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				
				BookDetails sb = new BookDetails();
				sb.setBookId(rs.getInt(1));
				sb.setBookName(rs.getString(2));
				sb.setAuthor(rs.getString(3));
				sb.setPrice(rs.getString(4));
				sb.setBookCategory(rs.getString(5));
				sb.setStatus(rs.getString(6));
				sb.setPhotoName(rs.getString(7));
				sb.setEmail(rs.getString(8));
				
				list.add(sb);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	
	

}
