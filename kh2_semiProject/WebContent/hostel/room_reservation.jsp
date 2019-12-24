<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	호텔번호
	룸가격
	방이름


	<form action="room_reservation.do" method="post">
		<input type="hidden" name="room_no" value="">
		<input type="hidden" name="customer_no" value="">
		<input type="hidden" name="reservation_start_date" value="">
		<input type="hidden" name="reservation_finish_date" value="">
		<input type="hidden" name="hostel_no" value="">
			
		숙박인원
		<select>
		<%for(int i=0 ; i<4; i++){ %><%--4는 최대 인원 파라메터 값으로 교체 --%>
			<option value=<%=i+1%>><%=i+1%>명</option>
		<%} %>
		</select>
				요청사항
		<input type="text" name="customer_request">
			<textarea></textarea>
		<input type="submit" value="예약하기">
	</form>

</div>
</body>
</html>