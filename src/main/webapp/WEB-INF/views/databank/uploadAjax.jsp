<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>업로드 Ajax화면</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
<script>
$(document).ready(function () {
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;		
		var file = files[0];
		var formData = new FormData(); 
		formData.append("file", file);
		$.ajax({
			url: '${path }/databank/uploadAjax.do',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				//alert(data);
				//서버로 파일을 전송한 다음에 그 파일을 다시 받아온다.?
				
				//이미지 인경우 썸네일을 보여준다.
				if(checkImageType(data)){
					str = "<div>"
						+ "<a href='${path }/databank/displayFile.do?fileName=" + getImageLink(data) + "'>"
						+ "<img src='${path }/databank/displayFile.do?fileName=" + data + "'/>"
						+ "</a>"
						+ "<span data-src='" + data + "'>X</span></div>";
				}else {
					str = "<div>"
						+ "<a href='${path }/databank/displayFile.do?fileName=" + data + "'>"
						+ getOriginalName(data) + "</a>"
						+ "<span data-src='" + data + "'>X</span></div>";
				}
				$(".uploadedList").append(str);	
			},
		});
	});
	
	
	/* 컨트롤러로 부터 전송받은 파일이 이미지 파일인지 확인하는 함수 */
	function checkImageType(fileName){
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		return fileName.match(pattern);
	}
	
	//파일 이름 처리 : UUID 가짜 이름 제거
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);			
	}
	
	//이미지 원본 링크 제공
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);
		return front + end;
	}
	
	
	//업로드 파일 삭제 처리
	$(".uploadedList").on("click", "span", function(event){
		var that = $(this);		
		alert($(this).attr("data-src"));
		$.ajax({
			url: "${path }/databank/deleteFile.do",
			type: "post",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success : function(result){
				if(result == 'deleted'){
					that.parent("div").remove();
				}
			},
		});
	});
});
</script>
<style>
.fileDrop{	width: 100%;	height: 200px;	border: 1px dotted blue; }
span {	margin-left: 3px;	font-weight: bold; color: gray; }
</style>
</head>
<body>
<article id="con" class="content">
      <h2 class="page_tit">Ajax File Upload</h2>
      <form id="form" action="${path }/databank/uploadAjax.do" method="post" enctype="multipart/form-data">
        <div class="box-body">
          <div class="form-group">
				<div class="fileDrop"></div>	
          </div>
        </div>
        <div class="box-footer">
          <div class="uploadedList"></div>
        </div>
      </form>
      
      <script>
      function close_win() {
    	 self.close();
      }
      </script>
      <hr>
		<c:if test="${empty uploadFile }">
			<p>해당 이미지가 업로드 되지 못했습니다.</p>
		</c:if>	
		<c:if test="${!empty uploadFile }">
			<p>해당 이미지가 업로드 되었습니다.</p>
			<a href="javascript:apply('${uploadFile }')">${uploadFile } [적용]</a>
			<p>적용을 눌러야만 업로드된 이미지로 이미지를 사용할 수 있습니다.</p>
		</c:if>
		<script>
		function apply(id){
			var ext = id.substr((id.lastIndexOf(".")+1 - id.length));
			var ext2 = ext;
			if(ext2=='jpg' || ext2=='png' || ext2=='gif') { 
				ext2 = 'img';
			} else if(ext2!='jpg' && ext2!='png' && ext2!='gif' && ext2!='pdf' && ext2!='hwp' && ext2!='txt' && ext2!='doc' && ext2!='xls' && ext2!='ppt'){
				ext2 = 'no';	
			}
			opener.document.databankUpload.dfilename.value=id;
			opener.document.databankUpload.dposter.value=ext;
			opener.document.getElementById("proData").src = id;
			opener.document.getElementById("proData2").src = "${path }/data/"+ext+".png";
			//opener.document.frm.imgck.value="yes";
			window.close();
		}
		</script>
</article>
</body>
</html>