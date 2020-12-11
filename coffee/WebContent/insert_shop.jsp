<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String scode = request.getParameter("scode");
	String shop_name = request.getParameter("shop_name");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		
		String query = "INSERT INTO TBL_SHOP_01(SCODE, SNAME) VALUES('%S', '%S')";
		
		ResultSet rs = stmt.executeQuery(String.format(query, scode, shop_name));
		
		conn.commit();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>