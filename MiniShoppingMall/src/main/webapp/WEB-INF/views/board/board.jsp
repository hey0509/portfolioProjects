<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bulletin Board</title>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>
<body>
	<h2>게시판 목록</h2>
	<div id="root">
		<section id="container">
			<form role="form" method="get" action="boardWrite">
			<button type="submit" style="float: left; cursor: pointer; color: black; background-color: white; border: 0.5px solid black; font-size: 20px; margin-top: 20px;"><b>게시글 작성</b></button>
				<br><br><br>
				<table>
					<tr>
						<th style="padding-bottom: 15px" colspan="2">번호</th>
						<th style="padding-bottom: 15px"  colspan="2">제목</th>
						<th style="padding-bottom: 15px"  colspan="2">작성자</th>
						<th style="padding-bottom: 15px"  colspan="2">등록일</th>
					</tr>
					<tr>
						<td colspan="8">
							<div style="background-color: gray; height: 0.1px; margin: 0 0 25px 0;"></div>
						</td>
					</tr>
					<c:forEach items="${boardList}" var="boardList">
						<tr>
							<td colspan="2" height="50" width="50"  style="text-align: center;"><c:out value="${boardList.bno}" /></td>
							<td colspan="2" width="550"  style="text-align: center;">
								<a href="boardRead?bno=${boardList.bno}"><c:out value="${boardList.title}" /></a>
							</td>
							<td colspan="2" width="250" style="text-align: center;"><c:out value="${boardList.writer}" /></td>
							<td colspan="2" style="text-align: center;"><fmt:formatDate value="${boardList.regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">
							<div style="background-color: gray; height: 0.1px; margin: 25px 0 25px 0;"></div>
						</td>
					</tr>
				</table>

				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="board${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li><a href="board${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="board${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<br>
				
			</form>
			<br>
			
		</section>
	</div>
</body>
</html>