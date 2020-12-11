<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>

<table border="1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>

<%
	String filter_message = request.getParameter("filter_message");
	String select_filter = request.getParameter("select_filter");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		
		String query = "SELECT SALENO, PRODUCT.PCODE, SALE.SALEDATE, SHOP.SCODE, PRODUCT.NAME, SALE.AMOUNT, SALE.AMOUNT*PRODUCT.COST FROM TBL_PRODUCT_01 PRODUCT, TBL_SALELIST_01 SALE, TBL_SHOP_01 SHOP WHERE PRODUCT.PCODE = SALE.PCODE AND SHOP.SCODE = SALE.SCODE";
		
		
		if(filter_message != null && filter_message.length() != 0){
			query += String.format(" AND %s = '%s'", select_filter ,filter_message);
		}
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
<table border="1">
	<form action="select_filter.jsp">
		<select name="select_filter">
			<option value="0">선택</option>
			<option value="SALENO">비번호</option>
			<option value="PRODUCT.PCODE">상품코드</option>
			<option value="SHOP.SCODE">매장코드</option>
			<option value="PRODUCT.NAME">상품명</option>
			<option value="SALE.AMOUNT">판매수량</option>
			<option value="SALE.AMOUNT*PRODUCT.COST">총판매액</option>
		</select>
		<input type="text" name="filter_message">
		<input type="submit">
	</form>
</table>