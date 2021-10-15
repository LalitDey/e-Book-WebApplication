package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {
	public boolean addBooks(BookDetails b);
	
	public List< BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails be);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBook();
	
	public List<BookDetails> getAllNewBook();
	
	public List<BookDetails> getAllOldBook();
	
	public List<BookDetails> getBookByOldBookByUser(String email,String category);
	
	public boolean deleteOldBookByUser(String email,String category , int bid);
	
	public List<BookDetails> getBookBySearch(String ch);
	
	
}
