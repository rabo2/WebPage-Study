<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	<h1>JSP : Java Server Page</h1>
	클라이언트 요청시 데이터를 받아서 처리하고 결과 값을 출력하는 페이지
	
	post요청시 한글 처리를 꼭 해야 한다.
	request.setCharacterEncding("utf-8")
	
	서버 내에서 실행(back-end)되고, 결과만 클라이언트로 응답한다.
	</pre>
	
	<%
	request.setCharacterEncoding("utf-8");
	String nm = request.getParameter("name");
	String gn = request.getParameter("gender");
	String hh = request.getParameter("hidden");
	String ff = request.getParameter("file");
	String[] fd = request.getParameterValues("food");
	
	String str = "";
	for(int i = 0; i < fd.length; i++){
		str = fd[i] +" ";
		
	}
	%>
	<%=nm %>님 환영합니다.<br>
	당신의 성별은 <%=gn %> 이군요<br>	
	<%=hh %><br>
	당신이 좋아하는 음식은<%=str %>이네요 <br>	
	<%=ff %>를 전송하였습니다.

		
</body>
</html>