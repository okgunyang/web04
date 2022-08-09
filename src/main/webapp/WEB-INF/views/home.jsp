<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE>
<html>
<head>
<title>Home</title>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="${path1 }/include/reset.css">
<link rel="stylesheet" href="${path1 }/include/common.css">
<style>
    #vs { width: 100vw; clear:both; overflow-x:hidden; position:relative; }
    .slide_box { width: 800%; }
    .slide_box li { width: 12.5%;  float:left; }
    .slide_box li a { display:block; }
    .slide_box li a img { display:block; width: 100%; }
    .button_box { width: 1400px; position:absolute; bottom:40px; left: 50%; 
    margin-left: -700px; height: 5px;  }
    .button_box li { float:left; }

    #sec_wrap1 { background-color: #f6f6fa; padding-top: 50px; padding-bottom: 50px;  }
    #sec1 .box1 { padding:30px 40px; height: 400px; box-sizing: border-box;  border:1px solid #1f75b0; 
    padding-right: 20%; background-image: url("./data/bg_main1.jpg"); background-repeat: no-repeat;
    background-color:#fff;  
    background-position:right bottom; margin-right:5%; }
    #sec1 .box2 { padding:30px 40px; height: 400px; box-sizing: border-box;  border:1px solid #ddd; } 

    .sec_tit1 { margin: 10px 0px; font-size: 42px; color:#1f75b0; font-weight:700; 
    letter-spacing:-2px; }
    .sec_com1 { color:#333; font-size:20px; font-weight: 400; line-height: 1.3; }
    .sec_linkbox { clear: both; position:relative; margin-top: 20px; margin-bottom: 20px; }
    .sec_linkbox li.item { float:left; width:250px; }
    .sec_linkbox li.item a { display:block; margin: 5px; background-color: #fff; border:1px solid #ddd;
    color:#1f75b0; font-size: 20px; font-weight: 600; text-align:center; line-height: 80px; }
    .sec_linkbox li.item a:hover { background-color:#1f75b0; color: #fff;}
    .sec_linkbox li.circle_item { position:absolute; top:35px; left:190px; 
    width: 117px; height: 117px; border-radius:60px; overflow:hidden; }
    .sec_linkbox::after { content:""; clear:both; display:block; }

    .box2 .sec_tit1 { text-align: center; padding-left: 50px; background-image: url("./data/icon_phone.png");
    background-repeat: no-repeat; background-position:18px 8px; margin-top: 14px; }
    .sec_table1 { display:table; }
    .sec_table1 tr { display:table-row; }
    .sec_table1 td { display:table-cell; padding-top:5px; padding-bottom:5px; border-bottom:1px solid #ddd; 
        width: 345px; }
    .sec_table1 tr:first-child td { border-top:1px solid #666;  }
    .sec_table1 tr:last-child td { border-bottom:1px solid #666;  }
    .sec_table1 td span { display:inline-block; line-height:30px; text-align:center; }
    .sec_table1 td span.item_head { padding-left:38px; color:#1f75b0; font-weight:bold; font-size:16px; width: 90px; }
    .sec_table1 td span.item_data { color:#333; font-weight:bold; font-size:16px; width: 120px; }
    .sec_table1 tr:last-child td span.item_data { width:100%; line-height: 48px; }
    .sec_table1 td .item_com { font-size:12px; text-align: center; }

    #sec_wrap2 { padding-top: 50px; padding-bottom: 50px; background-color: #fff; }
    #sec2 .box1 { position:relative; margin-right: 5%; height: 400px; border:1px solid #ddd; 
    box-sizing:border-box; background-image: url("./data/bg_main2.jpg"); 
    background-repeat: no-repeat; background-position:right top; padding: 40px; }
    #sec2 .box1 .case { position:absolute; right:0; top:0; z-index:5; }
    .sec_tit2 { padding-top:14px; padding-bottom: 28px; text-align: center; font-size: 36px; color:#333; }
    .noti .sec_tit2 { text-indent:-340px; }

    .sec_table2 { display:table; border-collapse: collapse; }
    .sec_table2 tr { display:table-row; }
    .sec_table2 td { display:table-cell; padding-top:5px; padding-bottom:5px; border-bottom:1px solid #ddd; 
        width: 495px; }
    .sec_table2 tr:first-child td { border-top:1px solid #666;  }
    .sec_table2 tr:last-child td { border-bottom:1px solid #666;  }
    .sec_table2 td span { display:block; line-height:40px; text-align:center; float:left; }
    .sec_table2 td span.noti_tit { padding-left: 24px; }
    .sec_table2 td span.noti_tit a { display:block; color:#333; }
    .sec_table2 td span.noti_date { float:right; width: 110px; text-align: center; color:#999; }

    .case { width: 318px; }
    .case .sec_tit2 { padding-top: 50px; color:#fff; }
    .case_lst { clear:both; width: 220px; margin:5px auto; }
    .case_lst li { border-top:1px solid #fff; }
    .case_lst li:last-child { border-bottom:1px solid #fff; }
    .case_lst li a { color:#fff; display:block; line-height:52px; text-align: center; }

    #sec2 .box2 { padding:30px 40px; height: 400px; box-sizing: border-box;  border:1px solid #ddd; } 
    #sec2 .sec_tit2 { padding-bottom: 4px; }
    #sec2 .sec_com2 { text-align: center; font-size:14px; line-height: 1.2; }
    .sec_lst { clear:both; margin: 0 auto; width:360px; margin-top: 30px; } 
    .sec_lst::after { content:""; clear:both; display:block; }
    .sec_lst li { float:left; width: 50%; }
    .sec_lst li a { display:block; line-height: 68px; text-align: center; 
    padding-left:24px; border-right:1px solid #fff; border-bottom:1px solid #fff; 
    color:#fff; background-color: #1f75b0; background-repeat: no-repeat;
background-position:24px center; background-color: #ba2367; }
    .sec_lst li a.traf_ico1 { background-image: url("./data/icon_bus.png");}
    .sec_lst li a.traf_ico2 { background-image: url("./data/icon_bus.png");}
    .sec_lst li a.traf_ico3 { background-image: url("./data/icon_parking.png");}
    .sec_lst li a.traf_ico4 { background-image: url("./data/icon_map.png");}

    #sec_wrap3 { padding-top: 50px; padding-bottom: 50px; background-color: #f6f6fa; 
    border-top:1px solid #eee; }
    .lst.info li a { display:block; height: 330px; overflow:hidden; 
    border:1px solid #bbb; filter:blur(1px); transition-duration:0.6s; }
    .lst.info li a:hover {  filter:blur(0px); }
    .col_tit { color:#333; line-height:3.2; overflow:hidden; text-overflow: ellipsis;
    white-space:nowrap; padding:0px 14px;  padding-top: 10px; }
    .col_com { color:#666; line-height:3.4; padding:0px 14px; padding-top: 10px; }
</style>
</head>
<body>
<div class="container">
<%@ include file="include/menu.jsp" %>
<article id="con" class="content">
        <figure id="vs" class="visual">
            <ul class="slide_box">
                <li><a href=""><img src="./data/img_mainslide1_1.jpg" alt="slide1"></a></li>
                <li><a href=""><img src="./data/img_mainslide1_2.jpg" alt="slide2"></a></li>
                <li><a href=""><img src="./data/img_mainslide1_3.jpg" alt="slide3"></a></li>
                <li><a href=""><img src="./data/img_mainslide1_4.jpg" alt="slide4"></a></li>
                <li><a href=""><img src="./data/img_mainslide1_5.jpg" alt="slide5"></a></li>
                <li><a href=""><img src="./data/img_mainslide1_6.jpg" alt="slide6"></a></li>
            </ul>
            <ul class="button_box">
                <li class="on"><button class="btn-bar btn1">버튼1</button></li>
                <li><button class="btn-bar btn2">버튼2</button></li>
                <li><button class="btn-bar btn3">버튼3</button></li>
                <li><button class="btn-bar btn4">버튼4</button></li>
                <li><button class="btn-bar btn5">버튼5</button></li>
                <li><button class="btn-bar btn6">버튼6</button></li>
            </ul>
        </figure>
        <div class="sec_wrap" id="sec_wrap1">
            <section class="sec" id="sec1">
                <div class="col8 left_con">
                    <div class="box1">
                        <h2 class="sec_tit1">처음 오셨나요?</h2>
                        <p class="sec_com1">코, 목, 귀 질환 증상에 따른 알맞은 치료로<br> 빠른 회복을 돕겠습니다.</p>
                        <ul class="sec_linkbox">
                            <li class="item"><a href="">의료진 소개</a></li>
                            <li class="item"><a href="">초진안내</a></li>
                            <li class="item"><a href="">온라인 예약</a></li>
                            <li class="item"><a href="">온라인 상담</a></li>
                            <li class="circle_item"><a href=""><img src="./data/main-guide-btn.png" alt="메인 가이드"></a></li>
                        </ul>    
                    </div>
                </div>
                <div class="col4 right_con">
                    <div class="box2">
                        <h2 class="sec_tit1">02.6925.1111</h2>
                        <table class="sec_table1">
                            <tbody>
                                <tr>
                                    <td>
                                        <span class="item_head">평&nbsp;&nbsp;&nbsp;&nbsp;일</span><span class="item_data">09:00 ~ 18:00</span>
                                        <p class="item_com">(접수마감:오전 12:00/오후 5:30)</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="item_head">점심시간</span><span class="item_data">12:30 ~ 14:00</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="item_head">토&nbsp;요&nbsp;일</span><span class="item_data">09:00 ~ 13:30</span>
                                        <p class="item_com">(접수마감:오후 1:00/현장 상황에 따라 조기 마감 가능)</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="item_data">일요일, 공휴일 휴진</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <div class="sec_wrap" id="sec_wrap2">
            <section class="sec" id="sec2">
                <div class="col8 left_con">
                    <div class="box1">
                        <article class="noti">
                            <h2 class="sec_tit2">공지사항</h2>
                            <table class="sec_table2">
                                <tr>
                                    <td><span class="noti_tit"><a href="">6월 일/공휴일 코로나 검사가 중단됩니다.</a></span><span class="noti_date">2022.06.14</span></td>
                                </tr>
                                <tr>
                                    <td><span class="noti_tit"><a href="">홍콩 출국용 코로나 검사&진단서 발행 가능</a></span><span class="noti_date">2022.06.02</span></td>
                                </tr>
                                <tr>
                                    <td><span class="noti_tit"><a href="">*코로나 검사 안내(당일발급, 시간, 비용)</a></span><span class="noti_date">2022.04.17</span></td>
                                </tr>
                                <tr>
                                    <td><span class="noti_tit"><a href="">영문 코로나 회복증명서 발급 안내</a></span><span class="noti_date">2022.04.01</span></td>
                                </tr>
                            </table>
                        </article>
                        <article class="case">
                            <h2 class="sec_tit2 wtxt">치료사례</h2>
                            <ul class="case_lst">
                                <li><a href="">축농증/물혹 수술후기</a></li>
                                <li><a href="">비중격만곡증 수술후기</a></li>
                                <li><a href="">코골이 수술후기</a></li>
                                <li><a href="">편도 수술후기</a></li>
                            </ul>
                        </article>
                    </div>
                </div>
                <div class="col4 right_con">
                    <div class="box2">
                        <h2 class="sec_tit2">찾아오시는 길</h2>
                        <p class="sec_com2">병원으로 오시는 길을 안내해 드립니다.</p>
                        <ul class="sec_lst">
                            <li><a href="" class="traf_ico1">셔틀버스</a></li>
                            <li><a href="" class="traf_ico2">대중교통</a></li>
                            <li><a href="" class="traf_ico3">주차안내</a></li>
                            <li><a href="" class="traf_ico4">약도문자</a></li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="sec_wrap" id="sec_wrap3">
            <section class="sec" id="sec3">
                <h2 class="sec_tit2">하나이비인후과병원 건강 정보</h2>
                <ul class="lst info">
                    <li class="col3 left_con">
                        <a href="">
                            <img src="./data/info1.jpg" alt="건강정보1" class="lst_img">
                            <h3 class="col_tit">의사가 말해주는 편도결석의 이야기</h3>
                            <p class="col_com"><span class="cate1">목</span><span class="cate2">성인</span><span class="col_date">2022.05.10</span></p>
                        </a>
                    </li>
                    <li class="col3 left_con">
                        <a href="">
                            <img src="./data/info2.jpg" alt="건강정보2" class="lst_img">
                            <h3 class="col_tit">코로나 후유증의 진실을 알려 드립니다. (pact check)</h3>
                            <p class="col_com"><span class="cate1">기타</span><span class="col_date">2022.05.03</span></p>
                        </a>
                    </li>
                    <li class="col3 left_con">
                        <a href="">
                            <img src="./data/info3.png" alt="건강정보3" class="lst_img">
                            <h3 class="col_tit">특발성 안면마비(벨 마비)란 무엇인가요?</h3>
                            <p class="col_com"><span class="cate1">귀</span><span class="cate2">어지럼증</span><span class="col_date">2021.12.10</span></p>
                        </a>
                    </li>
                    <li class="col3 left_con">
                        <a href="">
                            <img src="./data/info4.png" alt="건강정보4" class="lst_img">
                            <h3 class="col_tit">코로나 영문음성확인서, 집에서 받아볼 수 </h3>
                            <p class="col_com"><span class="cate1">기타</span><span class="col_date">2021.11.11</span></p>
                        </a>
                    </li>
                </ul>
            </section>
        </div>
</article>
<%@ include file="include/footer.jsp" %>
</div>
</body>
</html>
