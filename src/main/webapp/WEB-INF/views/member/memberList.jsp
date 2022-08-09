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
<title>회원 목록</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<article id="con" class="content">
<figure class="sub_visual">
	<img src="${path1 }/data/bg_sub_top1.jpg" alt="서브페이지 비주얼">
</figure>
<h2 class="page_tit"></h2>
<div class="table_wrap">
<div class="table_lst_wrap">
	<h2 class="page_tit">회원 목록</h2>
	<table class="table_lst" id="myTable">
		<thead>
			<tr>
				<th>순번</th><th>아이디</th><th>성명</th><th>가입일</th><th>포인트</th><th>방문횟수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList }" var="mem" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td><a href="${path1 }/member/getMember.do?userid=${mem.userid }">${mem.userid }</a></td>
				<td>${mem.username }</td>
				<td>
						<fmt:parseDate value="${mem.regdate}" var="dateVal" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${dateVal }" pattern="yyyy-MM-dd" />
				</td>
				<td>${mem.userpoint }</td>
				<td>${mem.visited }</td>
			</tr>
		</c:forEach>
		<c:if test="${sid=='admin' }">
			<tr>
				<td colspan="6">
					<a href="${path1 }/board/list.do" class="btn btn-primary">공지사항 관리</a>
					<a href="${path1 }/qna/list.do" class="btn btn-primary">묻고 답하기</a>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</div>
</div>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>