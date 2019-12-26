<%@page import="beans.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int room_no = Integer.parseInt(request.getParameter("room_no"));
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String reservation_start_date = request.getParameter("reservation_start_date");
	String reservation_finish_date = request.getParameter("reservation_finish_date");
	int customer_count = Integer.parseInt(request.getParameter("people"));
	int room_price = Integer.parseInt(request.getParameter("room_price"));
	
	RoomDao roomDao = new RoomDao();
	String room_name = roomDao.roomname(room_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	호텔번호<%=room_no%>
	룸가격<%=room_price %>
	방이름<%=room_name %>
	숙박인원<%=customer_count%>
	체크인 <%=reservation_start_date%>
	체크아웃 <%=reservation_finish_date%>
	
	<form action="room_reservation.do" method="post">
		<input type="hidden" name="room_no" value="<%=room_no%>">
		<input type="hidden" name="customer_no" value="<%=%>">
		<input type="hidden" name="reservation_start_date" value="<%=reservation_start_date%>">
		<input type="hidden" name="reservation_finish_date" value="<%=reservation_finish_date%>">
		<input type="hidden" name="hostel_no" value="<%=hostel_no%>">
		<input type="hidden" name="customer_count" value="<%=customer_count%>">
		
				요청사항
		<input type="text" name="customer_request">
			<textarea></textarea>
		<input type="submit" value="예약하기">
	</form>

</div>
</body>
</html>