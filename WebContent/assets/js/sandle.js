$("document").ready(function() {
	/* 팝업1 */
	$(".wrap1 .div2").click(function() {
		var i = $(".wrap1 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap1 .sId").val("sd1" + size[i]);
			}

	})
		$(".wrap2 .div2").click(function() {
		var i = $(".wrap2 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap2 .sId").val("sd2" + size[i]);
			}

	})
		$(".wrap3 .div2").click(function() {
		var i = $(".wrap3 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap3 .sId").val("sd3" + size[i]);
			}

	})
		$(".wrap4 .div2").click(function() {
		var i = $(".wrap4 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap4 .sId").val("sd4" + size[i]);
			}

	})
		$(".wrap5 .div2").click(function() {
		var i = $(".wrap5 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap5 .sId").val("sd5" + size[i]);
			}

	})
		$(".wrap6 .div2").click(function() {
		var i = $(".wrap6 .div2").index(this);
		var size = [220, 230,240,250,260,270,280,290];
			for (var j = 0; j < size.length; j++) {
			$(".wrap6 .sId").val("sd6" + size[i]);
			}

	})


}) //jquery end   
