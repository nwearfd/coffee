<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<form action="insert_product">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td>
				<input type="number" name="saleno">
			</td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td>
			<select name="pcode">
					<option value="0">상품선택</option>
					<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT PCODE, NAME FROM TBL_PRODUCT_01");
							
							while(rs.next()){
								%>
									<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %></option>
								<% 
							}
							stmt.close();
							conn.close();
						} 
						catch (Exception e){
							e.printStackTrace();
						}
					%>
			</td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="saledate"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td>
				<select name="pcode">
					<option value="0">상품선택</option>
					<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT SCODE, SNAME FROM TBL_SHOP_01");
							
							while(rs.next()){
								%>
									<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %></option>
								<% 
							}
							stmt.close();
							con.close();
						} 
						catch (Exception e){
							e.printStackTrace();
						}
					%>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="상품 입력하기"></td>
		</tr>
	</table>
</form>