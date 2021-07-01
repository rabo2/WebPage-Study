<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "KMS96", "java");
	String sql = "select lprod_id, lprod_gu, lprod_nm from lprod";
	PreparedStatement statement = conn.prepareStatement(sql);
	ResultSet result = statement.executeQuery();
%>
<table border="1">
  <tr>
	<th>ID</th>
	<th>GU</th>
	<th>NAME</th>
  </tr>
<%
	while (result.next()) {
	  String id = result.getString("lprod_id");
	  String gu = result.getString("lprod_gu");
	  String nm = result.getString("lprod_nm");
%>
  <tr>
    <td><%=id%></td>
    <td><%=gu%></td>
    <td><%=nm%></td>
  </tr>
	<%
	}
	%>
</table>