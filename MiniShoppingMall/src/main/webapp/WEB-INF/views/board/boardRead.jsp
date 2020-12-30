<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "boardUpdate");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {

			var deleteYN = confirm("삭제하시겠습니가?");
			if (deleteYN == true) {
				formObj.attr("action", "boardDelete");
				formObj.attr("method", "get");
				formObj.submit();
			}
		})

		// 취소
		$(".list_btn").on("click", function() {
			formObj.attr("action", "board");
			formObj.attr("method", "get");
			formObj.submit();
		})
	})
</script>
</head>
<body>
	<h2>게시 내용 조회</h2>
	<div id="root">
		<section id="container">
			<form role="form" method="get" name="readForm">
				<table>
					<tbody>
						<tr>
							<td><label for="bno">글 번호</label>
							<input type="text" id="bno" name="bno" value="${boardRead.bno}" /></td>
						</tr>
						<tr>
							<td><label for="title">제목</label>
							<input type="text" id="title" name="title" value="${boardRead.title}" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label>
							<textarea id="content" name="content">
							<c:out value="${boardRead.content}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label>
							<input type="text" id="writer" name="writer" value="${boardRead.writer}" /></td>
						</tr>
						<tr>
							<td><label for="regdate">작성날짜</label>
							<fmt:formatDate value="${boardRead.regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</tbody>
				</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>