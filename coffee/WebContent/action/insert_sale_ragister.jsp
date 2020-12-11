<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
String sale_id = request.getParameter("sale_id");
String sale_code = request.getParameter("sale_code");
String sale_date = request.getParameter("sale_date");
String store = request.getParameter("store");
int amount = Integer.parseInt(request.getParameter("amount"));
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO TBL_SALELIST_01(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) VALUES('%s','%s','%s','%s','%d')";
	ResultSet rs = stmt.executeQuery(String.format(query, sale_id, sale_code, sale_date, store, amount));
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp?section=sale_status");
%>