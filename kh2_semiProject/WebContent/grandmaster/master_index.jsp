<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
</head>
<body>
<div class="w-80">
	<div><h2>로고</h2></div>
	<div><h2>그림</h2></div>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="master">
		<div class="master-list">
			<div>
				<h4>오늘 가입한 사용자</h4>
				<h3>0 명</h3>
			</div>
		</div>
		<div class="master-list">
			<div>
				<h4>오늘 가입한 판매자</h4>
				<h3>0 명</h3>
			</div>			
		</div>
		<div class="master-list">
			<div>
				<h4>오늘 등록된 숙소</h4>
				<h3>0 개</h3>
			</div>			
		</div>
		<div class="master-list">
			<div>
				<h4>오늘 방문자</h4>
				<h3>0 명</h3>
			</div>
		</div>
	</div>
</div>
</body>
</html>