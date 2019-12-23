<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>405 에러 페이지</title>
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
	<div class="text"><h1>지원하지 않는 방식</h1></div>
	<div align="center" class="errorbutton">
		<a href="<%=request.getContextPath() %>/index.jsp">홈</a>
		<a onclick="goback();">이전페이지</a>
	</div>
</div>       
</body>
</html>