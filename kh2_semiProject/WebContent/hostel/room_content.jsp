<%@page import="beans.RoomDto"%>
<%@page import="beans.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int room_no = Integer.parseInt(request.getParameter("room_no"));
	RoomDao dao = new RoomDao();
  RoomDto Rdto = dao.roomInfomation1(room_no);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		룸번호<%=Rdto.getRoom_no() %><br>
		호텔번호<%=Rdto.getHostel_no() %><br>
		룸가격<%=Rdto.getRoom_price() %><br>
		기본인원<%=Rdto.getRoom_standard_people() %><br>
		최대인원<%=Rdto.getRoom_max_people() %><br>
		침대<%=Rdto.getRoom_bed() %><br>
		화장실<%=Rdto.getRoom_bath() %><br>
		스파<%=Rdto.getRoom_spa() %><br>
		요리<%=Rdto.getRoom_cook() %><br>
		방설명<%=Rdto.getRoom_content() %><br>
		주차<%=Rdto.getRoom_parking() %><br>
		펫<%=Rdto.getRoom_pet() %><br>
		아침식사<%=Rdto.getRoom_breakfast() %><br>
		룸베이직<%=Rdto.getRoom_basic() %><br>
		티비<%=Rdto.getRoom_tv() %><br>
		헤어드라이기<%=Rdto.getRoom_dry() %><br>
		에어컨<%=Rdto.getRoom_cool() %><br>
		난방<%=Rdto.getRoom_hot() %><br>
		방이름<%=Rdto.getRoom_name() %><br><br>
</body>
</html>