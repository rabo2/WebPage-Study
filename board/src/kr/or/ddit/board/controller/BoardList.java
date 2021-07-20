package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import oracle.net.aso.s;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/List")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 데이터 포함시
		request.setCharacterEncoding("utf-8");
		
		//0. 요청 데이터 받기 - page
		int spage = 1;
		spage = Integer.parseInt(request.getParameter("page"));
		
		//한 화면에 출력할 페이지의 수
		BoardServiceImpl service = BoardServiceImpl.getInstance();
		
		//한화면에 출력할 페이지의 수
		int perPage = 2;

		//한 페이지에 출력할 글의 갯수
		int perList = 5;
		
		//전체 글 갯수 조회
		int count = service.countList();
		
		//전체 페이지 수 = 전체 글 갯수/perList
		int totalPage = (int) Math.ceil((double)count/(double)perList);
		
		//각 페이지 별 게시글의 start, end
		//현재 페이지의 게시글(perList) 갯수 : 5
		//if 현재 페이지가 1일 때 : (1-1)*5 + 1
		//if 현재 페이지가 2일 때 : (2-1)*5 + 6
		int start = (spage -1)*perList + 1;
		
		//if 현재 페이지 1일 때 1+5-1 = 6
		//if 현재 페이지 2일 때 6+5-1 = 10
		//if 현재 페이지 3일 때 11+5-1 = 15...
		
		int end = start + perList -1;
		
		if(end > count)end = count;
		
		//페이지 번호
		int startPage = ((spage-1)/perPage * perPage)+1;
		
		//if 현재 페이지 1일 때 : 1 + 2 -1 = 2
		int endPage = startPage + perPage -1;
		if(endPage >  totalPage) endPage = totalPage;
		
		
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<BoardVO> list = service.boardList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		request.getRequestDispatcher("board/list.jsp").forward(request, response);
	}

}
