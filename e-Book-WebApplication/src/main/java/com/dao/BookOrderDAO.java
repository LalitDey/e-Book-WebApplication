package com.dao;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	
	
	
	public boolean saveOrder(List<BookOrder> blist);
	
	public List<BookOrder> getBooks(String email);
	
	public List<BookOrder> getAllOrderBooksOnAdminPanel();
	
	public boolean updateOrderStatus(BookOrder ord);

}
