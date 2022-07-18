<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CHANEL</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css?after">
    <link rel="stylesheet" href="css/20200502-chanel-shop.css">
            <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/favicon_package/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assets/favicon_package/site.webmanifest">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#0e0101">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.5.0.min.js"></script>
<!-- 카카오 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
	
	 <script type="text/javascript">
	$("document").ready(function() {
  if ($("#admin_check").val() != 'manager1') {
		$("#check_li").css("display","none");
	}
	
	});
    </script>
</head>

<body>
	<c:if test="${sessionId eq null}">
		<script>
			alert("로그인 후 이용하세요.");
			location
					.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
	</c:if>
	<!--   헤더시작-->
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
						<li class="nav"><a
							href="${pageContext.request.contextPath}/board/BoardListOk.bo">게시판</a></li>
					</c:otherwise>
				</c:choose>


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
	</header><!--   헤더시작-->
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
	<!--	헤더끝-->
	<!-- 장바구니 페이지-->
	<div class="shop">
		<div class="title">
			<h1>
				<a href="#">장바구니</a>
			</h1>
			<ul class="p-n">
				<li><a href="#">상품</a></li>
				<li><a href="#">가격</a></li>
				<li><a href="#">전체 가격</a></li>
			</ul>
		</div>
		<c:if test="${empty cart}">
			<i class="fa-solid fa-cart-arrow-down"
				style="margin-left: 50%; margin-top: 46px; font-size: 50px;"></i>
			<p style="line-height: 100px; margin-left: 46%;">장바구니가 비어있습니다.</p>
		</c:if>
		<c:set var="total" value="0" />
		<c:forEach items="${cart}" var="dto" varStatus="vs">
			<div class="product">
				<div class="product2">
					<a href="#"> <img alt="구두이미지" src="${dto.sImg}"></a>

					<ul class="p-n-2">
						<li><a href="#">${dto.sName}</a></li>
						<li><a href="#">${dto.sPrice}</a></li>
						<li><a href="#">${dto.cPriceAll}</a></li>
					</ul>
				</div>

				<!--            치수선택1-->
				<div class="menu1">
					<div class="button2">
						<span>&nbsp;사이즈 : ${dto.sSize}</span>
						<!-- 수량 변경,장바구니 삭제 시작 -->
						<form method="post">
							<ul class="amount-1">
								<li>수량</li>
								<li><input class="spinner_input cQuantity${vs.index}" type="number" value="${dto.cQuantity}" name="cQuantity" min="1" max="50" 
								onchange="$('.cPriceAll${vs.index}').val( Number($('.sPrice${vs.index}').val()) * Number($('.cQuantity${vs.index}').val()) )"></li>
									<li><input type="submit" value="수량변경" class="btn1" onclick="javascript: form.action='modify.do';"></li>
							</ul>
							<table style="display:none;">
								<tr>
									<td><input type="text" name="memberId" value="${dto.memberId}" class="mId"></td>
									<td><input type="text" name="sId" value="${dto.sId}"></td>
									<td><input type="text" name="sName" value="${dto.sName}"></td>
									<td><input type="text" name="sImg" value="${dto.sImg}"></td>
									<td><input type="text" name="sSize" value="${dto.sSize}"></td>
									<td><input type="text" name="sPrice" value="${dto.sPrice}" class="sPrice${vs.index}"></td>
									<td><input type="text" name="sStock" value="${dto.sStock}"></td>
									<td><input type="text" name="cId" value="${dto.cId}"></td>
									<td><input type="text" name="cPriceAll" value="${dto.cPriceAll}" class="cPriceAll${vs.index}"></td>
									<td><input type="text" name="cPayment" value="${dto.cPayment}" class="cp${vs.index}"></td>
									<td>${dto.cDate}</td>
								</tr>
							</table>
							<c:set var="total" value="${total + dto.cPriceAll}"/>
							<p>
								<br> <input type="submit" value="장바구니 삭제" class="btn1"
									onclick="javascript: form.action='Cdelete.do';">
							</p>
						</form>
						<!-- 수량 변경,장바구니 삭제 끝 -->
					</div>
				</div>

			</div>
		</c:forEach>
		<!--    장바구니하단-->
		<div class="shop-bottom">
			<ul>
				<button class="btn1-1" >
					<a href="${pageContext.request.contextPath}/app/board/index.jsp">둘러보기</a>
				</button>
				<button class="btn1-1 check_module">결제하기</button>
				<li><c:out value="${total}" /></li>
				<li style="display:none;"><input value="${total}" id="totalprice"></li>				
			</ul>
		</div>
	</div>
	<!--	푸터-->

	<footer>
		<div class="footer-wrap">
			<ul>
				<li>케어&amp;서비스</li>
				<li><a
					href="https://www.chanel.com/ko_KR/fashion.html#storelocator/fsh">매장찾기</a></li>
				<li><a
					href="https://www.chanel.com/ko_KR/fashion.html#contact/">고객문의</a></li>
				<li><a href="https://www.chanel.com/ko_KR/fashion.html#faq/">F&amp;Q</a></li>
				<li><a
					href="https://www.chanel.com/ko_KR/fashion/services/care-instructions.html">케어&amp;서비스</a></li>
			</ul>


			<ul>

				<li>CHANEL.com 패션</li>
				<li><a
					href="https://www.chanel.com/ko_KR/fashion/haute-couture.html">오뜨
						꾸뛰르</a></li>
				<li><a href="https://www.chanel.com/ko_KR/fashion.html">패션</a></li>
				<li><a
					href="https://www.chanel.com/ko_KR/watches-jewelry/watches">시계</a></li>
				<li><a
					href="https://www.chanel.com/ko_KR/watches-jewelry/fine-jewelry">화인
						주얼리</a></li>
			</ul>
			<ul>
				<li>CHANEL.com 뷰티</li>
				<li><a
					href="https://mobile.chanel.com/ko_KR/fragrance-beauty/fragrance.html">향수</a></li>
				<li><a
					href="https://mobile.chanel.com/ko_KR/fragrance-beauty/makeup.html">메이크업</a></li>
				<li><a
					href="https://mobile.chanel.com/ko_KR/fragrance-beauty/skincare.html">스킨
						케어</a></li>
				<li class="copyright">COPYRIGHT helloyoogs.dothome.co.kr</li>

			</ul>
			<ul>
				<li>하우스 오브 샤넬</li>
				<li><a
					href="https://inside.chanel.com/en/gabrielle-chanel-and-cinema">인사이드
						샤넬</a></li>
				<li><a href="https://careers.chanel.com/ko_KR/">채용</a></li>
				<li><a href="http://www.fondationchanel.org/en/">Foundation
						Chanel</a></li>
				<li><a
					href="https://www.chanel.com/ko_KR/fashion.html#privacy/">개인정보
						처리방침</a></li>
			</ul>

		</div>

	</footer>
</body>
</html>