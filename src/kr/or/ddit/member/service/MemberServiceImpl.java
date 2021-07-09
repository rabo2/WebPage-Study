package kr.or.ddit.member.service;

import java.sql.SQLException;

import kr.or.ddit.member.dao.MemberDaoImpl;

public class MemberServiceImpl implements IMemberService {
	private static MemberServiceImpl service;
	private MemberDaoImpl dao;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public String memCheck(String mem_id) {
		String memCheck = "";
		try {
			memCheck = dao.memCheck(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memCheck;
	}

}
