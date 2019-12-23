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
	* {
		box-sizing: border-box;
		border-collapse: collapse;
		font-family: binggrae; 
	}
	.regist{
		background-image: url("../image/regist2.jpg");
		height: 800px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
	}
	.menu-item{
		border: 0;
		background-color: #b09f8d;
				
	}
	.logo-image img{
		text-align:left;
		width: 150px;
		height: 150px;
		margin: auto;
	}
	.title{
		text-decoration: underline;
	}
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
</style>
</head>
<body>

<jsp:include page="/template/nav.jsp"></jsp:include>
<div class="regist" align ="center">
	<h2><font color="black">S I G N UP</font></h2>
	<form action="regist.do" method = "post">
<!-- 	    <div class="logo-image"> -->
<!--         	<img src="../image/LOGO.png" align="left"> -->
<!--         </div> -->
        <br><br><br><br><br><br><br><br>
	<table class="title" border="0">
		<tr>
			<th>I D</th>
			<th><input class="menu-item" type = "text" name="member_id" required></th>
		</tr>
		<tr>
			<th>P A S S W O R D</th>
			<th><input class="menu-item" type = "password" name="member_pw" required></th>
		</tr>
		<tr>
			<th>N A M E</th>
			<th><input class="menu-item" type = "text" name="member_name" required></th>
		</tr>
		<tr>
			<th>B I R T H</th>
			<th><input class="menu-item" type = "date" name="member_birthday"></th>
		</tr>
		<tr>
			<th>P H O N E</th>
			<th><input class="menu-item" type = "text" name="member_phone"></th>
		</tr>
		<tr>
			<th>E - M A I L</th>
			<th><input class="menu-item" type = "text" name="member_email"></th>
		</tr>
		<tr>
			<th>T Y P E</th>
			<th><select class="menu-item" name="member_grade">
				<option>사용자</option>
				<option>판매자</option>
			</select></th>
		</tr>
		<tr><td colspan = "2" align = "center">
		<input class="menu-item" type = "submit" value = "회원 가입">
		</td></tr>
	</table>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>