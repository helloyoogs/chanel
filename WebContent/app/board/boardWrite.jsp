<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/boardWrite.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css" />

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
	<c:if test="${sessionId eq null}">
		<script>
			alert("로그인 후 이용하세요.");
			location
					.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
	</c:if>

	<form action="${pageContext.request.contextPath}/board/BoardWriteOk.bo" name="writeForm" method="post" enctype="multipart/form-data"
		class="table_wrap">
		<h1>글쓰기</h1>
		<div class="tbl1">
			<input type="button" value="목록"
				onclick="location.href='${pageContext.request.contextPath}/board/BoardListOk.bo'" />
			<p>
				<input id="boardTitle" name="boardTitle" type="text"
					placeholder="제목 입력">
			</p>
			<p>
				작성자 :
				<c:out value="${sessionId}" />
			</p>
			<hr>
			<input type="hidden" name="boardId" value="${sessionId}">
		</div>

		  <div class="upload_file1">
			<h3>첨부파일</h3>
			<div style="display: flex;">
				<div class="files">
					<div>
						<label for="board_file1" style="display: inline;"> <img
							id="board_file1Img"
							src="${pageContext.request.contextPath}/assets/icon/filePlus.png"
							width="110px" height="110px" style="display: inline;">
						</label>
					</div>
					<input id="board_file1" name="board_file1" type="file"> <input
						type="button" onclick="cancelFile('board_file1')" value="첨부 삭제">
				</div>
				<div class="files">
					<div>
						<label for="board_file2" style="display: inline;"> <img
							id="board_file2Img"
							src="${pageContext.request.contextPath}/assets/icon/filePlus.png"
							width="110px" height="110px" style="display: inline;">
						</label>
					</div>
					<input id="board_file2" name="board_file2" type="file"> <input
						type="button" onclick="cancelFile('board_file2')" value="첨부 삭제">
				</div>
				<div class="files">
					<div>
						<label for="board_file3" style="display: inline;">
						<img
							id="board_file3Img"
							src="${pageContext.request.contextPath}/assets/icon/filePlus.png"
							width="110px" height="110px" style="display: inline;">
						</label>
					</div>
					<input id="board_file3" name="board_file3" type="file"> <input
						type="button" onclick="cancelFile('board_file3')" value="첨부 삭제">
				</div>
			</div>
		</div> 
		<div class="upload_file2">
			<ul>
				<li><input type="button" onclick="cancelFile('board_file1')" value="첨부 삭제"></li>
				<li><input type="button" onclick="cancelFile('board_file2')" value="첨부 삭제"></li>
				<li><input type="button" onclick="cancelFile('board_file3')" value="첨부 삭제"></li>
			</ul>
		</div> 


		<div class="write_submit">
			<textarea name="boardContent" placeholder="내용 작성"></textarea>
			<button type="button" value="취소" onclick="history.back()">취소</button>
			<button type="button" value="글쓰기" class="primary" onclick="send()">글쓰기</button>
		</div>
	</form>
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
<script>
	function send(){
		if(!$("input#boardTitle").val()){
			alert("제목을 작성해주세요.");
			return;
		}
		
		if(!$("textarea[name='boardContent']").val()){
			alert("내용을 작성해주세요.");
			return;
		}
		
		document.writeForm.submit();
	}
	
	$(".files").change(function(e){
		let file = e.target.files[0];
		let img = $(this).find("img");
		
		if(!file.type.match("image.*")){
			img.attr("src", "${pageContext.request.contextPath}/assets/icon/no_img.jpg");
		}else{
			let reader = new FileReader();
			reader.onload = function(e){
				console.log(e.target.result);
				img.attr("src", e.target.result)
			}
			reader.readAsDataURL(file);
		}
	})
	
	function cancelFile(fileTagName){
		$("input[name='" + fileTagName + "']").val("");
		$("img#" + fileTagName + "Img").attr("src", "${pageContext.request.contextPath}/assets/icon/filePlus.png");
	}
	
</script>
</html>