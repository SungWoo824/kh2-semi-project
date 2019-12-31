<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 완료!</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<style type="text/css">
* {
	font-family: binggrae;
}

body, h1, h2, h3, #wrap, #loginbox, input, label {
	margin: 0 auto;
	padding: 0;
	border: 0
}

body {
	background-color: #efefef;
	color: #333;
	font-size: 0.8em;
	font-family: "돋음", dotum, "굴림", gulim, 'Apple SD Gothic Neo', Helvetica,
		sans-serif
}

.backBody {
	height: 800px;
	padding-top: 80px;
	background-image: url("<%=request.getContextPath()%>/image/login5.jpg");
	background-position: center;
	background-repeat: no-repeat;
}

@font-face {
	font-family: binggrae;
	src: url("<%=request.getContextPath()%>/font/NotoSansCJKkr-Medium.otf");
}

h1 {
	margin-top: 100px;
	color: #565960;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px;
}

#wrap {
	width: 360px;
	/*border: 1px solid #ddd; */
	border: 0px;
	padding: 15px;
	margin-bottom: 10px;
	height: 430px;
	overflow: hidden;
}

a{
	text-decoration: none;
}

.btn {
	border-bottom: 1px  solid lightsalmon ;
	font-style: italic; 
	font-size: 20px;
	display: block;
	padding : 2px 2px; 
	height: 80px;
	width: 170px;
	padding: 2px 2px;
	cursor: pointer;
	margin-top: 20px;
	
}

.btn:hover {
	border: 1px  solid lightsalmon ;
	font-size: 22px;
	display: block;
	background-color: lightsalmon;
	padding : 2px 2px; 
	height: 80px;
	width: 170px;
	padding: 2px 2px;
	cursor: pointer;
}
</style>

</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>등록을 완료했습니다!</h1>
		
		<div id="wrap">
			
		<a href="<%=request.getContextPath()%>/index.jsp">
		<input class="btn" type="button" value="홈으로 가기"></a>
					
		</div>
	</div>
<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>