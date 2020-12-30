<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

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

<c:if test="${!empty success }">
	<script>
		alert("${success}")
	</script>
</c:if>

</head>
<body>
	<h1>Mini Shopping Mall</h1>
	<div class="A">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include>
	</div>
</body>
</html>