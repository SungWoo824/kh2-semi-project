<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.ReservationDao"%>
<%@page import="beans.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int room_no = Integer.parseInt(request.getParameter("room_no"));
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String reservation_start_date = request.getParameter("reservation_start_date");
	String reservation_finish_date = request.getParameter("reservation_finish_date");
	int customer_count = Integer.parseInt(request.getParameter("customer_count"));
	int room_price = Integer.parseInt(request.getParameter("room_price"));
	
	ReservationDao reservationDao = new ReservationDao();
	int until = reservationDao.until(reservation_start_date, reservation_finish_date);
	RoomDao roomDao = new RoomDao();
	String room_name = roomDao.roomname(room_no);
	
	MemberDao memberDao = new MemberDao();
	int customer_no = memberDao.getMemberNo((String)request.getSession().getAttribute("id"));
	MemberDto memberDto = memberDao.memberInfomation(customer_no);
	
	
	int total_price = room_price*until;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
*{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #paybox, input,label {margin:0 auto; padding:0; border:0; display: block; }
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}
.body{}
.backBody{
	height: 1000px;
	padding-top:40px;
	background-image: url("../image/pay.jpg"); background-position:center; background-repeat: no-repeat;
	/* font-size: 1rem; */  
}

@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
h1 {
	margin-top: 100px;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px
}

h2 {
	padding-bottom: 20px;
	text-align: center;
	font-size: 13px;
	font-weight: normal;
	line-height: 120%;
	letter-spacing: -1px;
	color: #666;
}

h3 {
	text-align: center;
	padding: 10px 0 10px 0;
	margin-bottom: 10px;
	font-size: 14px;
	letter-spacing: -1px;
	border-bottom: 1px solid #ccc;
}
#wrap-left {
	display: inline-block;
	width: 360px;
	border: 1px solid #ddd;
	background-color: rgba(255,255,255,0.8);
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden;
	margin-left: 600px;
	margin-top: 250px;
	font-size: 1rem;
}
#wrap-right {
	display: inline-block;
	width: 360px;
	border: 1px solid #ddd;
	background-color: rgba(255,255,255,0.3);
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden;
	margin-top: 250px;

#paybox{
	width: 300px;
	padding: 5px;
	margin:50p;
}
input#uroom_no, input#ucustomer_no, input#ureservation_start_date, input#ureservation_finish_date, input#uhostel_no,
 input#ucustomer_count, input#uuntil, input#utotal_price{
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #d9d9d9;
	text-align: center;
	
}

label#fUroom_no, label#fUcustomer_no, label#fUreservation_start_date, label#fUreservation_finish_date, label#fUhostel_no,
label#fUcustomer_count, label#fUuuntil, label#fUtotal_price {
	width: 60px;
	margin: 0;
	padding-top: 5px;
	display: inline-block;
	vertical-align: top;
	font-family: binggrae;
	font-size: 1.5rem;
	
}

.bt {
	display: inline-block;
/* 	border: 1px solid #ccc */
	background-color: black;
}

.bt1 {
	display: inline-block;
	width: 140px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

.bt2 {
	display: inline-block;
	width: 285px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

#paybox hr {
	color: #ddd;
	height: 1px;
	background-color: #ddd
}

#login_bt {
	width: 285px;
	height: 35px;
	background-color: #000;
	font-weight: bold;
	color: #fff;
	font-family: binggrae;
}

.block {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 0;
}

/* 
a {
	text-decoration: none;
	color: #333;
} */
</style>
</head>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
<div class="backBody">
	<div id="wrap-left">
<%-- 	호텔번호<%=room_no%>
	룸가격 <%=room_price %> x <%=until %>
	방이름<%=room_name %>
	숙박인원<%=customer_count%>
	체크인 <%=reservation_start_date%>
	체크아웃 <%=reservation_finish_date%> --%>
		<h1>Member Reservation</h1>
			<h2>예약정보입니다. <br>
				예약 내역 확인부탁드립니다.
			</h2>
	<form action="room_reservation_kakao.do" method="post">
		<div id="paybox">
			<label for="uroom_no" id="fUroom_no">방번호: &nbsp; <%=room_no%>번</label>
			<input id="uroom_no" type="hidden" name="room_no" value="<%=room_no%>">
			
			
			
			<label for="ucustomer_no" id="fUcustomer_no">고객이름: &nbsp; <%=memberDto.getName()%></label>
			<input id="ucustomer_no" type="hidden" name="customer_no" value="<%=customer_no%>">
			<div class="block"></div>
			
			<label for="ureservation_start_date" id="fUreservation_start_date">체크인: &nbsp; <%=reservation_start_date %></label>
			<input id="ureservation_start_date" type="hidden" name="reservation_start_date" value="<%=reservation_start_date%>">
			<div class="block"></div>
			
			<label for="ureservation_finish_date" id="fUreservation_finish_date">체크아웃: &nbsp; <%=reservation_finish_date %></label>
			<input id="ureservation_finish_date" type="hidden" name="reservation_finish_date" value="<%=reservation_finish_date%>">
			<div class="block"></div>
			
			<label for="uhostel_no" id="fUhostel_no">호텔번호: &nbsp; <%=hostel_no %>번</label>
			<input id="uhostel_no" type="hidden" name="hostel_no" value="<%=hostel_no%>">
			<div class="block"></div>
			
			<label for="ucustomer_count" id="fUcustomer_count">인원수: &nbsp; <%=customer_count %>명</label>
			<input id="ucustomer_count" type="hidden" name="customer_count" value="<%=customer_count%>">
			<div class="block"></div>
			
			<label for="uuntil" id="fUuntil">숙박기간: &nbsp; <%=until%>일</label>
			<input type="hidden" name="until" value="<%=until%>">
			<div class="block"></div>
			
			<label id="uuntil" for="utotal_price" id="fUtotal_price">결제금액: &nbsp; <%=total_price%>원</label>
			<input type="hidden" name="total_price" value="<%=total_price%>">
			<div class="block"></div>
		</div>
	</form>
</div>
		<div id="wrap-right">
			<h1>Requirements</h1>
				<h2>요구사항이 있으시면 작성부탁드립니다.</h2>	
			<input type="text" name="customer_request">
				<textarea rows="13.5" cols="45" style="resize: none;"></textarea>
		</div>
			<span class="bt" style="text-align: center;">

				<input id="login_bt" type="submit" value="예약하기" 
				style="font-size: 1.5rem; background-color: #c0c0c0; width: 200px;">
			</span>	
</div>
	
	
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>	
</body>
</html>