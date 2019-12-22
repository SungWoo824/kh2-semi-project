<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@page import="beans.RoomDto"%>
<%@page import="beans.RoomDao"%>
<%@page import="beans.InterestDao"%>
<%@page import="beans.InterestDto"%>
<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%
	//회원 정보를 불러오는 코드
	//1. session에서 id에 들어있는 데이터를 꺼낸다
	//2. id를 주고 dao를 이용하여 회원정보(MemberDto)를 꺼낸다
	//3. 원하는 위치에 출력한다.
	
	String id = (String)session.getAttribute("id");
     
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(id);
	
	int member_no=mdto.getNo();
	InterestDao idao = new InterestDao();
 InterestDto idto= idao.interestinfo2(member_no);

 int room_no=idto.getRoom_no();
 RoomDao rdao = new RoomDao();
RoomDto rdto= rdao.roomInfomation(room_no);

int hostel_no=   rdto.getHostel_no();
HostelDao hdao =new  HostelDao();
HostelDto hdto=   hdao.hostelinfomation(hostel_no);
 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
</head>
<body>




    
    
    <div class="master-title w-100"><h2><%=mdto.getName() %>님의 위시리스트</h2></div>
    <table class="w-100 hostel-table">
		<thead>
			<tr>
				<th></th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>가격</th>
				<th></th>
				<th></th>
				
			</tr>
		</thead>
		<tbody>
			
			<tr>
			
				<th><input type="checkbox"></th>
				<th>이미나올곳</th>
				<th> <%=hdto.getHostel_name() %>//<%=rdto.getRoom_name() %></th>
				<th><%=rdto.getRoom_price() %></th>
				<th><input type="submit" value="주문하기"></th>
				<th><input type="submit" value="삭제"></th>
				
				
				
			</tr>
			
		</tbody>
	</table>


    <input type="submit" value="주문하기">
    <input type="submit" value="삭제">
</body>
</html>