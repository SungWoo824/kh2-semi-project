<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	String error = request.getParameter("error");
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
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
		background-size: 98% 100%;
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
</style>
</head>
<body>
<div>
<jsp:include page="/template/nav.jsp"></jsp:include>
</div>

	<div class="login" align="center">
		<div class="login-bar">
        <div class="top-bar__logo">
			<h2><font color="black">L O G I N</font></h2>
        </div>
        	


		
	<form action="/kh2_semiProject/member/login.do" method="post">
	<table class="title">
		<tr>
			<th align="center">
				<input class="id" type="text" name="member_id" placeholder="ID">
			</th>
		</tr>
		
		<tr>
			<th align="center">
				<input class="pw" type="password" name="member_pw" placeholder="Password">
			</th>
		</tr>
		<tr>
			<th align="center">
				<input style="margin: 20px" height="3rem" class="log_in" type="submit" value="확 인">
				
			</th>
		</tr>
		
		

		<tr>
			<th>
				<input type="checkbox">
				<font color="black">ID 저장</font>
			</th>
		</tr>
		<tr>
			<td align="center">
				<p>
				<a class="menu-item" href="find_id.jsp">아이디찾기/</a>
				<a class="menu-item" href="find_pw.jsp">비밀번호찾기</a>
				</p>
				<a class="menu-item" href="regist.jsp">회원가입</a>
			</td>
		</tr>
	</table>
	</form>
	<%if(error != null){%>
		<font color="red"><h3>잘못된 회원정보입니다.</h3></font>
	<%} %>
</div>
          </div>
<div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</div>         
</body>
</html>




		
		







		
	
	
	
	
	
