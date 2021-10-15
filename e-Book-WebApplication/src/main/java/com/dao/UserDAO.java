package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDAO 
{
	public boolean userRegister(User  user);
	
	public User login(String email,String password);
	
	public boolean checkPassword(int id,String pass);
	
	public boolean updateProfile(User us);
	
	public List<User> getAllUser();
}
