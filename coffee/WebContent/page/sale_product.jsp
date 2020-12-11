<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>상품별판매액</h3>
<%@ page import ="java.sql.*" %>

<table border="1">
	<tr>
		<td>상품코드</td>
		<td>상품명</td>
		<td>상품별 판매액</td>
	</tr>
	<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT PRODUCT.PCODE, PRODUCT.NAME, SUM(PRODUCT.COST * SALELIST.AMOUNT) AS TOTAL_COST FROM TBL_SALELIST_01 SALELIST, TBL_PRODUCT_01 PRODUCT WHERE SALELIST.PCODE = PRODUCT.PCODE GROUP BY PRODUCT.PCODE, PRODUCT.NAME ORDER BY SUM(SALELIST.AMOUNT * PRODUCT.COST) desc";
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
			<%
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>