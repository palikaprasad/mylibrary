package au.com.ppalika.mylibrary.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import au.com.ppalika.mylibrary.dao.MembersDAO;
import au.com.ppalika.mylibrary.model.Book;
import au.com.ppalika.mylibrary.model.Member;
import au.com.ppalika.mylibrary.model.MemberBooks;

/**
 * @author ppalika
 * 
 * Implementation of Member Entity DAO.
 */
@Repository
public class MembersDAOImpl implements MembersDAO {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	/**
	 * 
	 * @return List of all Members from Database
	 */
	@Override
	public List<Member> findAll() {
		String sql = "SELECT * FROM members";
        List<Member> result = namedParameterJdbcTemplate.query(sql, new MemberRowMapper());
		return result;
	}

	
	/**
	 * @param memeberId
	 * @return all books lent by give member
	 */
	@Override
	public MemberBooks getBooksByMemberId(String memberId) {
		MemberBooks memberBooks=new MemberBooks();
		memberBooks.setMemberId(memberId);
		String sql = "SELECT * FROM books where id in( select bookId from member_book_rel where memberId = '" + memberId + "')";
		List<Book> booksLent = namedParameterJdbcTemplate.query(sql, new BookRowMapper());
		memberBooks.setBooksLent(booksLent);
		return memberBooks;
	}

}
