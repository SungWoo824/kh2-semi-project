<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<style type="text/css">


*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #registbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 800px;
	padding-top:40px;
	background-image: url("../image/login5.jpg"); background-position:center; background-repeat: no-repeat; 
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

#wrap {
	width: 360px;
	border: 1px solid #ddd;
	background-color: #fff;
	padding: 15px;
	margin-bottom:10px;
	height: 400px;
	overflow: hidden
}

#registbox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uid, input#upass, input#upname, input#ubirth, input#uphone, input#uemail, input#ugrade, input#ugrade1 {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #efefef
}

label#fUid, label#fUpass, label#fUname, label#fUbirth, label#fUphone, label#fUemail, label#fUgrade {
	width: 60px;
	margin: 0;
	padding-top: 5px;
	display: inline-block;
	vertical-align: top
}

.bt {
	display: inline-block;
/*  border: 1px solid #ccc */
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

#registbox hr {
	color: #ddd;
	height: 1px;
	background-color: #ddd
}

#login_bt {
	width: 285px;
	height: 35px;
	background-color: #000;
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
#fUgrade{
	text-align:;
}	
</style>
</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	
<div class="backBody">	
	<h1>SIGN UP</h1>
	<h2>
		회원가입을 도와드릴께요.
	</h2>
	<div id="wrap">
		<form action="regist.do" method = "post">
		<div id="registbox">
			<label for="uid" id="fUid">아이디</label> <input id="uid" type="text" title="아이디" name="member_id" placeholder="ID" >
				<div class="block"></div>
			<label for="upass" id="fUpass">암호</label> <input id="upass" title="암호" type="password" name="member_pw" placeholder="Password">
				<div class="block"></div>
			<label for="uname" id="fUname">이름</label> <input id="upname" title="이름" type="text" name="member_name" placeholder="Name">
				<div class="block"></div>
			<label for="ubirth" id="fUbirth">생일</label> <input id="ubirth" title="생일" type="text" name="member_birthday" placeholder="Birth">
				<div class="block"></div>
			<label for="uphone" id="fUphone">휴대폰번호</label> <input id="uphone" title="휴대폰번호" type="text" name="member_phone" placeholder="Phone">
				<div class="block"></div>
			<label for="uemail" id="fUemail">이메일</label> <input id="uemail" title="이메일" type="text" name="member_email" placeholder="e-mail">
				<div class="block"></div>
			<label></label>사용자<input id="ugrade" title="등급" type="radio" name="member_grade" value="사용자">
				<div class="block"></div>
			 <label></label>판매자<input id="ugrade1" title="등급1" type="radio" name="member_grade" value="판매자">				
				<div class="block"></div>
				
				
				<!--<span class="bt">  -->
					<input id="login_bt" type="submit" value="가입하기" >
					
				<!--  </span>-->
				
				<a href="find_id.jsp"><span class="bt1">아이디 찾기</span></a>
				<a href="find_pw.jsp"><span class="bt1">비밀번호 찾기</span></a>
			</div>
		</form>
	</div>
</div>		

<div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</div>	
</body>
</html>