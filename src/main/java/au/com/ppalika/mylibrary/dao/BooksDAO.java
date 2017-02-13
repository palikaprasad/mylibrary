package au.com.ppalika.mylibrary.dao;

import java.util.List;

import au.com.ppalika.mylibrary.model.Book;

/**
 * @author ppalika
 * 
 * Data access interface for Book Entity.
 */
public interface BooksDAO {
	
	/**
	 * 
	 * @return List of all books
	 */
	List<Book> findAll();

}
