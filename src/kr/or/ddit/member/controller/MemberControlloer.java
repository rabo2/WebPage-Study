package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Member")
public class MemberControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 데이터 받기
		String mem_id = request.getParameter("mId");
		
		//service객체 얻어오기
		
		
		//service메소드 호출 - 값 얻기
		
		//jsp로 값 전달하기 - foward
		
		
	}
}