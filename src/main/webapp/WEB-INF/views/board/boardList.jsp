<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 목록</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<article id="con" class="content">
<figure class="sub_visual">
	<img src="${path1 }/data/bg_sub_top1.jpg" alt="게시판 비주얼">
</figure>
<h2 class="page_tit">글 목록</h2>
<div class="table_lst_wrap">
	<table class="table_lst" id="myTable">
		<thead>
			<tr>
				<th>글 번호</th><th>제목</th><th>작성일</th><th>작성자</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${boardList }" var="board">
			<tr>
				<td>${board.seq }</td>
				<td><a href="${path1 }/board/read.do?seq=${board.seq }">${board.title }</a></td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
				<td>
					<c:if test="${board.nickname=='admin' }">관리자</c:if>
					<c:if test="${board.nickname!='admin' }">김기태</c:if>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${sid=='admin' }">
			<tr>
				<td colspan="4">
					<a href="${path1 }/board/write_form.do" class="btn btn-writer" style="width:70px">글 등록</a>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</div>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>