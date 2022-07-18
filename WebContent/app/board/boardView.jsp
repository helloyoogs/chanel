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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/boardView.css" />
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
	<c:if test="${sessionId eq null}">
		<script>
			alert("로그인 후 이용하세요.");
			location
					.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
	</c:if>
	<c:set var="board" value="${board}" />
	<c:set var="files" value="${files}" />
	
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
	<div class="view_wrap">
	<h1>게시판</h1>
		<div class="section1">
			<ul>
				<li><input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/board/BoardWrite.bo'" /></li>
				<li><input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/board/BoardListOk.bo'" /></li>
				<c:if test="${sessionId eq board.getBoardId()}">
					<li><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/board/BoardModify.bo?boardNum=${board.getBoardNum()}'" /></li>
					<li><input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/BoardDeleteOk.bo?boardNum=${board.getBoardNum()}'" /></li>
				</c:if>
			</ul>
		</div>
		<div class="section2">
		<hr>
			<h2>제목 ${board.getBoardTitle()}</h2>
			<hr>
			<p>작성자 :
				${board.getBoardId()}</p>
			<hr style="margin-bottom:50px; margin-top:10px;">
			<c:if test="${files != null}">
				<div>첨부파일</div>
				<c:forEach var="file" items="${files}">
					<a
						href="${pageContext.request.contextPath}/board/FileDownloadOk.bo?fileName=${file.getFileName()}"><c:out
							value="${file.getFileNameOriginal()}" /></a>
					<br>
				</c:forEach>
			</c:if>
			<hr style="margin-top:50px; margin-bottom:30px;">
				<h3><pre style="margin-bottom:60px;">${board.getBoardContent()}</pre></h3>
		</div>

		<div class="section3">
				<h2>댓글</h2>
			<form method="post" action="#">
				<textarea name="content" id="content" placeholder="비속어를 사용하지 말아주세요."></textarea>
				<input id="register" type="button" value="등록" onclick="comment()" />
			</form>
			<form id="replies">
			</form>
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
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
	$(document).ready(function(){getList();});
	
	let pageContext = "${pageContext.request.contextPath}";
	let boardNum = "${board.getBoardNum()}";
	
	function getList(){
		$.ajax({
			url: pageContext + "/board/BoardReplyListOk.bo?boardNum=" + boardNum,
			type: "get",
			dataType: "json",
			success: showList
		});
	}
	
	let replyList;
	
	function showList(replies){
		replyList = replies;
		let text = "";
		
		if(replies != null && replies.length != 0){
			$.each(replies, function(index, reply){
				text += "<div id='reply'>";
				text += "<p class='writer'>" + reply.memberId + "</p>";
				text += "<div class='content' id='" + (index + 1) +"' style='width:100%'><pre>" + reply.replyContent + "</pre></div>"
				if("${sessionId}" == reply.memberId){
					text += "<input type='button' id='ready" + (index + 1) + "' class='primary' onclick=readyToUpdate(" + (index + 1) + ") value='수정'>";
					text += "<input type='button' id='ok" + (index + 1) + "' class='primary' style='display:none' onclick=update(" + (index + 1) + "," + reply.replyNum + ") value='수정완료'>";
					text += "<input type='button' id='remove" + (index + 1) + "' class='primary' onclick=deleteReply(" + reply.replyNum + ") value='삭제'>";
				}
				text += "</div>";
			});
		}else{
			text = "<p>댓글이 없습니다.</p>";
		}
		
		$("#replies").html(text);
	}
	
	function comment(){
		let replyContent = $("textarea[name='content']").val();
		
		$.ajax({
			url: pageContext + "/board/BoardReplyWriteOk.bo",
			type: "post",
			data: {"boardNum": boardNum, "replyContent": replyContent},
			success: function(){
				$("textarea[name='content']").val("");
				getList();
			}
		});
	}
	
	let check = false;
	
	//수정 버튼
	function readyToUpdate(index){
		let div = $("#" + index);
		let modifyReady = $("#ready" + index);
		let modifyOk = $("#ok" + index);
		let remove = $("#remove" + index);
		
		if(!check){
			div.replaceWith("<textarea name='replyContent' id='" + index + "' class='invert' style='border-radius:0; resize:none;'>" + div.text() + "</textarea>")
			remove.replaceWith("<input type='button' id='cancel" + index + "' value='취소' onclick=updateCancel(" + index + ")>")
			
			modifyReady.hide();
			modifyOk.show();
			check = true;
		}else{
			alert("수정중인 댓글이 있습니다.");
		}
	}
	
	//수정 취소
	function updateCancel(index){
		let remove = $("#cancel" + index);
		let textarea = $("#" + index);
		let modifyReady = $("#ready" + index);
		let modifyOk = $("#ok" + index);
		
		modifyReady.show();
		modifyOk.hide();
		
		remove.replaceWith("<input type='button' id='remove" + index + "' class='primary' onclick='' value='삭제'>");
		textarea.replaceWith("<div class='content' id='" + index + "' style='width:100%'><pre>" + replyList[index - 1].replyContent + "</pre></div>");
		check = false;
	}
	
	//수정완료
	function update(index, replyNum) {
		let replyContent = $("textarea#" + index).val();
		let json = new Object();
		
		json.replyNum = replyNum;
		json.replyContent = replyContent;
		
		$.ajax({
			url: pageContext + "/board/BoardReplyModifyOk.bo",
			type: "post",
			data: json,
			success: function () {
				check = false;
				getList();
			}
		});
	}
	
	//댓글 삭제
	function deleteReply(replyNum) {
		$.ajax({
			url: pageContext + "/board/BoardReplyDeleteOk.bo",
			type: "post",
			data: {"replyNum": replyNum},
			success: function () {
				getList();
			}
		});
	}
</script>
</body>
</html>