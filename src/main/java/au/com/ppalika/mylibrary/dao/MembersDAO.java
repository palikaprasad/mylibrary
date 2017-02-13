package au.com.ppalika.mylibrary.dao;

import java.util.List;

import au.com.ppalika.mylibrary.model.Member;
import au.com.ppalika.mylibrary.model.MemberBooks;

/**
 * @author ppalika
 * 
 * Data access interface for Memeber Entity.
 */
public interface MembersDAO {
	List<Member> findAll();
	MemberBooks getBooksByMemberId(String memberId);
}
