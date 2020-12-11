<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		
		String query = "INSERT INTO TBL_SHOP_01(saleno, pcode, saledate, scode, amount) VALUES('%S', '%S','%S','%S','%S')";
		
		ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, saledate, scode, amount));
		
		conn.commit();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>