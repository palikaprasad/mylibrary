package au.com.ppalika.mylibrary.model;

import java.util.List;

public class MemberBooks {
	
	String memberId;
	List<Book> booksLent;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public List<Book> getBooksLent() {
		return booksLent;
	}
	public void setBooksLent(List<Book> booksLent) {
		this.booksLent = booksLent;
	}
	public MemberBooks(String memberId, List<Book> booksLent) {
		super();
		this.memberId = memberId;
		this.booksLent = booksLent;
	}
	public MemberBooks() {
		super();
	}
	
}
