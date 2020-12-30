<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h1 {
	color: black;
	font-size: 2rem;
	text-decoration: none;
	font-weight: bold;
	font-family: JetBrains Mono;
}

.A {
	font-family: JetBrains Mono;
}
</style>

</head>
<body>
	<h1>Cart List</h1>
	<div class="A">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="cart/cartList.jsp" flush="true"></jsp:include>
	</div>
</body>
</html>