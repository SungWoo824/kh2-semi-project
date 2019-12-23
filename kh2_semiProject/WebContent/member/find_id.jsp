<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("member_id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<style type="text/css">

*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #findIdbox, input,label {margin:0 auto; padding:0; border:0}
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
	height: 220px;
	overflow: hidden
}

#findIdbox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uname, input#ubirth, input#uphone {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #efefef
}

label#fUname, label#fUbirth, label#fUphone {
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

#findIdbox hr {
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
</style>
</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>아이디 찾기</h1>
		<h2>잊어버린 아이디 찾기를 도와드릴께요!</h2>
		<div id="wrap">
		<form action="find.do" method="post">

			<div id="findIdbox">
				<label for="uname" id="fUname">이름</label> <input id="uname" type="text" title="이름" name="member_name" required>
				<div class="block"></div>
				<label for="ubirth" id="fUbirth">생년월일</label> <input id="ubirth" title="생년월일" name="member_birthday" required>
				<div class="block"></div>
				<label for="uphone" id="fUphone">휴대폰번호</label> <input id="uphone" title="휴대폰번호" name="member_phone" required>
				<div class="block"></div>
				<span class="bt">
					<input id="login_bt" type="submit" value="확인">
				</span>
			</div>
		</form>
		</div>
		<%if(request.getParameter("id") != null){%>
			<font color="red"><h3>회원을 찾을 수 없습니다.</h3></font>
		<%} %>
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>
				
				
				
					
				
				
			
	
	
	