package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAOImpliments implements UserDAO{
	private Connection conn;

	public UserDAOImpliments(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User user) {

		boolean f = false;

		try {
			String sqlins = "insert into user(name,email,phno,password) value(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sqlins);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhno());
			ps.setString(4, user.getPassword());
			
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;
		
		
		try {
			String sqlquery ="select * from user where email =? and password = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlquery);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
		
	}

	@Override
	public boolean checkPassword(int id,String pass) {
		boolean f=false;
		
		try {
			String sqlQueryForCheckPassword = "select * from user where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sqlQueryForCheckPassword);
			ps.setInt(1, id);
			ps.setString(2,pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				f=true;
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		
		boolean f = false;
		
		try {
			String sqlQueryForUpdateProfile = "update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sqlQueryForUpdateProfile);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			
			int i = ps.executeUpdate();
			if(i ==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<User> getAllUser() {
		
		ArrayList< User> list = new ArrayList<User>();

		try {
			String sql4AllUser = "select * from user";
			PreparedStatement ps = conn.prepareStatement(sql4AllUser);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				User user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhno(rs.getString(4));
				
				list.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	
	
	

}
