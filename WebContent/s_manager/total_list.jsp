<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1">
   
    <title>CHANEL</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/total_list.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css?after">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#0e0101">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <!-- Bootstrap CSS -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.5.0.min.js"></script>
	
    <script type="text/javascript">
	//페이징 처리 시작
 $(document).ready(function(){
	  if ($("#admin_check").val() != 'manager1') {
			$("#check_li").css("display","none");
		} //어드민 아이디 체크
			var $setRows = $('#setRows');

			$setRows
					.submit(function(e) {
						e.preventDefault();
						var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

						//    console.log(typeof rowPerPage);

						var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
						if (!rowPerPage) {
							alert(zeroWarning);
							return;
						}
						$('#nav').remove();
						var $products = $('#products');

						$products.after('<div id="nav">');

						var $li = $($products).find('tr');
						var rowTotals = $li.length;
						//  console.log(rowTotals);

						var pageTotal = Math.ceil(rowTotals / rowPerPage);
						var i = 0;

						for (; i < pageTotal; i++) {
							$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
									'#nav');
						}

						$li.addClass('off-screen').slice(0, rowPerPage).removeClass(
								'off-screen');

						var $pagingLink = $('#nav a');
						$pagingLink.on('click', function(evt) {
							evt.preventDefault();
							var $this = $(this);
							if ($this.hasClass('active')) {
								return;
							}
							$pagingLink.removeClass('active');
							$this.addClass('active');

							// 0 => 0(0*4), 4(0*4+4)
							// 1 => 4(1*4), 8(1*4+4)
							// 2 => 8(2*4), 12(2*4+4)
							// 시작 행 = 페이지 번호 * 페이지당 행수
							// 끝 행 = 시작 행 + 페이지당 행수

							var currPage = $this.attr('rel');
							var startItem = currPage * rowPerPage;
							var endItem = startItem + rowPerPage;

							$li.css('opacity', '0.0').addClass('off-screen').slice(
									startItem, endItem).removeClass('off-screen')
									.animate({
										opacity : 1
									}, 300);

						});

						$pagingLink.filter(':first').addClass('active');

					});

			$setRows.submit();
			//페이징 처리 끝
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
<!-- 장바구니 페이지-->
	<div class="shop">
		<div class="title">
			<h1>
				<a href="#">구매 후,장바구니 담긴 후 상품재고</a>
			</h1>
			<ul class="p-n">
				<li><a href="#">상품이미지</a></li>
				<li><a href="#">상품id</a></li>
				<li><a href="#">상품이름</a></li>
				<li><a href="#">상품사이즈</a></li>
				<li><a href="#">상품재고</a></li>
				<li><a href="#">상품가격</a></li>
			</ul>
		</div>
		<c:if test="${empty total_list}">
			<p style="line-height: 200px; margin-left: 44.5%;">목록이 비어있습니다.</p>
		</c:if>
<div class="shop1">
	<table id="products" border="1">
	    <form action="" id="setRows">
      <p  style="display:none;">
        showing
        <input type="text" name="rowPerPage" value="16">
        item per page
      </p>
    </form>
		<c:forEach items="${total_list}" var="dto">
		<tr>
		<td>
			<div class="product">
				<div class="product2">
					<img alt="구두이미지" src="${dto.sImg}">
					<ul class="p-n-2">
						<li>${dto.sId }</li>
						<li>${dto.sName}</li>
						<li>${dto.sSize}</li>
						<li>${dto.sStock}</li>
						<li>${dto.sPrice}</li>
					</ul>
				</div>
			</div>
		</td>
			</tr>
		</c:forEach>
		<!-- 페이징처리 -->
</table>
</div>
		<!-- 페이징처리 -->
	</div>
	<!--    리스트하단-->
		<div class="shop-bottom">
			<ul>
				<button class="btn1-1" >
					<a href="${pageContext.request.contextPath}/s_manager/list.do">상품목록보기</a>
				</button>
			</ul>
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





