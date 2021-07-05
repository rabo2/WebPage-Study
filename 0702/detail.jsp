<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.BuildedSqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("id");
	SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();
	MemberVO vo = (MemberVO)smc.queryForObject("mem.detail",mid);
%>
{
	"id" : "<%=vo.getMem_id() %>",
	"hp" : "<%=vo.getMem_hp() %>",
	"mail" : "<%=vo.getMem_mail() %>"
}
