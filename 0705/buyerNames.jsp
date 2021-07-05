<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.BuildedSqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();
List<BuyerVO> liset = smc.queryForList("mem.buyer");	

%>
