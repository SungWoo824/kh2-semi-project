<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int hostel_no = (int)session.getAttribute("hostel_no");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>방 정보를 등록해봅시다!</title>

<style>
* {
	box-sizing: border-box;
}

.a {
	width: 70%;
	/* 내용물 가운데 정렬 */
	text-align: center;
	/* div 자신을 가운데 정렬 */
	margin-left: auto;
	margin-right: auto;
}

.a>input[type=number] {
	font-size: 25px;
	margin: 30px;
	padding: 10px;
}

.a>input[type=text] {
	font-size: 25px;
	width: 40%;
	height: 10rem;
	padding: 10px;
}

p {
	font-size: 30px;
	margin: 10px;
	padding: 20px;
}

.convenience>.check {
	display: block;
	margin: 10px auto;
}

.convenience {
	text-align: center;
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
	background-color: white;
	color: lightsalmon;
	cursor: pointer;
}
</style>
</head>

<body>

	<form action="room_info_regist.do" method="get">
		<div class="a">
	
			<h1 style="color: lightsalmon">판매자 등록 페이지(2단계 방 정보)</h1>

			<input type="hidden" name="hostel_no" value="<%=hostel_no%>" >

			<p>방의 가격을 정해주세요.</p>
			<input type="number" name="room_price" placeholder="가격" required>

			<p>수용 가능한 인원은 몇 명인가요?</p>
			<input type="number" name="room_standard_people" placeholder="인원">

			<p style="font-size: 20px">최대 몇 명이 가능한가요?</p>
			<input type="number" name="room_max_people" placeholder="최대 인원">

			<p>침대는 몇 개가 있나요?</p>
			<input type="number" name="room_bed" placeholder="침대 수">

			<p>화장실은 몇 개가 있나요?</p>
			<input type="number" name="room_bath" placeholder="화장실 수">


			<p>어떤 편의시설이 있나요?</p>

			<div class="convenience">

				<label>욕조<input type="checkbox" value="o" name="room_spa"></label>
				<br> <br> 
				<label>취사 가능?<input type="checkbox" value="o" name="room_cook"></label>
				<br> <br> 
				<label>주차장<input type="checkbox" value="o" name="room_parking"></label>
				<br> <br> 
				<label>동물입실<input type="checkbox" value="o" name="room_pet"></label>
				<br> <br> 
				<label>필수 물품<input type="checkbox" value="o" name="room_basic"></label>
				<br> <br> 
				<label>TV<input type="checkbox" value="o" name="room_tv"></label>
				<br> <br> 
				<label>헤어 드라이어기<input type="checkbox" value="o" name="room_dry"></label>
				<br> <br> 
				<label>에어컨<input type="checkbox" value="o" name="room_cool"></label>
				<br> <br> 
				<label>난방<input type="checkbox" value="o" name="room_hot"></label>
				<br> <br>
				<label>조식제공<input type="checkbox" value="o" name="room_breakfast"></label>

			</div>
			
			<p>방 호수(이름)을 적어주세요.</p>

			<input type="text" name="room_name" placeholder="방 호수(이름)">

			<p>방을 소개해주세요!</p>

			<input type="text" name="room_content" placeholder="방 설명"> 
			
			<input class="btn" type="submit" value="다음">

		</div>
		
	</form>
	
</body>

</html>