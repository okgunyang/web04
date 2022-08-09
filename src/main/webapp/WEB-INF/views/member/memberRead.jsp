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
<c:if test="${sid=='admin' }">
<h2 class="page_tit">회원 정보 수정</h2>
</c:if>
<c:if test="${sid!='admin' }">
<h2 class="page_tit">마이 페이지</h2>
</c:if>
	<form action="${path1 }/member/update.do" method="post" onsubmit="return updateCheck(this)">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="userid">아이디</label></th>
					<td><input type="text" name="userid" id="userid" size="100" class="single100" value="${member.userid }" readonly required>
					</td>
				</tr>				
				<tr>
					<th><label for="userpw">비밀번호</label></th>
					<td><input type="password" name="userpw" id="userpw"  class="single100" value="${member.userpw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
						<p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
					</td>
				</tr>
				<tr>
					<th><label for="userpw2">비밀번호 확인</label></th>
					<td><input type="password" name="userpw2" id="userpw2"  class="single100" value="${member.userpw }" required></td>
				</tr>
				<tr>
					<th><label for="username">이름</label></th>
					<td><input type="text" name="username" id="username" class="single100"  value="${member.username }" required></td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="email" name="email" id="email" class="single100" value="${member.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
				</tr>
				<tr>
					<th><label for="tel">전화번호</label></th>
					<td><input type="tel" name="tel" id="tel" class="single100"  value="${member.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
				</tr>
				<tr>
					<th><label for="" onclick="findAddr()">주소</label></th>
					<td>
						<input type="text" name="addr1" id="addr1" class="single100" value="${member.addr1 }"><br>
						<input type="text" name="addr2" id="addr2" class="single100" value="${member.addr2 }"><br>
						<input type="text" name="postcode" id="postcode"  class="single40" value="${member.postcode }">
						<input type="button" value="주소찾기" onclick="findAddr()" class="btn btn-primary">
					</td>
				</tr>
				<tr>
					<th><label for="birth" >생년월일</label></th>
					<td>
						<input type="date" name="birth" id="birth" value="${member.birth }" class="single100">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-writer" value="회원정보수정">
						<input type="reset" class="btn btn-primary" value="취소">
						<c:if test="${sid=='admin' }">
						<a href="${path1 }/member/delete.do?userid=${member.userid }" class="btn btn-primary">직권 강퇴</a>
						</c:if>
						<c:if test="${sid!='admin' }">
						<a href="${path1 }/member/delete.do?userid=${sid }" class="btn btn-primary">회원 탈퇴</a>
						</c:if>
						<c:if test="${sid=='admin' }">
						<a href="${path1 }/member/list.do" class="btn btn-primary">회원 목록</a>
						</c:if>
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
	<script>
	function updateCheck(f){
		if(f.userpw.value!=f.userpw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("addr1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("addr1").value = jibunAddr;
				}
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>