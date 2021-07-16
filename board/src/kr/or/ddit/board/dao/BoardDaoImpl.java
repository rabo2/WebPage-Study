package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.ibatis.config.BuildedSqlMapClient;

public class BoardDaoImpl implements IBoardDao {
	private SqlMapClient smc;
	private static BoardDaoImpl dao;
	
	private BoardDaoImpl() {
		smc = new BuildedSqlMapClient().getSqlMapClient();
	}
	
	public static BoardDaoImpl getInstance() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		return (Integer)smc.insert("board.insertBoard", vo);
	}
	
	@Override
	public int countList() throws SQLException{
		return (int) smc.queryForObject("board.countList");
		
	}

	@Override
	public List<BoardVO> boardList(Map<String, Integer> map) throws SQLException {
		return smc.queryForList("board.boardList", map);
	}

	@Override
	public int insertReply(ReplyVO vo) throws SQLException {
		return (int) smc.insert("board.insertReply", vo);
	}

	@Override
	public List<ReplyVO> getAllReply(int bonum) throws SQLException{
		return smc.queryForList("board.getAllReply",bonum);
	}
}
