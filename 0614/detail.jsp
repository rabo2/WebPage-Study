<%@ page import="java.util.Map"%>
<%@ page import="kr.or.ddit.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <style media="screen">
	td {
		width: 200px;
		height: 20px;
		text-align: center;
		padding: 5px;
	}
	
	.t1 td {
		background: yellow;
	}
 </style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	요청시 클라이언트가 보내는 데이터를 받아서 처리한다.(jsp가 controller 역활 수행)
	<br> 자바문장과 html문장을 혼합하여 사용할 수 있다.
	<br> 자바문장을 기술 - &lt;% %>, html문서에서 java 변수를 출력 - &lt;%= %>
	<br>
	
	<%
	//클라이언트 요청시 데이터 값 받음
	String userName = request.getParameter("name");
	
	//service 객체 얻어오기
	MemberService service = MemberService.getInstace();
	
	//service 메소드 호출해서 결과 값 리턴받기
	Map<String, Object> map = service.selectMemberOne(userName);
	
	//결과값 출력
	String id = (String)map.get("id");
	String name = (String)map.get("name");
	String hp = (String)map.get("hp");
	String mail = (String)map.get("mail");
	%>
	
	<%=userName %>

	<table border="1">
		<tr>
			<td><%=id %>아이디</td>
			<td><%=name %>이름</td>
			<td><%=hp %>전화번호</td>
			<td><%=mail %>이메일</td>
		</tr>
	</table>
</body>
</html>