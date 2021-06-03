<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String nm = request.getParameter("name");
	String tel = request.getParameter("tel");
	String area = request.getParameter("ttarea");
	String cars = request.getParameter("cars");
	
	area = area.replaceAll("\r", "").replaceAll("\n", "<br>");
	%>
	<%="이름 : "+nm %><br>
	<%="전화번호 : "+tel %><br>
	<%=area %><br>
	<%=cars %><br>
	
	
</body>
</html>