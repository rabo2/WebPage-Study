<%@page import="kr.or.ddit.board.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ReplyVO> list = (List<ReplyVO>) request.getAttribute("list");
%>
[
<%
if (list != null && list.size() > 0) {
	int i = 0;
	for (ReplyVO vo : list) {
		if (i > 0) out.println(",");
%>
	{ 
		"renum" : <%=vo.getRenum()%> 
		"bonum" : <%=vo.getBonum()%>, 
		"name" : <%=vo.getName()%>, 
		"cont" : <%=vo.getCont()%>, 
		"redate" : <%=vo.getRedate()%>, 
	}
<%
	}
}
%>
]
