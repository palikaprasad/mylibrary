package au.com.ppalika.mylibrary.test;

import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import au.com.ppalika.mylibrary.dao.impl.BooksDAOImpl;
import au.com.ppalika.mylibrary.model.Book;

public class DataAccessUnitTestTemplate {
    private static EmbeddedDatabase db;
    @Before
    public void setUp() {
        // creates a HSQL in-memory db populated from default scripts classpath:schema.sql and classpath:test-data.sql
        // obviously, this is the 'in-code' method, but the xml should work for Spring managed tests.
        EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
		db = builder.setType(EmbeddedDatabaseType.HSQL).addScript("db/sql/create-db.sql").addScript("db/sql/insert-data.sql").build();
    }

    @Test
    public void testBooList() {
    	NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(db);
    	BooksDAOImpl booksDAO = new BooksDAOImpl();
    	booksDAO.setNamedParameterJdbcTemplate(template);
    	
    	List<Book> booksList=booksDAO.findAll();
    	
    	Assert.assertNotNull(booksList);
    	for (Book book : booksList) {
    		Assert.assertNotNull(book);
		}
    }

    @After
    public void tearDown() {
        db.shutdown();
    }


}