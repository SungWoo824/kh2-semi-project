<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #paybox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 1000px;
	padding-top:40px;
	background-image: url("../image/pay.jpg"); background-position:center; background-repeat: no-repeat; 
}

@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
h1 {
	margin-top: 100px;
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

#wrap-left {
	display: inline-block;
	width: 360px;
	border: 1px solid #ddd;
	background-color: rgba(255,255,255,0.8);
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden;
	margin-left: 600px;
	margin-top: 250px;
}
#wrap-right {
	display: inline-block;
	width: 360px;
	border: 1px solid #ddd;
	background-color: rgba(255,255,255,0.3);
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden;
	margin-top: 250px;
}

#paybox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uname, input#uphone, input#uperson, input#upay, input#upay1 {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #d9d9d9
}

label#fUname, label#fUphone, label#fUperson, label#fUpay, label#fUpay1 {
	width: 60px;
	margin: 0;
	padding-top: 5px;
	display: inline-block;
	vertical-align: top
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

#paybox hr {
	color: #ddd;
	height: 1px;
	background-color: #ddd
}

#login_bt {
	width: 285px;
	height: 35px;
	background-color: #83dcb7;
	font-weight: bold;
	color: #fff;
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
#upay, #upay1{
	
}

</style>
</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>

	<div class="backBody">
		<div id="wrap-left">
		<h1>Member Info</h1>
		<h2>
			 예약정보입니다.<br />예약 내역 확인부탁드립니다.
		</h2>
			<form action="/kh2_semiProject/member/login.do" method="post">
			<div id="paybox">
				<label for="uname" id="fUname">예약자이름</label> <input id="uname" type="text" title="이름" name="member_name">
					<div class="block"></div>
				<label for="uphone" id="fUphone">휴대폰번호</label> <input id="uphone" title="휴대폰번호" type="text" name="member_phone"> 
					<div class="block"></div>
				<label for="uperson" id="fUperson">인원수</label> <input id="uperson" type="text" title="인원수" name="member_person">
					<div class="block"></div>
				<label for="upay" id="fUname">결제수단</label> 
					<div class="block"></div>	
				<label>카카오페이</label><input id="upay" type="radio" title="결제" name="member_pay">
					<div class="block"></div>
					<div class="block"></div>
				<label>네이버페이</label><input id="upay1" type="radio" title="결제" name="member_pay">
					<div class="block"></div>	
<!-- 				<span class="bt">
					<input id="login_bt" type="submit" value="결제하기">
				</span> -->
			</div>
			</form>
		</div>
				
					
		<div id="wrap-right">
		<h1>Pay</h1>
		<h2>
			 결제가 필요한 페이지 입니다.<br />결제 내역 확인부탁드립니다.
		</h2>
			<form action="/kh2_semiProject/member/login.do" method="post">
			<div id="paybox">
				<label for="uname" id="fUname">숙소이름</label> <input id="uname" type="text" title="이름" name="member_name">
					<div class="block"></div>
				<label for="uphone" id="fUphone">객실이름</label> <input id="uphone" title="휴대폰번호" type="text" name="member_phone"> 
					<div class="block"></div>
				<label for="uperson" id="fUperson">체크인</label> <input id="uperson" type="text" title="인원수" name="member_person">
					<div class="block"></div>
				<label for="uperson" id="fUperson">체크아웃</label> <input id="uperson" type="text" title="인원수" name="member_person">
					<div class="block"></div>
				<label for="uperson" id="fUperson">결제금액</label> <input id="uperson" type="text"> 
					<div class="block"></div>
					<div class="block"></div>
					<div class="block"></div>
					<div class="block"></div>
					<div class="block"></div>
				<span class="bt">
					<input id="login_bt" type="submit" value="결제하기">
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