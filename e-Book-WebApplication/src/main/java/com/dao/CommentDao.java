package com.dao;

import java.util.List;

import com.entity.Contact;

public interface CommentDao {

	public boolean getComment(Contact contact);
	
	public List<Contact> viewAllComments();
}
