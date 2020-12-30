<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
a {
	color: gray;
	text-decoration: none;
	font-weight: bold;
	font-family: JetBrains Mono;
	text-align: center;
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 세션에서 로그인 정보 검사: 로그인 X 경우 -->
<c:if test="${empty login}">
	<a href="loginForm">로그인</a>&nbsp;
	<a href="loginCheck/cartList">장바구니</a>&nbsp;
	<a href="memberForm">회원가입</a>&nbsp; <!-- xml등록주소 -->
</c:if>

<!-- 세션에서 로그인 정보 검사: 로그인 O 경우 -->
<c:if test="${!empty login}">
안녕하세요, <b>${login.username}</b> 님!<br>
	<a href="loginCheck/logout">로그아웃</a>&nbsp; <!-- loginCheck이 포함된 주소라면, 무조건 검사를 하도록 지정한 주소 -->
	<a href="loginCheck/myPage">mypage</a>&nbsp;
	<a href="loginCheck/cartList">장바구니</a>&nbsp;
</c:if>
