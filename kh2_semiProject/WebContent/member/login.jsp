<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
/*
	*{
		box-sizing: border-box;
		font-family: binggrae;
		
	}
	.title{
		
		border-collapse: collapse;
		text-decoration: underline;
		cursor: pointer; 
		
	}
	.title th{
		
	}
	.login{
		background-image: url("../image/login5.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 100% 100%;
		font-size: 1.2rem;
		
	}
	.id{
		border: 0;
		background-color: #ededef;
		text-decoration: underline;
		margin: 20px;
		height: 3rem;
		font-size: 1.2rem;
		
		
	}
		
	.pw{
		border: 0;
		background-color: #ededef;
		text-decoration: underline;
		margin: 20px;
		height: 3rem;
		font-size: 1.2rem;
		
	}
	.log_in{
		border: 0;
		background-color: #ededef;
		margin: 20px;
		height: 3rem;
		font-size: 1.2rem;
		cursor: pointer;

	}
		
	.menu-item{
		border: 0;
		background-color: #ededef;
		margin: 20px;
		height: 3rem;
		font-size: 1.2rem;
		color: black;
	}
	
	.logo-image > img{
		text-align:left;
		width: 150px;
		height: 150px;
		margin: auto;
	}
	.login > .login-bar{
		margin-top: 200px;
	}
		
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
	*/

*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #loginbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 700px;
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

#loginbox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uid, input#upass {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #efefef
}

label#fUid, label#fUpass {
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

#loginbox hr {
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

	<!-- 	<div class="login" align="center"> -->
	<!-- 		<div class="login-bar"> -->
	<!--         <div class="top-bar__logo"> -->
	<!-- 			<h2><font color="black">L O G I N</font></h2> -->
	<!--         </div> -->




	<!-- 	<form action="/kh2_semiProject/member/login.do" method="post"> -->
	<!-- 	<table class="title"> -->
	<!-- 		<tr> -->
	<!-- 			<th align="center"> -->
	<!-- 				<input class="id" type="text" name="member_id" placeholder="ID"> -->
	<!-- 			</th> -->
	<!-- 		</tr> -->

	<!-- 		<tr> -->
	<!-- 			<th align="center"> -->
	<!-- 				<input class="pw" type="password" name="member_pw" placeholder="Password"> -->
	<!-- 			</th> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<th align="center"> -->
	<!-- 				<input style="margin: 20px" height="3rem" class="log_in" type="submit" value="확 인"> -->
	<!-- 			</th> -->
	<!-- 		</tr> -->



	<!-- 		<tr> -->
	<!-- 			<th> -->
	<!-- 				<input type="checkbox"> -->
	<!-- 				<font color="black">ID 저장</font> -->
	<!-- 			</th> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td align="center"> -->
	<!-- 				<p> -->
	<!-- 				<a class="menu-item" href="find_id.jsp">아이디찾기/</a> -->
	<!-- 				<a class="menu-item" href="find_pw.jsp">비밀번호찾기</a> -->
	<!-- 				</p> -->
	<!-- 				<a class="menu-item" href="regist.jsp">회원가입</a> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 	</table> -->
	<!-- 	</form> -->
	<%-- 	<%if(error != null){%> --%>
	<!-- 		<font color="red"><h3>잘못된 회원정보입니다.</h3></font> -->
	<%-- 	<%} %> --%>
	<!-- </div> -->
	<!--           </div> -->
	<div class="backBody">
		<h1>LOGIN</h1>
		<h2>
			로그인이 필요한 페이지 입니다.<br />로그인 후, 이용해주시길 바랍니다.
		</h2>
		<div id="wrap">
			<form action="/kh2_semiProject/member/login.do" method="post">
			<div id="loginbox">
				<label for="uid" id="fUid">아이디</label> <input id="uid" type="text" title="아이디" name="member_id" placeholder="ID">
				<div class="block"></div>
				<label for="upass" id="fUpass">암호</label> <input id="upass" title="암호" type="password" name="member_pw" placeholder="Password">
				<div class="block"></div>
				<span class="bt">
					<input id="login_bt" type="submit" value="Login">
				</span>
				<a href="regist.jsp"><span class="bt2">회원가입하기</span></a>
				<a href="find_id.jsp"><span class="bt1">아이디 찾기</span></a>
				<a href="find_pw.jsp"><span class="bt1">비밀번호 찾기</span></a>
			</div>
			</form>
		</div>
		<%if(error != null){%>
			<font color="red"><h3>잘못된 회원정보입니다.</h3></font>
		<%} %>
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>