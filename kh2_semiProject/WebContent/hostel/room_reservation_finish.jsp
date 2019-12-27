<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
   	<meta charset="UTF-8">
    <title>Document</title>
<style>
* {
	box-sizing: border-box;
	}
@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
.backBody{
	height: 800px;
	padding-top:40px;
	background-image: url("../image/pay2.jpg"); background-position:center; background-repeat: no-repeat;
	}
.body {background-color:#efefef; color:#333; font-size:0.8em;}
.footer{bottom: 0px; position: absolute; width: 100%;}

#complete{
	font-size: xx-large;
	text-align: center;
	margin-top: 150px;
}
#money{
	font-size: x-large;
	background-color: black;
	color: #efefef;
}
#detail{
	font-size: medium;
	color: red;
}
 	
</style>
</head>

<body class="backBody">
<div>
	<jsp:include page="/template/nav.jsp"></jsp:include>
</div>
    <div id="complete">
    	
        <h2>예약이 완료되었습니다.</h2>
 			<h3 id="detail">
 				예약 후 투숙 3일 전까지 취소 위약금 없이 객실 예약취소가 가능하며,<br> 
				당일 취소 시 100% 취소 위약금이 발생됩니다.
			</h3>

        <a href="../mypage/order/list.jsp">
            <button id="money">나의 결제 확인하기</button>
        </a>
	</div>

</body>
<div class="footer">
	<jsp:include page="/template/footer.jsp"></jsp:include>
</div>
</html>