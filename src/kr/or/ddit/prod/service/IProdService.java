package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdService {

	//메소드 선언
	
	/**
	 * prod 목록 검식 메소드
	 * @param prod_lgu
	 * @return
	 */
	public List<ProdVO> prodNames(String prod_lgu);
	
	public ProdVO prodDetail(String prod_id);
	
	
}
