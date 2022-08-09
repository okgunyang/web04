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
<title>글 등록</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
</head>
<body>
<div class="container">
<%@ include file="../include/menu.jsp" %>
<article id="con" class="content">
<figure class="sub_visual">
	<img src="${path1 }/data/bg_sub_top1.jpg" alt="게시판 비주얼">
</figure>
	<h2 class="page_tit">온라인 상담</h2>
	<form action="${path1 }/email/sendNaverMail.do" method="post">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="from">보내는 사람</label></th>
					<td><input type="text" name="from" id="from" size="40" class="single40" required></td>
				</tr>
				<tr>
					<th><label for="to">받는 사람</label></th>
					<td><input type="text" name="to" id="to" size="40" class="single40" value="kkt09072@naver.com" readonly required></td>
				</tr>
				<tr>
					<th><label for="title">제목</label></th>
					<td><input type="text" name="subject" id="title" size="100" class="single100" placeholder="글제목 입력" required></td>
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td><textarea name="content" id="content" cols="100" rows="8" class="multi100" placeholder="글 내용 입력" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-writer" value="상담 전송">
						<input type="reset" class="btn btn-primary" value="취소">
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
</article>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>