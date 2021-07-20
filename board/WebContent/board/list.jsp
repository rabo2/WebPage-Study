<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");

int sPage = (Integer)request.getAttribute("startPage");
int ePage = (Integer)request.getAttribute("endPage");
int ttPage = (Integer)request.getAttribute("totalPage");
%>
{
 "sp" : "<%= sPage %>",
 "ep" : "<%= ePage %>",
 "tp" : "<%= ttPage %>",
 "datas" : [
<%
	int i = 0;
	for(BoardVO vo : list){
		if(i>0)out.print(",");
%>
	{
		"num" : "<%=vo.getNum() %>",
		"subject" : "<%=vo.getSubject() %>",
		"writer" : "<%=vo.getWriter() %>",
		"mail" : "<%=vo.getMail() %>",
		"cont" : "<%=vo.getContent().replace("\r", "").replace("\n", "<br>") %>",
		"hit" : "<%=vo.getHit() %>",
		"wdate" : "<%=vo.getWdate() %>"
	}
<%
	i++;
	}//for end
%>
 ]
}