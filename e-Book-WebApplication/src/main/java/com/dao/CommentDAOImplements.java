package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;


public class CommentDAOImplements implements CommentDao{
	
	private Connection conn;
	public  CommentDAOImplements(Connection conn) {
		this.conn=conn;
		
	}
	
	
	public boolean getComment(Contact contact) {
		boolean f= false;
		
		try {
			String sqlInsert ="insert into contact(firstName,lastName,email,comment) value(?,?,?,?)";
			PreparedStatement ps =conn.prepareStatement(sqlInsert);
			
			ps.setString(1, contact.getFirstName());
			ps.setString(2, contact.getLastName());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getComment());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}


	public List<Contact> viewAllComments() {
		ArrayList<Contact> list = new ArrayList<Contact>();
		
		try {
			
			String sql4ViewComment = "select * from contact";
			PreparedStatement ps = conn.prepareStatement(sql4ViewComment);

			ResultSet rs =  ps.executeQuery();
			while(rs.next()) {
				
				Contact viewComment = new Contact();
				
				viewComment.setFirstName(rs.getString(2));
				viewComment.setLastName(rs.getString(3));
				viewComment.setEmail(rs.getString(4));
				viewComment.setComment(rs.getString(5));
				
				list.add(viewComment);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	

}
