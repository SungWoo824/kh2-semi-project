<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<<<<<<< HEAD
<meta charset="UTF-8">
=======
<meta charset="UTF-8">

>>>>>>> refs/remotes/origin/master
<title>리뷰 페이지</title>
<style type="text/css">
*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #reviewbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 1200px;
	padding-top:40px;
	background-image: url("../image/pay1.jpg"); background-position:center; background-repeat: no-repeat; 
}

@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
h1 {
	margin-top: 120px;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px
}

h2 {
	padding-bottom: 20px;
	text-align: center;
	font-size: 13px;
	font-weight: normal;
	line-height: 120%;
	letter-spacing: -1px;
	color: #666;
}

h3 {
	text-align: center;
	padding: 10px 0 10px 0;
	margin-bottom: 10px;
	font-size: 14px;
	letter-spacing: -1px;
	border-bottom: 1px solid #ccc;
}

#wrap {
	width: 1200px;
	border: 1px solid #ddd;
	background-color: rgba(255,255,255,0.3);
	padding: 15px;
	margin-bottom:10px;
	height: 800px;
	overflow: hidden;
	margin-top: 30px;
	font-size: 18px;
}

#reviewbox {
	width: 80%;
	margin:auto;
	padding: 5px;
}

input#ureview, input#upoint {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	
	
}

label#fUreview, label#fUpoint {
	width: 60px;
	margin: 0;
	padding-top: 5px;
	display: inline-block;
	vertical-align: top;
	
}

.bt {
	display: inline-block;
/* 	border: 1px solid #ccc */
}

.bt1 {
	display: inline-block;
	width: 140px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

.bt2 {
	display: inline-block;
	width: 285px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

#reviewbox hr {
	color: #ddd;
	height: 1px;
	background-color: #ddd;
	
}

#login_bt {
	width: 285px;
	height: 35px;
	background-color: #000;
	font-weight: bold;
	color: #fff;
	margin-left: 320px;
	margin-top: 70px;
}

.block {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 0;
}

a {
	text-decoration: none;
	color: #333;
}

#star_grade>a{
        text-decoration: underline;
        color: grey;
    }
#star_grade>a.on{
        color: #FFEE4A;
    }
#fUreview{
	resize: none;
	
}
#fUpoint{
	

}
#fUimage{
	margin-bottom: 30px;
}
.reviewbox-menu{
	width:100%;
}
.reviewbox-menu-one{
	display:inline-block;
	text-align: center;
	width: 40%;
	height: 400px;
	border: 1px solid black;
	float: left;
}
.reviewbox-menu-two{
	display:inline-block;
	width: 60%;
	height: 400px;
	border: 1px solid black;
	float: left;
}
.noresize{
	resize: none;
	margin: 0px;
    width: 919px;
    height: 183px;
}
.noresize-img{
	resize: none;
	margin: 0px;
    height: 299px;
    width: 460px;
}
.dropzone{
	position: relative;
	width: 554px;
	height: 370px;
	opacity: 0.01;
}
#foo{
	position: absolute;
	width: 554px;
	height: 370px;
}
.star_style{
	font-size: 3rem;
}
img:[src="<%=request.getContextPath() %>/image/리뷰사진.png"]{
	opacity: 0.5;
}
</style>
<script>
		var star_ex;
		function star(){
		$('#star_grade a').click(function(){
    	$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    	$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    	return false;
		});
		}
		function star1(){
			document.getElementById('star').value=1;
			document.getElementById('star_ex').innerHTML=" 별로에요";
		}
		function star2(){
			document.getElementById('star').value=2;
			document.getElementById('star_ex').innerHTML=" 그저그래요";
		}
		function star3(){
			document.getElementById('star').value=3;
			document.getElementById('star_ex').innerHTML=" 나쁘지않아요";
		}
		function star4(){
			document.getElementById('star').value=4;
			document.getElementById('star_ex').innerHTML=" 좋아요";
		}
		function star5(){
			document.getElementById('star').value=5;
			document.getElementById('star_ex').innerHTML=" 완전좋아요";
		}
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#foo	').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<body>

	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	
	<div class="backBody">
		<h1>REVIEW</h1>
		<h2>
			리뷰를 남겨주세요.
		</h2>	
		<div id="wrap">
	<form name="review" action="review_write.do"  method="post" enctype="multipart/form-data">
<!-- 		예약번호:<input type="text" name="reservation_no"><br>
		호텔번호:<input type="text" name="hostel_no"><br> -->
		<div id="reviewbox">
		<div>
		<label for="ureview" id="fUreview">리뷰</label><br>
		<textarea class="noresize" name="review_content" rows="10" cols="100" style="font-size: 1.5rem;"></textarea>
			<div class="block"></div>
			<div class="block"></div>
			<div class="block"></div>
		</div>	
		<div class="reviewbox-menu">
		<div class="reviewbox-menu-one">	
		<div style="font-size: 1.5rem;">별점을 메겨주세요</div>
			<p id="star_grade">
        		<a href="#" class="star_style" onclick="star(); star1();">★</a>
        		<a href="#" class="star_style" onclick="star(); star2();">★</a>
        		<a href="#" class="star_style" onclick="star(); star3();">★</a>
        		<a href="#" class="star_style" onclick="star(); star4();">★</a>
        		<a href="#" class="star_style" onclick="star(); star5();">★</a>
        		<input type="hidden" name="star_point" id="star" value="0">
			</p>
			<div id="star_ex" class="star_style"></div>
		</div>
		
		<div class="reviewbox-menu-two">	
			<label for="uimage" id="fUimage">리뷰사진</label><br>
			<img id="foo" src="<%=request.getContextPath() %>/image/리뷰사진.png">
			<input type="file" name="review_file" class="dropzone" id="imgInp" accept=".jpg, .png, .gif">
		<input type="text" name="image_point">
			
		</div>
		
		</div>

		<span class="bt">	
			<input id="login_bt" type="submit" value="확인">
		</span>
				
		</div>
	</form>
		</div>
	</div>
	
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>