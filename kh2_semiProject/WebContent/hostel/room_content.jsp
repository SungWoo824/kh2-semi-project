<%@page import="beans.RoomDto"%>
<%@page import="beans.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int room_no = Integer.parseInt(request.getParameter("room_no"));
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String check_in = request.getParameter("check_in");
	String check_out = request.getParameter("check_out");
	int customer_count = Integer.parseInt(request.getParameter("people"));
	int room_price = Integer.parseInt(request.getParameter("room_price"));
	
	RoomDao dao = new RoomDao();
  	RoomDto Rdto = dao.roomInfomation1(room_no);
 
  
%>
<html>
<head>
<meta charset="UTF-8">
<title>방 상세정보</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/room-content.css">
</head>
<body>
<div>
<jsp:include page="../template/nav.jsp"></jsp:include>
</div>
<div class="backimg w-90" align="center">
	<img src="<%=request.getContextPath() %>/image/back102.png" />
</div>
<div class="w-80">
	<div class="row" ></div>
	<br>
<div class="float-wrap">
	<div class="room__image float-item">
		<img src="<%=request.getContextPath() %>/image/item3__list-1.jpg" />
	</div>
<div class="float-item">
	<div class="float-item2">
	<div class="row-small"></div>
		<table class="room-table">
			<tbody>
				<tr>
					<th>룸번호</th>
					<td><%=Rdto.getRoom_no() %></td>
				</tr>
				<tr>
					<th>룸가격</th>
					<td><%=Rdto.getRoom_price() %></td>
				</tr>
				<tr>
					<th>최대인원</th>
					<td><%=Rdto.getRoom_max_people() %></td>
				</tr>								
				<tr>
					<th>화장실</th>
					<td><%=Rdto.getRoom_bath() %></td>
				</tr>
				<tr>
					<th>요리</th>
					<td><%=Rdto.getRoom_cook() %></td>
				</tr>
				<tr>
					<th>주차</th>
					<td><%=Rdto.getRoom_parking() %></td>
				</tr>	
				<tr>
					<th>&emsp;아침식사&emsp;</th>
					<td><%=Rdto.getRoom_breakfast() %></td>
				</tr>
				<tr>
					<th>티비</th>
					<td><%=Rdto.getRoom_tv() %></td>
				</tr>
				<tr>
					<th>에어컨</th>
					<td><%=Rdto.getRoom_cool() %></td>
				</tr>
				<tr>
					<th>방이름</th>
					<td><%=Rdto.getRoom_name() %></td>
				</tr>							
			</tbody>
		</table>
	</div>
	
	<div class="float-item2">
	<div class="row-small"></div>
		<table class="room-table">
			<tbody>
				<tr>
					<th>호텔번호</th>
					<td><%=Rdto.getHostel_no() %></td>
				</tr>
				<tr>
					<th>기본인원</th>
					<td><%=Rdto.getRoom_standard_people() %></td>
				</tr>								
				<tr>
					<th>침대</th>
					<td><%=Rdto.getRoom_bed() %></td>
				</tr>
				<tr>
					<th>스파</th>
					<td><%=Rdto.getRoom_spa() %></td>
				</tr>
				<tr>
					<th>방설명</th>
					<td><%=Rdto.getRoom_content() %></td>
				</tr>	
				<tr>
					<th>펫</th>
					<td><%=Rdto.getRoom_pet() %></td>
				</tr>
				<tr>
					<th>룸베이직</th>
					<td><%=Rdto.getRoom_basic() %></td>
				</tr>
				<tr>
					<th>헤어드라이기</th>
					<td><%=Rdto.getRoom_dry() %></td>
				</tr>
				<tr>
					<th>난방</th>
					<td><%=Rdto.getRoom_hot() %></td>
				</tr>				
			</tbody>
		</table>
	</div>
	<div class="ask-button">
		<a href="<%=request.getContextPath() %>/qa/write.jsp?room_no=<%=Rdto.getRoom_no() %>">문의하기</a>
	</div>
</div>
</div>
	<div>
		<form action = "room_reservation.jsp" method="post">
			<input type="hidden" name="room_no" value="<%=room_no %>">
			<input type="hidden" name="customer_count" value="<%=customer_count %>">
			<input type="hidden" name="reservation_start_date" value="<%=check_in %>">
			<input type="hidden" name="reservation_finish_date" value="<%=check_out %>">
			<input type="hidden" name="hostel_no" value="<%=hostel_no %>">
			<input type="hidden" name="room_price" value="<%=room_price %>">
			<input type="submit" value="예약하기">
		</form>
	</div>
</div>
<div class="under">
<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>