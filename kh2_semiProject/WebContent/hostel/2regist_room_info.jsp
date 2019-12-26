<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>방 정보를 등록해봅시다!</title>

<style>
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
	height: 1180px;
	padding-top: 40px;
	background-image: url("../image/pay.jpg");
	background-position: center;
	background-repeat: no-repeat;
}

@font-face {
	font-family: binggrae;
	src: url("../font/NotoSansCJKkr-Medium.otf");
}

h1 {
	margin-top: 100px;
	margin-bottom: 50px;
	margin-right: 150px;
	text-align: right;
	font-size: 40px;
	letter-spacing: -1px
}

#wrap-left {
	display: inline-block;
	width: 440px;
	padding: 15px;
	margin-bottom: 20px;
	height: 760px;
	overflow: hidden;
	margin-left: 450px;
	margin-top: 10px;
	padding-top: 0px;
	background-color: #DDDDDB;
 	border-top-left-radius: 10%; 
 	border-bottom-right-radius: 10%; 
/* 	border-radius: 10%; */
}

#wrap-right {
	display: inline-block;
	width: 450px;
	/* 	border: 1px solid #ddd;
/* 	background-color: rgba(255,255,255,0.3); */
	text-align: right;
	padding: 10px;
	margin-bottom: 20px;
	height: 760px;
	overflow: hidden;
	margin-left: 50px;
	margin-right: 100px;
	margin-top: 10px;
	padding-top: 0px;
	border-left-width: 2px;
	background-color: #DDDDDB;
 	border-top-left-radius: 10%;
 	border-bottom-right-radius: 10%; 
/* 	border-radius: 10%; */
}
p{
	margin: 150px opx;
	font-size: 20px;
}
#hostelbox1 {
	width: 95%;
	height: 700px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
}
#hostelbox1 input[type=number],
#hostelbox1 input[type=text] {
	outline: #565960; 
	font-size: 1rem;
	border-bottom: 1px solid #565960 ;
	width: 400px;
	height: 3rem;
	padding: 10px;
	

}
#hostelbox2 {
	width: 95%;
	height: 700px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
;
}
#hostelbox2 input[type=text] {	
	outline: #565960; 
	font-size: 1rem;
	border-bottom: 1px solid #565960 ;
	width: 400px;
	height: 3rem;
	padding: 10px;
	
}
#hostelbox2 label{
	border-bottom: 1px solid #565960 ;
	font-size: 18px;
	width: 400px;
	height: 1rem;
	padding: 1px;
	cursor: pointer;
	
}
.block {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 0;
}

.btn {
	border: 1px;
	font-size: 20px;
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-right: 160px;
	padding: 6px 8px 10px 10px;;
	background-color: #565960;
	height: 40px;
	width: 80px;
}

.btn:hover {
	background-color: #EFEFEF;
	color: #565960;
	cursor: pointer;
}

</style>
</head>

<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>무엇을 적을까요?????????????</h1>
			<form action="4regist_date.jsp" method="get">
		<div id="wrap-left">
				<div id="hostelbox1">
				
				<p>  ▶ 방 호수(이름)을 적어주세요.</p>
				<input type="text" name="room_name" placeholder="방 호수(이름)">
				
				<p>  ▶ 방의 가격을 정해주세요.</p>
				<input type="number" name="room_price" placeholder="가격" required>

				<p>  ▶ 수용 가능한 인원은 몇 명인가요?</p>
				<input type="number" name="room_standard_people" placeholder="인원">

				<p>  ▶ 최대 몇 명이 가능한가요?</p>
				<input type="number" name="room_max_people" placeholder="최대 인원">

				<p>  ▶ 침대는 몇 개가 있나요?</p>
				<input type="number" name="room_bed" placeholder="침대 수">

				<p>  ▶ 화장실은 몇 개가 있나요?</p>
				<input type="number" name="room_bath" placeholder="화장실 수">

				</div>
			
		</div>

		<div id="wrap-right">
			
			
				<div id="hostelbox2">
				<p>어떤 편의시설이 있나요?  ◀  </p>
				<label>수영장  <input type="checkbox" value="o" name="room_spa"></label>
				<label>주차장  <input type="checkbox" value="o" name="room_parking"></label>
				<br>
				<label>기본 용품(비누,샴푸,수건 등)  <input type="checkbox" value="o" name="room_basic"></label>
				<br>
				<label>TV  <input type="checkbox" value="o" name="room_tv"></label>
				<label>헤어 드라이어기  <input type="checkbox" value="o"name="room_dry"></label>
				<br>
				<label>에어컨  <input type="checkbox" value="o" name="room_cool"></label>
				<label>난방  <input type="checkbox" value="o" name="room_hot"></label>
				<label>조식제공  <input type="checkbox" value="o" name="room_breakfast"></label>
				<br>
				<label>취사가 가능한가요?  <input type="checkbox" value="o" name="room_cook"></label>
				<br>
				<label>애완 동물과 동반 입실이 가능한가요?  <input type="checkbox" value="o" name="room_pet"></label>
				<br>

				<p>방을 소개해주세요!  ◀   </p>

<!-- 				<input type="text" name="room_content" placeholder="방 설명">				 -->
				<textarea rows="18" cols="48" name="room_content"></textarea>
				</div>
		</div>
				<input class="btn" type="submit" value="다음">
			</form>
	</div>
<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>

</html>