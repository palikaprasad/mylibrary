package au.com.ppalika.mylibrary.dao;

import java.util.List;

import au.com.ppalika.mylibrary.model.Book;

public interface BooksDAO {
	
	List<Book> findAll();

}
