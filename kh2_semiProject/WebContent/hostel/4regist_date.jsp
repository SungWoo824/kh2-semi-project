<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
		int room_price = Integer.parseInt(request.getParameter("room_price"));
		int room_standard_people = Integer.parseInt(request.getParameter("room_standard_people"));
		int room_max_people = Integer.parseInt(request.getParameter("room_max_people"));
		int room_bed = Integer.parseInt(request.getParameter("room_bed"));
		int room_bath = Integer.parseInt(request.getParameter("room_bath"));
		String room_spa = request.getParameter("room_spa");
		String room_cook = request.getParameter("room_cook");
		String room_parking = request.getParameter("room_parking");
		String room_pet = request.getParameter("room_pet");
		String room_basic = request.getParameter("room_basic");
		String room_tv = request.getParameter("room_tv");
		String room_dry = request.getParameter("room_dry");
		String room_cool = request.getParameter("room_cool");
		String room_hot = request.getParameter("room_hot");
		String room_breakfast = request.getParameter("room_breakfast");
		String room_name = request.getParameter("room_name");
		String room_content = request.getParameter("room_content");
		if(room_spa == null){
			room_spa="x";
		}
		if(room_cook == null){
			room_cook="X";
		}
		if(room_parking == null){
			room_parking="X";
		}
		if(room_pet == null){
			room_pet="X";
		}
		if(room_basic == null){
			room_basic="X";
		}
		if(room_tv == null){
			room_tv="X";
		}
		if(room_dry == null){
			room_dry="X";
		}
		if(room_cool == null){
			room_cool="X";
		}
		if(room_hot == null){
			room_hot="X";
		}
		if(room_breakfast == null){
			room_breakfast="X";
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>묵고 더블로가 숙소 등록</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="datePicker.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="datePicker.js"></script>

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
	height: 800px;
	padding-top: 40px;
	background-image: url("../image/login5.jpg");
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
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px
}

#wrap {
	width: 650px;
	text-align: center;
/*  	background-color: white;  */
	padding: 15px;
	margin-bottom: 10px;
	height: 200px;
	overflow: hidden;
	font-size: 20px;
}
.sdate,.fdate{
	border-bottom: 1px solid #565960;
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px; 
	width: 250px;
	height: 35px;
	font-style: italic;
	color: #565960;
}
.fdate{
	display: inline-block;
}
a {
	text-decoration: none;
	color: #333;
}

.btn {
	border: 0;
	font-size: 18px;
	display: block;
	margin: 35px auto;
	padding: 15px 20px;
	background-color: lightsalmon;
}

.btn:hover {
	border-bottom: 2px solid lightsalmon;
	background-color: white;
	color: lightsalmon;
	cursor: pointer;
}
</style>
<script>
	function loadPicker() {
		var options = {
			//날짜가 입력될 첫 번째 칸 설정
			field : document.querySelector(".sdate"),

			//날짜가 입력될 두 번째 칸 설정
			secondField : document.querySelector(".fdate"),

			//표시될 월의 개수를 설정
			numberOfMonths : 2,

			//날짜 선택이 아닌 범위 선택으로 설정
			singleDate : false,

			//최초 선택일 이후로만 종료일을 선택하도록 설정
			selectForward : true,

			//날짜 구분자 설정
			seperator : '-',

			//문서 내에 표시되도록 설정
			// inline:true,

			//선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
			minDate : moment(new Date()).add(1, 'days'),//내일부터 선택 가능
			// minDate:new Date(),//오늘부터 선택가능

			//날짜 형식 설정
			format : 'YYYY-MM-DD',
		};
		var picker = new Lightpick(options);
	}
</script>
</head>
<body onload="loadPicker();">
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>4단계 : 호스팅 기간을 등록하세요!</h1>
			<form action="room_info_regist.do" method="post">
		<div id="wrap">
				        <input type="hidden" name="room_price" value="<%=room_price %>">
				        <input type="hidden" name="room_standard_people" value="<%=room_standard_people %>">
				        <input type="hidden" name="room_max_people" value="<%=room_max_people %>">
				        <input type="hidden" name="room_bed" value="<%=room_bed %>">
				        <input type="hidden" name="room_bath" value="<%=room_bath %>">
				        <input type="hidden" name="room_spa" value="<%=room_spa %>">
				        <input type="hidden" name="room_cook" value="<%=room_cook %>">
				        <input type="hidden" name="room_parking" value="<%=room_parking %>">
				        <input type="hidden" name="room_pet" value="<%=room_pet %>">
				        <input type="hidden" name="room_basic" value="<%=room_basic %>">
				        <input type="hidden" name="room_tv" value="<%=room_tv %>">
				        <input type="hidden" name="room_dry" value="<%=room_dry %>">
				        <input type="hidden" name="room_cool" value="<%=room_cool %>">
				        <input type="hidden" name="room_hot" value="<%=room_hot %>">
				        <input type="hidden" name="room_breakfast" value="<%=room_breakfast %>">
				        <input type="hidden" name="room_name" value="<%=room_name %>">
				        <input type="hidden" name="room_content" value="<%=room_content %>">
				<p>호스팅 시작 날짜와 종료 날짜를 정해주세요</p>
				<input type="text" class="sdate" name="start_hosting" placeholder="시작할 날짜">
				<input type="text" class="fdate" name="finish_hosting" placeholder="종료할 날짜">
		</div>
				<input class="btn" type="submit" value="등록하기">
			</form>
	</div>
	
	
</body>
</html>