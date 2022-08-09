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
<title>글 상세보기</title>
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
<h2 class="page_tit">글 상세보기</h2>
	<form action="${path1 }/board/update.do" method="post">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="title">번호</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="seq" id="seq" size="100" class="single100" placeholder="" value="${board.seq }" readonly>
						</c:if>
						<c:if test="${sid!='admin' }">
							<span>${board.seq }</span>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="title">제목</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="title" id="title" size="100" class="single100" value="${board.title }" required>
						</c:if>
						<c:if test="${sid!='admin' }">
							<span>${board.title }</span>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<textarea name="content" id="content" cols="100" rows="8" class="multi100" required>${board.content }</textarea>
						</c:if>
						<c:if test="${sid!='admin' }">
							<p>${board.content }</p>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="nickname">작성자</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="nickname" id="nickname" size="40" class="single40" value="${board.name }" readonly>
						</c:if>
						<c:if test="${sid!='admin' }">
							<c:if test="${board.nickname=='admin' }">관리자</c:if>
							<c:if test="${board.nickname!='admin' }">김기태</c:if>				
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${sid=='admin' }">					
						<input type="submit" class="btn btn-writer" value="글 수정">
						<input type="reset" class="btn btn-primary" value="취소">
						<a href="${path1 }/board/delete.do?seq=${board.seq }" class="btn btn-primary">글 삭제</a>
						</c:if>
						<a href="${path1 }/board/list.do" class="btn btn-primary">글 목록</a>
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>