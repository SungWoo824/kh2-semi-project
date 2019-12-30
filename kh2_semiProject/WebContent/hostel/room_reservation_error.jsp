<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, h1,h2,h3,#wrap, #loginbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}
	* {
	box-sizing: border-box;
	}
@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
.backBody{
	height: 800px;
	padding-top:40px;
	background-image: url("../image/login5.jpg"); background-position:center; background-repeat: no-repeat;
	}
.body {background-color:#efefef; color:#333; font-size:0.8em;}
.footer{bottom: 0px; position: absolute; width: 100%;}

#reservation-fail{
	font-size: xx-large;
	text-align: center;
	margin-top: 250px;
}
#money-error{
	font-size: x-large;
	background-color: black;
	color: #efefef;
}
#detail-error{
	font-size: medium;
	color: red;
}
</style>
</head>
<body class="backBody">
<div>
	<jsp:include page="/template/nav.jsp"></jsp:include>
</div>
    <div id="reservation-fail">
    	
        <h2>예약이 취소되었습니다.</h2>
 			<h3 id="detail-error">
 				죄송합니다.<br>
 				시스템 오류로 인해 입력이 초기화 되었습니다.<br>
 				다시 시도해주세요.
			</h3>

        <a href="../index.jsp">
            <button id="money-error">메인화면으로 돌아가기</button>
        </a>
	</div>

</body>
<div class="footer">
	<jsp:include page="/template/footer.jsp"></jsp:include>
</div>

</html>