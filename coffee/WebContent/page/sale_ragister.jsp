<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>판매등록</h3>
<%@ page import ="java.sql.*" %>

<form action="action/insert_sale_ragister.jsp" name="action_form">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="number" name="sale_id"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td>
				<select name="sale_code">
					<option value="0">상품선택</option>
					<%
						try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT PCODE, NAME FROM TBL_PRODUCT_01");
							
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
				</select>
			</td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="sale_date"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td>
				<select name="store">
					<option value="0">매장선택</option>
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
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>
<script>
function submit_form() {
	if(document.action_form.sale_id.value === ""){
		alert("비번호가 입력되지 않았습니다!");
		document.action_form.sale_id.focus();
		return;
	}
	if(document.action_form.sale_code.value === ""){
		alert("상품코드가 입력되지 않았습니다!");
		document.action_form.sale_code.focus();
		return;
	}
	if(document.action_form.sale_date.value === ""){
		alert("판매날짜가 입력되지 않았습니다!")
		document.action_form.sale_date.focus();
		return;
	}
	if(document.action_form.store.selectIndex === ""){
		alert("매장코드가 입력되지 않았습니다!")
		return;
	}
	if(document.action_form.amount.value === ""){
		alert("판매수량이 입력되지 않았습니다!");
		document.action_form.amount.focus();
		return;
	}
	
	alert("정상적으로 등록이 완료되었습니다!");
	document.action_form.submit();
}
function reset_form(){
	alert("처음부터 다시 입력합니다!");
	document.action_form.reset();
	document.action_form.sales_id.focus();
}
</script>