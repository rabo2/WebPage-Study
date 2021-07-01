<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 1. Driver Class 로딩 -> 객체생성 -> DriverManager에 등록
	// Class.forName()메소드를 통해 DriverManager 생성
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 2. Connection객체 -> DB Connection연결
	// DriverManager클래스 : JDBC드라이버를 통해 Connection을 만드는 역할
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "KMS96", "java");

	// 3. SQL문장을 실행하기 위한 객체 - Statement
	// 실제 DB에 쿼리를 보내기 위해 필요한 객체
	// 이 객체는 Connection 객체의 연결정보를 가져와 DB에 접근하므로 이 객체의 사용전에 Connection객체가 먼저 존재해야 함
	Statement stmt = conn.createStatement();

	// 4. SQL문 작성
	String sql = "select mem_id, mem_name, mem_hp from member";

	// 5. 실행 - ResultSet으로 리턴
	// executeQuery(String sql)을 통해 쿼리를 실행하면 ResultSet타입으로 반환해 결과값을 저장 - select문 실행시 사용
	ResultSet rs = stmt.executeQuery(sql);

	// 6. 결과 가져오기
%>
[
<%
	int i = 0;

	while (rs.next()) {

		String id = rs.getString("mem_id");
		String name = rs.getString("mem_name");
		String hp = rs.getString("mem_hp");

		// json데이터 생성
		if (i > 0)
			out.print(",");
%>
{ 
	"mid" : "<%=id%>", 
	"mname" : "<%=name%>", 
	"mhp" : "<%=hp%>" 
}
<%
	i++;
	} // while문 종료
%>

]
