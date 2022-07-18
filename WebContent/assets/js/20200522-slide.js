$("document").ready(function () {
    //alert("")
    $(".btn ul li").click(function () {
        var i = $(this).index()
        $(".main .slide .banner").hide().eq(i).show()
    }) //버튼 클릭 시 배너이미지 변경
    
    
    var k = 0
    var timer = setInterval(function(){
        
        k++;
        if(k > $(".main .slide .banner").length-1){
            k = 0
        }
        $(".main .slide .banner").hide().eq(k).show()
        }, 3000) //배너 이미지 3초마다변경
    
}) //jquery End