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
<title>자료실 목록</title>
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
				<th>글 번호</th><th>제목</th><th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${databankList }" var="databank">
			<tr>
				<td>${databank.datano }</td>
				<td><a href="${path1 }/databank/read.do?datano=${databank.datano }">${databank.dtitle }</a></td>
				<td>
						<fmt:parseDate value="${databank.regdate}" var="dateVal" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${dateVal }" pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
		<c:if test="${sid=='admin' }">
			<tr>
				<td colspan="3">
					<a href="${path1 }/databank/writeForm.do" class="btn btn-writer" style="width:70px">자료 등록</a>
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