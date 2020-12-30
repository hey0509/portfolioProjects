<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
form {
	font-family: JetBrains Mono;
	color: gray;
}
</style>

<c:if test="${!empty mesg}">
	<script>
		alert('${mesg}'); // 로그인 정보 없을 떄, LoginController에서 전달받은 mesg값을 alert로 출력. 
	</script>
</c:if>

<form action="login" method="get">
	아이디:<input type="text" name="userid"><br>
	비밀번호:<input type="text" name="passwd"><br>
	<input type="submit" value="로그인">
	<input type="reset" value="취소">
</form>