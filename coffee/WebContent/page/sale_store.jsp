<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<h3>매장별판매액</h3>

<table border="1">
	<tr>
		<td>매장코드</td>
		<td>매장명</td>
		<td>매장별 판매액</td>
	</tr>
	<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT SHOP.SCODE, SHOP.SNAME, SUM(PRODUCT.COST * SALELIST.AMOUNT) AS TOTAL_COST FROM TBL_SALELIST_01  SALELIST, TBL_SHOP_01 SHOP, TBL_PRODUCT_01 PRODUCT WHERE SALELIST.SCODE = SHOP.SCODE AND SALELIST.PCODE = PRODUCT.PCODE GROUP BY SHOP.SCODE, SHOP.SNAME ORDER BY SCODE asc";
		
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