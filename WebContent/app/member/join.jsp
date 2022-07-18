<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CHANEL</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/join.css" />
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/favicon_package/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/favicon_package/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assets/favicon_package/site.webmanifest">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#0e0101">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
	
	 <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.0.min.js"></script>
	  <script type="text/javascript">
	$("document").ready(function() {
  if ($("#admin_check").val() != 'manager1') {
		$("#check_li").css("display","none");
	}
	
	});
    </script>
</head>
<body>
  <c:if test="${not empty param.code}">
    <script>
      alert("아이디 또는 비밀번호를 다시 확인해주세요.");
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
    <!--    로그인페이지-->
    <form method="post" action="${pageContext.request.contextPath}/member/MemberJoinOk.me" name="joinForm">
    <div class="log-wrap">
        <!--       로그인창-->
        <div class="log1">
        <h1>회원가입</h1>
				<hr>
				<p style="background: #fd3a3a2e; margin-bottom:30px; width: 506px; height:50px; margin-bottom: 20px;">
					<span style="color: red; font-size: 2rem; font-weight: bold">*</span>
					아래 항목은 모두 작성해주세요.
				</p>
		  <p>아이디 <span id="idCheck_text"></span></p><br/>
		  <input type="text" name="memberId" id="memberId" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"> <br/> 
          <p>비밀번호</p> <br/><input type="password" name="memberPw" id="memberPw" placeholder="영문 4자 이상, 최대 20자" /><br/> 
          <p>이름</p> <br/> <input type="text" name="memberName" id="memberName" /> <br/> 
          <p>나이</p> <br/><input type="text" name="memberAge" id="memberAge" /><br/> 
        <hr>
      <p style="background: #3a6afd2e; margin-bottom:30px; width: 506px; height:50px; margin-bottom: 20px;">
		<span style="color: red; font-size: 2rem; font-weight: bold">*</span>
					아래 항목은 선택사항입니다.</p>
				<p>성별</p> <br>
				<div class="gender_radio">
					<input type="radio" id="male" name="memberGender" value="남자">
					<label for="male">남자</label>
					<input type="radio" id="female" name="memberGender" value="여자">
					<label for="female">여자</label>
					<input type="radio" id="none" name="memberGender" value="선택안함" checked>
					<label for="none">선택안함</label>
				</div>
		  <p>이메일</p> <br/>
		  <input type="text" name="memberEmail" id="memberEmail"> <br/>
          <p>우편번호</p> <br/>
          <input type="text" name="memberZipcode" class="postcodify_postcode5" style="width: 423px; margin-right: -10px;" />
          <button type="button" id="postcodify_search_button" style="height: 53px; width: 80px; background: #000; color:#fff; cursor:pointer;  margin-top: -10px;">검색</button>
          <p>주소</p> <br/>
          <input type="text" name="memberAddress" id="memberAddress" class="postcodify_address"> <br/> 
          <p>상세주소</p> <br/>
          <input type="text" name="memberAddressDetail" id="memberAddressDetail" class="postcodify_details" /><br/>
          <p>참고항목</p> <br/>
          <input type="text" name="memberAddressEtc" id="memberAddressEtc" class="postcodify_extra_info" /><br/>
        
        <div class="btn_join">
          	<button class="btn1-1" type="button" value="완료" onclick="formSubmit()">완료</button>
            <button class="btn1-1" type="button" value="취소" onclick="history.back()">취소</button>
        </div>
        </div>
    </div>
  </form>
    <!--    로그인페이지끝-->
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
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/app/member/join.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</html>
