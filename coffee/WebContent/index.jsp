<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커                피</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	%>
	
	<%
		switch(section){
		case "sale_ragister":
			%><%@include file="page/sale_ragister.jsp" %> <%
			break;
		case "sale_status":
			%><%@include file="page/sale_status.jsp" %> <%
			break;
		case "sale_store":
			%><%@include file="page/sale_store.jsp" %> <%
			break;
		case "sale_product":
			%><%@include file="page/sale_product.jsp" %> <%
			break;
		default:
			%><%@include file="static/index.jsp" %> <%
		}
	%>
	
	<%@include file="static/footer.jsp" %>
</body>
</html>