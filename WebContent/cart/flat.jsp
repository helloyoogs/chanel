<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CHANEL</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css?after" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css?after" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/popup.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mary.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css?after" />
    
            <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/favicon_package/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assets/favicon_package/site.webmanifest">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#0e0101">

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/20200507-click-mary1.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/flat.js"></script>
    
    <!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<meta name="theme-color" content="#0e0101">
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
        <a rel="bookmark" href="#new">인기 상품보기</a>
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
    <!--메리제인서브화면-->
    <input type="hidden" value="${sessionId}" class="id_cart_pay">
    <div class="product">
        <h1><a href="${pageContext.request.contextPath}/cart/flat.do">플랫</a></h1>
        <ul class="p-n">
            <li><a href="#">높은 가격순</a></li>
            <li><a href="#">낮은 가격순</a></li>
            <li><a href="#">신상품</a></li>
            <li><a href="#">인기순</a></li>
        </ul>
    </div>
    <!--	상품6가지-->
    <div class="product-1">
        <ul>
            <li class="pn1"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-black-1.jpg" alt="블랙 유광 고트스킨"></li>
            <li class="pn2"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-navy-2.jpg" alt="체크 트위드"></li>
            <li class="pn3"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-gold-3.jpg" alt="금색 라미네이티드 고트스킨"></li>
        </ul>
        <div class="text1">
            <ul class="t-1">
                <li><a href="#">유광 고트스킨</a></li>
                <li><a href="#">트위드</a></li>
                <li><a href="#">라미네이티드 고트스킨</a></li>
            </ul>
            <ul class="t-2">
                <li><a href="#">₩847,000</a></li>
                <li><a href="#">₩847,000</a></li>
                <li><a href="#">₩915,000</a></li>
            </ul>
        </div>
    </div>
    <div class="product-2">
        <ul>
            <li class="pn4"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-silver-4.jpg" alt="실버 라미네이트드 고트스킨"></li>
            <li class="pn5"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-light-5.jpg" alt="데님"></li>
            <li class="pn6" id="new"><img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-black-6.jpg" alt="아이보리 펄"></li>

        </ul>
        <div class="text2">
            <ul class="t-3">
                <li><a href="#">라미네이트드 고트스킨</a></li>
                <li><a href="#">데님</a></li>
                <li><a href="#">펄</a></li>
            </ul>
            <ul class="t-4">
                <li><a href="#">₩915,000</a></li>
                <li><a href="#">₩947,000</a></li>
                <li><a href="#">₩2,196,000</a></li>
            </ul>
        </div>
    </div>
    
      <!--        상품상세페이지1-->

    <div class="productpage-wrap wrap1" style="display: none">

        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-black-1.jpg" alt="상품메인">
                </a></li>
        </ul>
        <ul class="p-1-1">
            <li>유광 고트스킨</li>
            <li>₩847,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat1-1.jpg" alt=""></a>
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat1-2.jpg" alt=""></a>
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat1-3.jpg" alt=""></a>
        </ul>

         <!--            치수선택-->

        <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->

		<div class="option_wrap">
				<form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="847000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="847000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>

				<!--				상품설명-->

				<ul class="for-product">
					<li>color: 블랙, 화이트 
					<br>소재: 테이턴트 카프스킨 
					<br>굽높이: 10mm
					 <br>레퍼런스: G02819 Y53816 C0229
					</li>
				</ul>

				<!--				구매버튼-->
				<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
		</div>
	</div>

    
    <!--    상세페이지1끝-->

     <!--        상품상세페이지2-->
    <div class="productpage-wrap wrap2"  style="display: none">
        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-navy-2.jpg" alt="상품메인">
                </a></li>
        </ul>
        <ul class="p-1-1">
            <li>트위드</li>
            <li>₩847,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat2-1.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat2-2.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat2-3.jpg" alt=""></a>
        </ul>

       <!--            치수선택-->

      <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->
		<div class="option_wrap">
            <form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="847000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="847000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>
            <!--				상품설명-->

            <ul class="for-product">
                <li>
                    color: 네이비 블루, 레드, 화이트, 블랙
                    <br>소재: 그로그랭
                    <br>굽높이: 10mm
                    <br>레퍼런스: G02819 Y53819 K2193
                </li>
            </ul>
<!--				구매버튼-->
			<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
        </div>
    </div>
    <!--    상세페이지2끝-->
       <!--        상품상세페이지3-->
    <div class="productpage-wrap wrap3"  style="display: none">
        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-gold-3.jpg" alt="상품메인">
                </a></li>
        </ul>
        <ul class="p-1-1">
            <li>라미네이티드 고트스칸</li>
            <li>₩915,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat3-1.jpg" alt=""></a>
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat3-2.jpg" alt=""></a>
            <li><a href=""><img src="${pageContext.request.contextPath}/assets/images/flat/flat3-3.jpg" alt=""></a>
        </ul>

       <!--            치수선택-->

      <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->
		<div class="option_wrap">
            <form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="915000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="915000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>
            <!--				상품설명-->

                <ul class="for-product">
                <li>
                    color: 골드, 블랙
                    <br>소재: 그로그랭
                    <br>굽높이: 10mm
                    <br>레퍼런스: G36166 Y53814 C0369
                </li>
            </ul>
<!--				구매버튼-->
			<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
        </div>


    </div>
    <!--    상세페이지3끝-->
         <!--        상품상세페이지4-->
    <div class="productpage-wrap wrap4"  style="display: none">
        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-silver-4.jpg" alt="상품메인">
                </a></li>
        </ul>
          <ul class="p-1-1">
            <li>라미네이티드 고트스킨</li>
            <li>₩915,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat4-1.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat4-2.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat4-3.jpg" alt=""></a>
        </ul>

       <!--            치수선택-->

      <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->
		<div class="option_wrap">
            <form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="915000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="915000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>
            <!--				상품설명-->

           <ul class="for-product">
                <li>
                    color: 실버, 블랙
                    <br>소재: 그로그랭
                    <br>굽높이: 10mm
                    <br>레퍼런스: G36166 Y53814 C0625
                </li>
            </ul>

<!--				구매버튼-->
			<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
        </div>


    </div>
    <!--    상세페이지4끝-->
         <!--        상품상세페이지5-->
    <div class="productpage-wrap wrap5"  style="display: none">
        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-light-5.jpg" alt="상품메인">
                </a></li>
        </ul>
        <ul class="p-1-1">
            <li>데님</li>
            <li>₩947,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat5-1.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat5-2.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat5-3.jpg" alt=""></a>
        </ul>

       <!--            치수선택-->

      <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->
		<div class="option_wrap">
            <form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="947000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="947000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>
            <!--				상품설명-->

             <ul class="for-product">
                <li>
                    color: 라이트 블루
                    <br>소재: 그로그랭
                    <br>굽높이: 10mm
                    <br>레퍼런스: G35780 X53308 0I793
                </li>
            </ul>
<!--				구매버튼-->
				<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
        </div>


    </div>
    <!--    상세페이지5끝-->
         <!--        상품상세페이지6-->
    <div class="productpage-wrap wrap6"  style="display: none">
        <ul>
            <li class="productpage-name">
                <!--				x버튼-->
                <div class="x-btn"><button><a href="#"><img src="${pageContext.request.contextPath}/assets/icon/x-icon.png" alt=""></a></button></div>
            </li>
            <li class="p-1"><a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/flat/ballerinas-black-6.jpg" alt="상품메인">
                </a></li>
        </ul>
        <ul class="p-1-1">
            <li>펄</li>
            <li>₩2,196,000</li>
        </ul>

        <!--            상품작은이미지상단-->

        <ul class="p-s1">
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat6-1.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat6-2.jpg" alt=""></a>
            <li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/flat/flat6-3.jpg" alt=""></a>
        </ul>

       <!--            치수선택-->

      <div class="button1">
            <button class="div2">220</button>
            <button class="div2">230</button>
            <button class="div2">240</button>
            <button class="div2">250</button>
        </div>
        <div class="button2">
            <button class="div2">260</button>
            <button class="div2">270</button>
            <button class="div2">280</button>
            <button class="div2">290</button>
		</div>
            <!--  수량-->
		<div class="option_wrap">
            <form action="write1.do" method="post" class="cart_go">
				<table style="display:none;">
					<tr>
						<td>가격<input type="text" value="2196000" class="cPrice"></td>
					</tr>
					<tr>
						<td>전체가격<input type="text" name="cPriceAll" value="2196000" class="cPriceAll"></td>
					</tr>
					<tr>
						<td>상품id<input type="text" name="sId" class="sId"></td>
					</tr>
					<tr>
						<td>유저아이디<input type="text" name="memberId" value="${sessionId }"></td>
					</tr>
				</table>
				<ul class="amount-1">
					<li>수량</li>
					<li><input class="spinner_input cQuantity" type="number" name="cQuantity" min="1" max="50" value="1"></li>
				</ul>
            <!--				상품설명-->

               <ul class="for-product">
                <li>
                    color: 블랙, 아이보리
                    <br>소재: 그로그랭
                    <br>굽높이: 20mm
                    <br>레퍼런스: G35906 Y54019 K1852
                </li>
            </ul>
<!--				구매버튼-->
				<div class="buy">
					<input type="submit" value="장바구니 담기" class="btn1">
				</div>
			</form>
        </div>


    </div>
    <!--    상세페이지6끝-->
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
    <div class="window"></div>
</body>
</html>



