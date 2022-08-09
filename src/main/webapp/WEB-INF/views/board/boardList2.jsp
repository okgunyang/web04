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
<title>글 목록</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${path1 }/include/common.css">
<style>
nav {    background-color:transparent;  box-shadow:none; }
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<article id="con" class="content">
<figure class="sub_visual">
	<img src="${path1 }/data/bg_sub_top1.jpg" alt="게시판 비주얼">
</figure>
<h2 class="page_tit">글 목록</h2>
<div class="table_lst_wrap">
            <div class="row">
                <hr style="margin-bottom: 50px;">
            </div>
			<c:if test="${sid=='admin' }">
            <div class="row">
                <a href="${path1 }/board/write_form.do" class="btn btn-writer" style="width:120px">
                    새글쓰기
                </a>
            </div>
			</c:if>
            <div class="row">
                <!-- Table -->
                <table class="table_lst" id="myTable">
                    <thead class="blue white-text">
                        <tr>
                            <th class="center-align">번호</th>
                            <th class="center-align">글제목</th>
                            <th class="center-align">글쓴이</th>
                            <th class="center-align">작성일</th>
                            <th class="center-align">조회수</th>
                        </tr>
                    </thead>
            
                    <tbody>
                    	<c:choose>
                    		<c:when test="${ pageMaker.total gt 0 }">
                    		
                    			<%-- pageScope → requestScope → sessionScope → applicationScope --%>
                    			<c:forEach var="board" items="${ boardList }">
                    				<tr onclick="location.href='/board/read2.do?seq=${board.seq }'" style="cursor: pointer;">
			                            <td class="center-align">${ board.seq }</td>
			                            <td>${ board.title }</td>
			                            <td class="center-align">${ board.nickname }</td>
			                            <td class="center-align">${ board.regdate }</td>
			                            <td class="center-align">${ board.visited }</td>
			                        </tr>
                    			</c:forEach>
                    			
                    		</c:when>
                    		<c:otherwise>
                    			<tr>
                    				<td colspan="5">게시판 글이 없습니다.</td>
                    			</tr>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                </table>
                <!-- end of Table -->
            </div>


            <div class="row center">
                <!-- Pagination -->
                <ul class="pagination">
                    <li class="${ pageMaker.prev ? 'waves-effect' : 'disabled' }"><a id="prev"><i class="material-icons">chevron_left</i></a></li>
                    
                    <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
                    	<li class="${ pageMaker.cri.pageNum == i ? 'active' : 'waves-effect' }"><a href="/board/list2.do?pageNum=${ i }">${ i }</a></li>
                    </c:forEach>
                    
                    <li class="${ pageMaker.next ? 'waves-effect' : 'disabled' }"><a id="next"><i class="material-icons">chevron_right</i></a></li>
                </ul>
                <!-- end of Pagination -->
            </div>


            <div class="row">
                <form action="">
                    <!-- AutoComplete -->
                    <div class="col s12 l6 offset-l3">
                        <div class="input-field">
                            <i class="material-icons prefix">find_in_page</i>
                            <input type="text" id="autocomplete-input" class="autocomplete">
                            <label for="autocomplete-input">검색</label>
                        </div>
                    </div>
                    <!-- end of AutoComplete -->
                </form>
            </div>



        </div>
        <!-- end of Container -->
    </div>
    <!-- end of App -->
    


    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        const sideNav = document.querySelector('.sidenav');
        M.Sidenav.init(sideNav, {});

        const ac = document.querySelector('.autocomplete');
        M.Autocomplete.init(ac, {
            data: {
                '파리': null,
                '베네치아': null,
                '암스테르담': null,
                '부다페스트': null,
                '프랑크푸르트': null,
                '비엔나': null,
                '드라스덴': null,
                '프라하': null,
                '로마': null
            }
        });
    </script>
    <script>
    	// [이전] a태그 클릭이벤트
    	var prev = document.querySelector('a#prev');
    	
    	prev.addEventListener('click', function (event) {
    		event.preventDefault();
    		
    		var isPrev = ${ pageMaker.prev };
    		if (!isPrev) {
    			return;
    		}
    		location.href = '/board/list2.do?pageNum=${ pageMaker.startPage - 1 }';
    	});
    	
    	// [다음] a태그 클릭이벤트
		var next = document.querySelector('a#next');
    	
		next.addEventListener('click', function (event) {
			event.preventDefault();
			
    		var isNext = ${ pageMaker.next };
    		if (!isNext) {
    			return;
    		}
    		location.href = '/board/list2.do?pageNum=${ pageMaker.endPage + 1 }';
    	});
    
    </script>
</article>
<%@ include file="../include/footer.jsp" %>
</body>
</html>