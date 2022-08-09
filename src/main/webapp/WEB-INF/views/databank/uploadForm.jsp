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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>파일 업로드</title>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
</head>
<body>
<article id="con" class="content">
  <div class="box box-primary">
      <h2 class="page_tit">파일 업로드</h2>
      <form id="form" action="${path }/databank/uploadForm.do" method="post" enctype="multipart/form-data" >
       <fieldset class="form-group">
       	   <p>업로드할 이미지를 선택 후 업로드 버튼을 눌러 주세요</p>
	       <input type="file" name="file" id="file"><br><br>
	       <input type="submit" value="업로드">
	       <ul id="img_lst">

	       </ul>
	       <div id="img_data"></div>
       </fieldset>
       <div class="btn-wrap">
				<a href="${path }/databank/deleteFile.do" class="btn btn-danger" id="del_Btn">제거</a>
                <a href="${path }/databank/displayFile.do" class="btn btn-primary" id="view_Btn">보기</a>
       </div>
      </form>
      <script>
      $(document).ready(function(){
    	$("#file").change(function(){
    		var filePath = $(this).val();
    		fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
    		$("#img_lst").empty();
    		$("#img_lst").append("<li><img src='"+filePath+"' alt='"+fileName+"' title='"+fileName+"'></li>");
    		var href1 = $("#del_Btn").attr("href");
    		$("#del_Btn").attr("href", href1+"?fileName="+filePath);
    		var href2 = $("#view_Btn").attr("href");
    		$("#view_Btn").attr("href", href2+"?fileName="+filePath);
    	});  
      });
      </script>
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
			opener.document.databankUpload.fileCheck.value="yes";
			opener.document.databankUpload.dfilename.value=id;
			opener.document.databankUpload.dposter.value=ext;
			//opener.document.getElementById("proData").src = id;
/* 			opener.document.getElementById("proData2").src = "${path }/data/"+ext+".png"; */
			window.close();
		}
		</script>

    </div>
</article>
</body>
</html>