<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 실패 페이지</title>
<style type="text/css">
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	* {
		box-sizing: border-box;
		font-family: binggrae;
	}
	.regist_fail{
		background-image: url("../image/regist_fail2.jpg");
		height: 800px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
	}
	.fail{
		position: relative;
		top: 140px;
	}

</style>

</head>
<body>
<div class="regist_fail" align="center">
	<div class="fail">
		<font color="white"><h2 class="fail">회원가입에 실패 하였습니다.</h2></font>
		<font class="fail" color="white"><h4><a href="regist.jsp">아이디가 존재합니다. 다시 회원가입 해주세요.</a></h4></font>
	</div>
</div>
<div>
</div>
</body>
</html>