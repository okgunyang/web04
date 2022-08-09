<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header id="hd" class="header">
    <div class="hd_wrap top">
        <nav id="tnb" class="nav">
            <a href="${path1 }" class="logo"><img src="${path1 }/data/img_logo.png" alt="로고타입"></a>
            <ul class="right_con top_nav">
            	<!--  로그인 전 -->
            	<c:if test="${empty sid }">
                <li><a href="${path1 }/member/loginForm.do" class="login">로그인</a></li>
                <li><a href="${path1 }/member/joinForm.do" class="join">회원가입</a></li>
                </c:if>
                <!--  로그인 후 -->
                <c:if test="${!empty sid }">
                <li><span>${sid }</span>님</li>
                <li><a href="${path1 }/member/read.do" class="mypage">마이페이지</a></li>
                <li><a href="${path1 }/member/logout.do" class="logout">로그아웃</a></li>
                </c:if>
                <!-- 관리자만 -->
                <c:if test="${sid=='admin' }">
				<li><a href="${path1 }/member/list.do">회원 목록</a></li>
				<li><a href="${path1 }/board/list.do">게시판 목록</a></li>
				<li><a href="${path1 }/board/write_form.do">글 쓰기</a></li>
				<li><a href="${path1 }/databank/list.do">자료실 목록</a></li>
				<li><a href="${path1 }/databank/writeForm.do">자료 등록</a></li>
				</c:if>
            </ul>
        </nav>
    </div>
    <div class="hd_wrap main">
        <nav id="gnb" class="nav">
            <ul class="left_con">
                <li>
                    <a href="" class="dp1">병원소개</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">하나 이야기</a></li>
                        <li><a href="" class="dp2">의료진 소개</a></li>
                        <li><a href="${path1 }/board/list.do" class="dp2">병원 소식</a></li>
                        <li><a href="" class="dp2">둘러보기(VR)</a></li>
                        <li><a href="" class="dp2">안전수술 시스템</a></li>
                        <li><a href="" class="dp2">진료협력센터</a></li>
                        <li><a href="" class="dp2">건강정보</a></li>
                        <li><a href="${path1 }/databank/list.do" class="dp2">건강자료실</a></li>
                        <li><a href="" class="dp2">고객의 소리</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">진료안내</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">진료 일정</a></li>
                        <li><a href="" class="dp2">외래진료안내</a></li>
                        <li><a href="" class="dp2">입.퇴원안내</a></li>
                        <li><a href="" class="dp2">오시는 길</a></li>
                        <c:if test="${!empty sid }"><!-- 로그인한 경우만 진료 예약이나 질문 가능 -->
                        <%-- <li><a href="${path1 }/reservate/writeForm.do" class="dp2">온라인 예약</a></li> --%>
                        <li><a href="" class="dp2">자주 묻는 질문</a></li>
                        <li><a href="${path1 }/qna/list.do" class="dp2">질문 및 답변</a></li>
                        <li><a href="${path1 }/email/onlineConsult.do" class="dp2">온라인 상담</a></li>
                        </c:if>
                        <li><a href="" class="dp2">치료사례</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">코 질환 센터</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">센터 소개</a></li>
                        <li><a href="" class="dp2">축농증</a></li>
                        <li><a href="" class="dp2">비중격만곡증</a></li>
                        <li><a href="" class="dp2">알레르기 비염</a></li>
                        <li><a href="" class="dp2">만성 비염</a></li>
                        <li><a href="" class="dp2">코 물혹</a></li>
                        <li><a href="" class="dp2">후각 장애</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">목 질환 센터</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">센터 소개</a></li>
                        <li><a href="" class="dp2">편도</a></li>
                        <li><a href="" class="dp2">목의 혹</a></li>
                        <li><a href="" class="dp2">갑상선</a></li>
                        <li><a href="" class="dp2">침샘</a></li>
                        <li><a href="" class="dp2">악성 질환</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">귀 질환 센터</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">센터 소개</a></li>
                        <li><a href="" class="dp2">어지럼증</a></li>
                        <li><a href="" class="dp2">만성 중이염</a></li>
                        <li><a href="" class="dp2">소아 중이염</a></li>
                        <li><a href="" class="dp2">난청</a></li>
                        <li><a href="" class="dp2">보청기</a></li>
                        <li><a href="" class="dp2">이명</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">수면 센터</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">센터 소개</a></li>
                        <li><a href="" class="dp2">진단과정</a></li>
                        <li><a href="" class="dp2">수면검사</a></li>
                        <li><a href="" class="dp2">수술치료</a></li>
                        <li><a href="" class="dp2">비수술치료</a></li>
                    </ul>
                </li>
                <li>
                    <a href="" class="dp1">신경과</a>
                    <ul class="sub">
                        <li><a href="" class="dp2">신경과 소개</a></li>
                        <li><a href="" class="dp2">수면장애.불면증</a></li>
                        <li><a href="" class="dp2">어지럼증</a></li>
                        <li><a href="" class="dp2">두통</a></li>
                        <li><a href="" class="dp2">치매초기진단</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</header>