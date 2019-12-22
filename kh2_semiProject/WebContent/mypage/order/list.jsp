<%@page import="beans.RoomDao"%>
<%@page import="beans.HostelDto"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.ReservationDto"%>
<%@page import="beans.ReservationDao"%>
<%@page import="beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  
  //아이디로 주문 리스트 받기 
  
  	String id = (String)session.getAttribute("id");
     
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(id);
	
	int member_no=mdto.getNo();
  
  ReservationDao rdao = new ReservationDao();
  List<ReservationDto> list = rdao.list(member_no);
  
RoomDao roomdao = new RoomDao();
	HostelDao hosteldao = new HostelDao();

 
 %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>


</style>

</head>
<body>
    
  


	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>

	<div class="master-title w-100"><h2>나의 예약 내역</h2></div>
    <table class="w-100 hostel-table">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>이미지</th>
				<th>호텔이름</th>
				<th>방이름</th>
				<th>숙박기간</th>
				<th>인원수</th>
				<th>고객요구사항</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%for(ReservationDto rdto2 : list){ %>
			<tr>
			
				<th><%=rdto2.getReservation_no() %></th>
				<th>이미지</th>
				<th><%= hosteldao.hostelname(roomdao.hostelNumber(rdto2.getRoom_no()))%></th>
				<th><%=roomdao.roomname(rdto2.getRoom_no()) %></th>
				<th><%=rdto2.getReservation_start_date() %>~ 2019-12-25</th>
				<th><%=rdto2.getCustomer_count() %></th>
				
				<th><%=rdto2.getCustomer_request() %></th>
				<th><input type="button" value="리뷰쓰러가기"></th>
				
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>