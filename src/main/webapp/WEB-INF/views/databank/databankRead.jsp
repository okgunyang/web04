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
<title>자료 상세보기</title>
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
<h2 class="page_tit">자료 상세보기</h2>
	<form action="${path1 }/databank/update.do" method="post" name="databankUpload" onsubmit="return fileCk(this)">
	<div class="table_form_wrap">
		<table class="table_form">
			<tbody>
				<tr>
					<th><label for="">번호</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="datano" id="datano" size="100" class="single100" placeholder="" value="${databank.datano }" readonly>
						</c:if>
						<c:if test="${sid!='admin' }">
							<span>${databank.datano }</span>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="dtitle">제목</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="dtitle" id="dtitle" size="100" class="single100" value="${databank.dtitle }" required>
						</c:if>
						<c:if test="${sid!='admin' }">
							<span>${databank.dtitle }</span>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="dcontent">내용</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<textarea name="dcontent" id="dcontent" cols="100" rows="8" class="multi100" required>${databank.dcontent }</textarea>
						</c:if>
						<c:if test="${sid!='admin' }">
							<p>${databank.dcontent }</p>						
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="dposter">파일 형태</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="dposter" id="dposter" size="40" class="single40" value="${databank.dposter }" readonly>
						</c:if>
						<c:if test="${sid!='admin' }">
							<c:set var="filetype" value="${databank.dposter }" />
							<c:if test="${filetype=='gif' }"><img src="${path1 }/data/img.png" alt="파일타입"/></c:if>				
							<c:if test="${filetype=='jpg' }"><img src="${path1 }/data/img.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='png' }"><img src="${path1 }/data/img.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='hwp' }"><img src="${path1 }/data/hwp.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='doc' }"><img src="${path1 }/data/doc.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='pdf' }"><img src="${path1 }/data/pdf.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='xls' }"><img src="${path1 }/data/xls.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='ppt' }"><img src="${path1 }/data/ppt.png" alt="파일타입"/></c:if>
							<c:if test="${filetype=='pptx' }"><img src="${path1 }/data/ppt.png" alt="파일타입"/></c:if>
							<c:if test="${empty filetype}"><img src="${path1 }/data/no.png" alt="파일타입"/></c:if>
						</c:if>
					</td>
				</tr>
				<tr>
					<th><label for="dcontent">첨부 파일</label></th>
					<td>
						<c:if test="${sid=='admin' }">
						<input type="text" name="dfilename" id="dfilename" class="single100" value="${databank.dfilename }" required>
						<button class="btn btn-primary" onclick="uploadFile()">첨부 파일 변경 하기</button>
						<input type="hidden" name="fileCheck" id="fileCheck" />
						</c:if>
						<a href="${path1 }/resources/upload/${databank.dfilename }">${databank.dfilename }</a>						
					</td>
				</tr>
				<tr>
					<th><label for="dcontent">등록일</label></th>
					<td>
							<fmt:parseDate value="${databank.regdate}" var="dateVal" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${dateVal }" pattern="yyyy-MM-dd" />
					</td>
				</tr>
										
				<tr>
					<td colspan="2">
						<c:if test="${sid=='admin' }">					
						<input type="submit" class="btn btn-writer" value="글 수정">
						<input type="reset" class="btn btn-primary" value="취소">
						<a href="${path1 }/databank/delete.do?datano=${databank.datano }" class="btn btn-primary">자료 삭제</a>
						</c:if>
						<a href="${path1 }/databank/list.do" class="btn btn-primary">자료 목록</a>
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	</form>
	<script>
	function uploadFile() {
		window.open("${path1 }/databank/uploadForm.do", "dataupload", "width=400, height=300");
		return false;
	}
	function fileCk(f){
		if(f.fileCheck.value!="yes") {
			alert("파일 업로드가 먼저 선행되어야 합니다.");
			return false;
		}
	}
	</script>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>