<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- 기본 플러그인 연결 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- 문서 메타 데이터 -->
<meta name="Subject" content="하나이비인후과병원">
<meta name="Description" content="강남 역삼동, 이비인후과 전문병원, 비중격만곡증, 축농증, 코물혹, 비염, 편도수술, 어지럼증, 코골이, 음성">
<meta name="Keywords" content="강남 역삼동, 이비인후과 전문병원, 비중격만곡증, 축농증, 코물혹, 비염, 편도수술, 어지럼증, 코골이, 음성">
<!-- 오픈 그래프 -->
<meta property="og:type" content="website">
<meta property="og:title" content="하나이비인후과병원">
<meta property="og:description" content="강남 역삼동, 이비인후과 전문병원, 비중격만곡증, 축농증, 코물혹, 비염, 편도수술, 어지럼증, 코골이, 음성">
<meta property="og:image" content="${path }/data/img_logo.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="326">
<meta property="og:image:height" content="72">
<meta property="og:url" content="localhost:8090">
<!-- 파비콘 -->
<link rel="apple-touch-icon" sizes="57x57" href="${path }/data/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="${path }/data/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="${path }/data/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="${path }/data/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="${path }/data/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="${path }/data/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="${path }/data/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="${path }/data/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="${path }/data/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="${path }/data/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="${path }/data/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="${path }/data/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="${path }/data/favicon-16x16.png">
<link rel="manifest" href="${path }/data/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="${path }/data/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<%-- <link rel="stylesheet" href="${path }/include/datatables.min.css">
<script src="${path }/include/datatables.min.js"></script>
<script>
$(document).ready(function(){
	$("#myTable").DataTable();
});
</script> --%>