<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>
	.background{
		background-image: url("../image/login5.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;		
	}
	.text{
		color:#292929;
	}
	.sorry{
		color:#4d2222;
	}
	.errorbutton a:hover{
		cursor:pointer
	}
</style>
<script>
	function goback(){
		if(document.referrer){
			history.back();			
		}else{
			window.alert("이전페이지가 존재하지 않아 홈으로 이동합니다.");
			location.href = "<%=request.getContextPath() %>/index.jsp";
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
</head>
<body>
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="background" align="center">
	<div class="row-big"><br></div>
	<div class="row-big"><br></div>
	<div class="row-big"></div>
	<div class="sorry"><h1>죄송합니다</h1></div>
	<div class="text">
		<h3>서버에서 오류가 발생하였습니다.</h3>
		<h3>이용에 불편을 드려 사과드립니다.</h3>
	</div>
	<div align="center" class="errorbutton">
		<a href="<%=request.getContextPath() %>/index.jsp">홈</a>
		<a onclick="goback();">이전페이지</a>
	</div>
</div>       
</body>
</html>