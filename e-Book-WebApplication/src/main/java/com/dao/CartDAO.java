package com.dao;

import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public interface CartDAO {
	
	public boolean addToCart(Cart c);
	
	public List<Cart> getBookByUser(int UserId);
	public boolean deleteBook(int bid , int uid, int cid);

}
