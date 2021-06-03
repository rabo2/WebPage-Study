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
	String mail = request.getParameter("email");
	String tel = request.getParameter("tel");
	String date = request.getParameter("date");
	String number = request.getParameter("number");
	String range = request.getParameter("range");
	%>
	
	이메일 : <%=mail %><br>
	전화번호 : <%=tel %><br>
	생년월일 : <%=date %><br>
	넘버 : <%=number %><br>
	레인지 : <%=range %>
</body>
</html>