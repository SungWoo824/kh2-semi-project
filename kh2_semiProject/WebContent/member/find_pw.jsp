<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String tryYn = request.getParameter("tryYn");
//  	MemberDao dao = new MemberDao();
	
//  	boolean result = dao.find_pw(id, name, phone);
%>
	
	
			
	
	
	
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	* {
		box-sizing: border-box;
				
	}
	.find_pw{
		background-image: url("../image/find_pw.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
		
		
	}
	.menu-item{
		border: 0;
		background-color: #ffffff;
		background-color: rgba( 255, 255, 255, 0.5 );
		text-align: center;
	}
	.find{
		margin-top: 15%;
	} */

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

#findPwbox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uid, input#uname,input#uphone {
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #efefef
}

label#fUid, label#fUname,label#fUphone {
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

#findPwbox hr {
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
		
</style>

</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>비밀번호 찾기</h1>		
		<h2>잊어버린 비밀번호 찾기를 도와드릴게요 !</h2>
		<div id ="wrap">
	 	<form action="findpw.do" method="post">
	<!-- 		<table border="0">	
				<tr>
					<td>
					<input class="menu-item" type="text" name="member_id" placeholder="ID" required>
					
					</td>
				</tr>
				<tr>
					<td>
					<input class="menu-item" type="text" name="member_name" placeholder="Name" required>
					
					</td>
				</tr>
				<tr>
					<td>
					<input class="menu-item" type="text" name="member_phone" placeholder="Phone" required>
					
					</td>
				</tr>
						
				<tr align="center">
					<td>
					<input class="menu-item" type="submit" value="확인">
					</td>	
				</tr>
			</div>	
		</div>
		</table> -->
			<div id="findPwbox">
				<label for="uid" id="fUid">아이디</label> <input id="uid" type="text" title="아이디" name="member_id" required>
				<div class="block"></div>
				<label for="uname" id="fUname">이름</label> <input id="uname" title="이름" name="member_name" required>
				<div class="block"></div>
				<label for="uphone" id="fUphone">휴대폰번호</label> <input id="uphone" title="휴대폰번호" name="member_phone" required>
				<div class="block"></div>
				<span class="bt">
					<input id="login_bt" type="submit" value="확인">
				</span>
			</div>
			<br>
			<font  color="red">
				<h2><a href="login.jsp">로그인 하러 가기</a></h2>
			</font>
		</form>
		</div>	
			
			
 			<%
 			if(tryYn != null){
	 			if(id != null){ %>
					<h2>고객님의 ID : <%=id %>입니다.</h2>
	 			<%}else{ %>
	 			<h2>입력하신 정보에 해당하는 회원이 없습니다.</h2>
<!-- 	 			<h3><a href="find.jsp">다시 입력하기 </a></h3> -->
	 			<%} 
	 		}%>
			
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>