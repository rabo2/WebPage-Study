package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdDao {

	public List<ProdVO> prodNames(String prod_lgu) throws SQLException;
	
	/**
	 * prod 상세정보 검색
	 * @param prod_id
	 * @return
	 */
	public ProdVO prodDetail(String prod_id) throws SQLException;
}
