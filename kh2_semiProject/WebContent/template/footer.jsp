<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
 	* {
 		box-sizing: border-box;
 		background-color: rgba(229, 231, 235, 0);
 	}
 	@font-face{
    	font-family: binggrae;
    	src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	footer{
		background-color: rgba(229, 231, 235, 0);
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	}
	.foot{
		font-family: binggrae;
		background-color: rgba(229, 231, 235, 0);
		display: inline-block;
	}
	.foot-menu{
		margin-bottom: 1rem;
		margin-left: 10px;
		background-color: rgba(229, 231, 235, 0);
		display: inline-block;
	}
	.foot-logo > img{
		width: 100px;
		background-color: rgba(229, 231, 235, 0);
	}
	.foot-logo{
		height: 10px;
		background-color: rgba(229, 231, 235, 0);	
	}
	.name{
		margin-left: 100px;
		background-color: rgba(229, 231, 235, 0);
		margin-bottom: 50px;
		color: black;
	}
	.foot-menu-right{
		display: inline-block;
		margin-left: 10px;
	}
	
 	footer{
 		height: 50%;
 	}	
 </style>
</head>
<body>
	<footer>
	<div class="foot">
		<a href="#">
			<div class="foot-logo"><img src="<%=request.getContextPath() %>/image/logo2.png"></div>
			<h2 class="name">&copy; 대표자: 박성우 | 예금주: 김보경</h2>
			
		</a>
	</div>
	<div class="foot-menu">
		<p class="foot-menu">회사소개 |개인정보보호정책 |서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F ☎(T: 1544-9970 / F: 02-2163-8560)</p>
	</div> 
	<div class="foot-menu-right">
		<p>Copyright © Kakao Corp. All rights reserved.</p>
	</div>
		
	
	</footer>
</body>

</html>