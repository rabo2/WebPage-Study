<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.BuildedSqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("id");
String userPw = request.getParameter("pw");
SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();

Map<String, String> map = new HashMap<String, String>();

map.put("mid", userId);
map.put("mpw", userPw);
MemberVO vo =  (MemberVO)smc.queryForObject("mem.login",map);
if(vo != null){
%>

{
"sw" : "OK",
"name" : "<%=vo.getMem_name() %>"
}

<%
}else{
%>
{
	"sw : "no"
}
<%
}
%>