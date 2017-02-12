package au.com.ppalika.mylibrary.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import au.com.ppalika.mylibrary.model.Member;


public class MemberRowMapper implements RowMapper<Member> {
	//Rowmapper for members table to DAO
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member member = new Member();
		member.setId(rs.getInt("id"));
		member.setName(rs.getString("name"));
		member.setPhone(rs.getString("phone"));
		member.setEmail(rs.getString("email"));
		return member;
	}

}
