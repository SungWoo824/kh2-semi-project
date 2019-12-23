<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 페이지</title>

<style type="text/css">
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	*{
		box-sizing: border-box;
		font-family: binggrae;
	}
	.regist_success{
		background-image: url("../image/login5.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
		
	}
	.menu-item{
		position: relative;
		top: 140px;
		
	}
</style>
</head>
<body>
<div class="regist_success" align="center">
	<div class="menu-item">
		<h2 class="menu-item"><font color="black">환영합니다 !! </font></h2>
		<h3 class="menu-item">지금바로 등록/예약 해보세요.</h3>
		<%if(id != null){ %>
			<a class="menu-item" href = "../info/reserve_info.jsp">예약설명 보러가기</a>
		<%} else {%>	
			<a class="menu-item" href = "../info/regist_info.jsp">등록설명 보러가기</a>
		<%} %>	
	</div>
</div>

</body>
</html>
	
	