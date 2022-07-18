$("document").ready(function() {
	/*** 공통된 js */
	/*카트 담길 때 액션*/
	$(".cart_go").submit(function() {
		alert("장바구니에 상품이 담겼습니다.");
	})
	/*전체가격 설정 */
	$('.wrap1 .cPriceAll,.wrap1 .cQuantity').on('change', function() {

		$('.wrap1 .cPriceAll').val(Number($('.wrap1 .cPrice').val()) * Number($('.wrap1 .cQuantity').val()))

	});
	$('.wrap2 .cPriceAll,.wrap2 .cQuantity').on('change', function() {

		$('.wrap2 .cPriceAll').val(Number($('.wrap2 .cPrice').val()) * Number($('.wrap2 .cQuantity').val()))

	});
	$('.wrap3 .cPriceAll,.wrap3 .cQuantity').on('change', function() {

		$('.wrap3 .cPriceAll').val(Number($('.wrap3 .cPrice').val()) * Number($('.wrap3 .cQuantity').val()))

	});
	$('.wrap4 .cPriceAll,.wrap4 .cQuantity').on('change', function() {

		$('.wrap4 .cPriceAll').val(Number($('.wrap4 .cPrice').val()) * Number($('.wrap4 .cQuantity').val()))

	});
	$('.wrap5 .cPriceAll,.wrap5 .cQuantity').on('change', function() {

		$('.wrap5 .cPriceAll').val(Number($('.wrap5 .cPrice').val()) * Number($('.wrap5 .cQuantity').val()))

	});
	$('.wrap6 .cPriceAll,.wrap6 .cQuantity').on('change', function() {

		$('.wrap6 .cPriceAll').val(Number($('.wrap6 .cPrice').val()) * Number($('.wrap6 .cQuantity').val()))

	});
	// 사이즈별로 클릭 시작 //
	var div2 = document.getElementsByClassName("div2");

	function handleClick(event) {
		console.log(event.target);
		// console.log(this);
		// 콘솔창을 보면 둘다 동일한 값이 나온다

		console.log(event.target.classList);

		if (event.target.classList[1] === "clicked") {
			event.target.classList.remove("clicked");
		} else {
			for (var i = 0; i < div2.length; i++) {
				div2[i].classList.remove("clicked");
			}

			event.target.classList.add("clicked");
		}
	}

	function init() {
		for (var i = 0; i < div2.length; i++) {
			div2[i].addEventListener("click", handleClick);
		}
	}

	init();
	// 사이즈별로 클릭 끝 //
	/* 전체 아이디 있어야 장바구니 담기, 결제가능*/
	$(".buy input[type=submit]").click(function() {
		var id_cart_pay = $(".id_cart_pay").val();
		if (id_cart_pay == "") {
			alert("로그인 후 장바구니,결제 기능을 이용할 수 있습니다.");
			location.href = "../app/member/login.jsp"
			return false;
		}
	});

	// 사이즈별로 클릭 시작 //
	var div2 = document.getElementsByClassName("div2");

	function handleClick(event) {
		console.log(event.target);
		// console.log(this);
		// 콘솔창을 보면 둘다 동일한 값이 나온다

		console.log(event.target.classList);

		if (event.target.classList[1] === "clicked") {
			event.target.classList.remove("clicked");
		} else {
			for (var i = 0; i < div2.length; i++) {
				div2[i].classList.remove("clicked");
			}

			event.target.classList.add("clicked");
		}
	}

	function init() {
		for (var i = 0; i < div2.length; i++) {
			div2[i].addEventListener("click", handleClick);
		}
	}

	init();
	// 사이즈별로 클릭 끝 //	

	var scroll = 0;
	var scroll2 = 0;
	$(window).scroll(function() {
		scroll = $(window).scrollTop();
		console.log(scroll)
	})

	$(".product-1 ul li").click(function() {
		var i = $(".product-1 ul li").index(this)
		$(".productpage-wrap").eq(i).show();
		$(".window").show();
		$("html, body").css("overflow", "hidden");
		$("html, body").on("scroll touchmove mousewheel", function(e) {
			e.preventDefault();
			e.stopPropagation();
			return false;
		})
		$("html, body").scrollTop(scroll)
		scroll2 = scroll;
	})
	$(".product-2 ul li").click(function() {

		var i = $(".product-2 ul li").index(this) + 3
		$(".productpage-wrap").eq(i).show();
		$(".window").show();
		$("html, body").css("overflow", "hidden");
		$("html, body").on("scroll touchmove mousewheel", function(e) {
			e.preventDefault();
			e.stopPropagation();
			return false;
		})
		$("html, body").scrollTop(scroll)
		scroll2 = scroll;
		console.log(scroll, scroll2)
	})

	$(".productpage-wrap ul .productpage-name .x-btn").click(function(e) {
		e.preventDefault();
		$(".window").hide();
		$(".productpage-wrap").hide();
		$("html, body").css("overflow", "visible");
		$("html, body").off("scroll touchmove mousewheel");
		$("html, body").scrollTop(scroll2)
	}) //닫기 버튼 끝

}) //jquery end   
