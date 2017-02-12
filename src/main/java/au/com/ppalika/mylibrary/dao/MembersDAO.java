package au.com.ppalika.mylibrary.dao;

import java.util.List;

import au.com.ppalika.mylibrary.model.Member;
import au.com.ppalika.mylibrary.model.MemberBooks;

public interface MembersDAO {
	List<Member> findAll();
	MemberBooks getBooksByMemberId(String memberId);
}
