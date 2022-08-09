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
<title></title>
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
<h2 class="page_tit">로그인</h2>
	<c:if test="${!empty msg }">
	<script>
	alert("로그인 실패");
	document.loginForm.userid.focus();
	</script>
	</c:if>
	<form action="${path1 }/member/signin.do" method="post" name="loginForm">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="userid">아이디</label></th>
					<td><input type="text" name="userid" id="userid" size="100" class="single100" placeholder="아이디 입력" required>
					<!--  pattern="^[a-z0-9]+$"  -->
					</td>
				</tr>				
				<tr>
					<th><label for="userpw">비밀번호</label></th>
					<td><input type="password" name="userpw" id="userpw"  class="single100" placeholder="비밀번호 입력" required>
					<!--  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  -->
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-writer" value="로그인">
						<input type="reset" class="btn btn-primary" value="취소">
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
	<script>
	function loginFaiure() {
		alert("로그인 실패");
	}
	</script>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>