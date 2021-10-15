package com.db;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
	private static Connection conn;

	public static Connection getConn() 
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-webapp", "root", "Lalit99@");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return conn;
	}

}
