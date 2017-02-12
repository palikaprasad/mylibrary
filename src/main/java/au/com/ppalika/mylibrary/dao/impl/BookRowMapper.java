package au.com.ppalika.mylibrary.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import au.com.ppalika.mylibrary.model.Book;


public class BookRowMapper implements RowMapper<Book> {
	//Rowmapper for boos table to DAO
	public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
		Book book = new Book();
		book.setId(rs.getInt("id"));
		book.setTitle(rs.getString("title"));
		book.setAuthor(rs.getString("author"));
		book.setISBN(rs.getString("ISBN"));
		return book;
	}

}
