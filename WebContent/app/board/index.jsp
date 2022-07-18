<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CHANEL</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/favicon_package/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assets/favicon_package/site.webmanifest">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#0e0101">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/20200522-slide.js"></script>
    <!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
    .skip{
        position: absolute;
        top: -50px;
    }
    </style>
    <script type="text/javascript">
	$("document").ready(function() {
  if ($("#admin_check").val() != 'manager1') {
		$("#check_li").css("display","none");
	}
	
	});
    </script>    
</head>

<body>
    <div class="skip">
        <a rel="bookmark" href="#new">새로운 상품보기</a>
    </div>
<!--   헤더시작-->
<input type="hidden" value="${sessionId}" id="admin_check"> <!-- 관리자인지 아닌지 체크 후 관리자메뉴 show -->
	<header>
		<!--       로고 및 홈버튼,네비-->
		<nav>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/app/board/index.jsp">
						<img
						src="${pageContext.request.contextPath}/assets/icon/chanel-logo.png"
						alt="로고 및 홈화면">
				</a></li>
				<li class="nav"><a
					href="${pageContext.request.contextPath}/cart/flat.do">플랫</a></li>
				<li class="nav"><a
					href="${pageContext.request.contextPath}/cart/mary.do">메리제인</a></li>
				<li class="nav"><a
					href="${pageContext.request.contextPath}/cart/sneakers.do">스니커즈</a></li>
				<li class="nav"><a
					href="${pageContext.request.contextPath}/cart/pump.do">펌프스</a></li>
						<li class="nav"><a href="${pageContext.request.contextPath}/cart/sandle.do">샌들</a></li>
				<c:choose>
					<c:when test="${sessionId eq null}">
						<li class="nav"><a
							href="${pageContext.request.contextPath}/app/board/boardList.jsp">게시판</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav"><a href="${pageContext.request.contextPath}/board/BoardListOk.bo">게시판</a></li>			
					</c:otherwise>
				</c:choose>	
				<li id="check_li"><a href="${pageContext.request.contextPath}/s_manager/list.do">관리자페이지</a></li>	
				 <!-- 관리자인지 아닌지 체크 후 관리자메뉴 show -->		
											
			</ul>

			<!--		로그인과 회원가입,검색창-->

			<ul class="icon">

				<c:choose>
					<c:when test="${sessionId eq null}">
						<li class="icon2"><a
							href="${pageContext.request.contextPath}/app/member/login.jsp"><img
								src="${pageContext.request.contextPath}/assets/icon/login1.png"
								alt="로그인아이콘"></a></li>
					</c:when>
					<c:otherwise>
						<li class="icon2"><a
							href="${pageContext.request.contextPath}/member/MemberLogoutOk.me"><img
								src="${pageContext.request.contextPath}/assets/icon/logout.png"
								alt="로그아웃아이콘"></a></li>
					</c:otherwise>
				</c:choose>


				<li class="icon3"><a
					href="${pageContext.request.contextPath}/cart/cart.do?memberId=${sessionId}"><img
						src="${pageContext.request.contextPath}/assets/icon/bag-s.png"
						alt="장바구니아이콘"></a></li>
				<li><a
					href="${pageContext.request.contextPath}/cart/order_list.do?memberId=${sessionId}"><i class="fa-solid fa-file-invoice-dollar"></i></a></li>
						
			</ul>

		</nav>
	</header>
	<!--	헤더끝-->
    <!--        	배너-->
    <div class="main">
        <div class="slide">
            <div class="banner">
                <a href="${pageContext.request.contextPath}/cart/mary.jsp">
                    <img src="${pageContext.request.contextPath}/assets/images/banner1.png" alt="1920x600" class="bn1">
                </a>
            </div>
            <div class="banner">
                <a href="${pageContext.request.contextPath}/cart/pump.jsp">
                    <img src="${pageContext.request.contextPath}/assets/images/banner2.png" alt="1920x600" class="bn2">
                </a>
            </div>
            <div class="banner">
                <a href="${pageContext.request.contextPath}/cart/flat.jsp">
                    <img src="${pageContext.request.contextPath}/assets/images/banner3.jpg" alt="1920x600" class="bn3">
                </a>
            </div>
        </div>
        <!--	배너버튼-->
        <div class="btn">
            <ul>
                <li class="btn1"></li>
                <li class="btn2"></li>
                <li class="btn3"></li>
            </ul>
        </div>

        <!--	샤넬동영상-->
        <div class="youtube">
            <ul>
                <li><iframe width="600" height="337" src="https://www.youtube.com/embed/E6_W27wOPME"></iframe></li>
                <li><iframe width="600" height="337" src="https://www.youtube.com/embed/VT3LM5P-C1M"></iframe></li>
            </ul>

        </div>
        <!--        상품4가지-->
        <h1>NEW ARRIVALS</h1>
        <div class="product" id="new">
            <ul>
                <li class="p-1"><a href="${pageContext.request.contextPath}/cart/mary.jsp">
                        <img src="${pageContext.request.contextPath}/assets/images/mary-janes/mary-janes1.jpg" alt="메리제인">
                    </a></li>
                <li class="p-2"><a href="${pageContext.request.contextPath}/cart/flat.jsp">
                        <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-navy-2.jpg" alt="플랫">
                    </a></li>
                <li class="p-3"> <a href="${pageContext.request.contextPath}/cart/pump.jsp">
                        <img src="${pageContext.request.contextPath}/assets/images/pump/pumps1.jpg" alt="펌프스">
                    </a></li>
                <li class="p-4"><a href="${pageContext.request.contextPath}/cart/sneakers.jsp">
                        <img src="${pageContext.request.contextPath}/assets/images/sneakers/sneakers1.jpg" alt="스니커즈">
                    </a>
                </li>
            </ul>
        </div>
    </div>
<!--	푸터-->
    <footer>
        <div class="footer-wrap">
            <ul>
                <li>케어&amp;서비스</li>
                <li><a href="https://www.chanel.com/ko_KR/fashion.html#storelocator/fsh">매장찾기</a></li>
                <li><a href="https://www.chanel.com/ko_KR/fashion.html#contact/">고객문의</a></li>
                <li><a href="https://www.chanel.com/ko_KR/fashion.html#faq/">F&amp;Q</a></li>
                <li><a href="https://www.chanel.com/ko_KR/fashion/services/care-instructions.html">케어&amp;서비스</a></li>
            </ul>


            <ul>

                <li>CHANEL.com 패션</li>
                <li><a href="https://www.chanel.com/ko_KR/fashion/haute-couture.html">오뜨 꾸뛰르</a></li>
                <li><a href="https://www.chanel.com/ko_KR/fashion.html">패션</a></li>
                <li><a href="https://www.chanel.com/ko_KR/watches-jewelry/watches">시계</a></li>
                <li><a href="https://www.chanel.com/ko_KR/watches-jewelry/fine-jewelry">화인 주얼리</a></li>
            </ul>
            <ul>
                <li>CHANEL.com 뷰티</li>
                <li><a href="https://mobile.chanel.com/ko_KR/fragrance-beauty/fragrance.html">향수</a></li>
                <li><a href="https://mobile.chanel.com/ko_KR/fragrance-beauty/makeup.html">메이크업</a></li>
                <li><a href="https://mobile.chanel.com/ko_KR/fragrance-beauty/skincare.html">스킨 케어</a></li>
                <li class="copyright">COPYRIGHT helloyoogs.dothome.co.kr</li>

            </ul>
                        <ul>
                <li>하우스 오브 샤넬</li>
                <li><a href="https://inside.chanel.com/en/gabrielle-chanel-and-cinema">인사이드 샤넬</a></li>
                <li><a href="https://careers.chanel.com/ko_KR/">채용</a></li>
                <li><a href="http://www.fondationchanel.org/en/">Foundation Chanel</a></li>
                <li><a href="https://www.chanel.com/ko_KR/fashion.html#privacy/">개인정보 처리방침</a></li>
            </ul>
        </div>
    </footer>

</body>
</html>
