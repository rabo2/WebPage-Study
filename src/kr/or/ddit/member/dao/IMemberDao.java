package kr.or.ddit.member.dao;

import java.sql.SQLException;

public interface IMemberDao {
	public String memCheck(String mem_id) throws SQLException;
}
