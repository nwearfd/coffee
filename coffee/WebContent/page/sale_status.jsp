<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<h3>판매현황</h3>
<table border="1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>충판매액</td>
	</tr>
	<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		
		String query = "SELECT " +
				"SALENO, TBL_PRODUCT_01.PCODE, SALEDATE, SCODE, NAME, AMOUNT, COST*AMOUNT "+
				"FROM " +
				"TBL_PRODUCT_01, TBL_SALELIST_01 "+
				"WHERE TBL_PRODUCT_01.PCODE = TBL_SALELIST_01.PCODE";
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getDate(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getInt(6) %></td>
					<td><%=rs.getInt(7) %></td>
				</tr>
			<%
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>