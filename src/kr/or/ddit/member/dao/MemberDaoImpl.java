package kr.or.ddit.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.BuildedSqlMapClient;

public class MemberDaoImpl implements IMemberDao {
	private static MemberDaoImpl dao;
	private SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	@Override
	public String memCheck(String mem_id) throws SQLException {
		return (String) smc.queryForObject("mem.memCheck", mem_id);
	}

}
