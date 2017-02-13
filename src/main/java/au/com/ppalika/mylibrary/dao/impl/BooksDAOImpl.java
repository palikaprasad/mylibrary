package au.com.ppalika.mylibrary.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import au.com.ppalika.mylibrary.dao.BooksDAO;
import au.com.ppalika.mylibrary.model.Book;

/**
 * @author ppalika
 * 
 * Implementation of Books Entity DAO.
 */
@Repository
public class BooksDAOImpl implements BooksDAO {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	/**
	 * 
	 * @return List of all books from Database
	 */
	@Override
	public List<Book> findAll() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "SELECT * FROM books";
		
        List<Book> result = namedParameterJdbcTemplate.query(sql, params, new BookRowMapper());
		return result;
	}

}
