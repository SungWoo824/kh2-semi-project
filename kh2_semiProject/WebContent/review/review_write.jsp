<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
System.out.println(reservation_no);
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<meta charset="UTF-8">
<title>리뷰 페이지</title>
 <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor-contents.min.css">

    <script src="../lib/toast/dist/tui-editor-Editor-full.min.js"></script>
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->

    <script>
        //naver toast ui를 만들기 위한 코드
        function createEditor(){
            //editor 옵션
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-editor"),
                //previewStyle : 표시되는 방식(horizontal, vertical)
                previewStyle:'vertical',
                //height : 생성될 에디터의 높이
                height:'300px',
                //initialEditType : 생성될 에디터의 초기화면 형태(markdown, wysiwyg)
                initialEditType:'markdown'
            };
            //editor 생성 코드
            var editor = tui.Editor.factory(options);
            //editor에 이벤트를 설정해서 입력하면 자동으로 input에 복사되게 구현
            //- input이라는 상황이 발생하면 오른쪽 function을 실행하라
            //- oninput이랑 동일한데 자바스크립트로만 구현
            editor.on("change", function(){
                //editor의 입력값을 가져와서 input에 설정
                var text = editor.getValue();
                var input = document.querySelector(".naver-editor + input");
                input.value = text;
            });
        }
        //body가 없는 경우에는 다음과 같이 작성
        // - 예약 실행(callback)
        window.onload = createEditor;
    </script>
<style type="text/css">
*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #reviewbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 100%;
	width:100%;
	padding-top:40px;
	
 background-image: url("<%=context %>/image/mypage6.jpg"); background-position:center; background-repeat: no-repeat; 
 border: 0.8px solid gray;
}

@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
h1 {
	margin-top: 120px;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px;
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
	 min-height: 90vh;
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
	background-color: #efefef;
}

.bt2 {
	display: inline-block;
	width: 285px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef;
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

	footer{
		background-color: #f6f6f6;
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	bottom:0;
		
	width: 100%;
	height: 8rem;
	}
</style>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">

<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
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
<body >

	
	<div class="backBody">
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
		<h1>REVIEW</h1>
		<h2>
			리뷰를 남겨주세요.
		</h2>	
		<div id="wrap">
	<form name="review" action="review_write.do"  method="post" enctype="multipart/form-data">
		<input type="text" name="reservation_no" value="<%=reservation_no%>">
		<input type="text" name="hostel_no" value="<%=hostel_no%>">
		<div id="reviewbox">
		<div>
		<label for="ureview" id="fUreview">리뷰</label><br>
		<div class="naver-editor"></div>    
    <input type="hidden" name="content">
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
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	</div>
	
</body>
</html>