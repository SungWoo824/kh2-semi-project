<%@page import="java.util.*"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
	HostelDao hdao = new HostelDao();
	List<HostelDto> list = hdao.hostelList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>헤더</div>
	<div>매뉴</div>
	<div><br></div>
	<div><br></div>
	<div><br></div>
	<div>호텔 목록 보기</div>
	<div align="center">
	<table>
		<thead>
			<tr>
				<th>숙소번호</th>
				<th>숙소등록자 번호</th>
				<th>숙소 종류</th>
				<th>지역 번호</th>
				<th>숙소이름</th>
				<th>숙소번호</th>
				<th>숙소상세주소</th>
				<th>숙소설명</th>
				
			</tr>
		</thead>
		<tbody>
			<%for(HostelDto hdto : list){ %>
			<tr>
			
				<th><%=hdto.getHostel_no() %></th>
				<th><%=hdto.getOwner_no() %></th>
				<th><%=hdto.getRegion_no() %></th>
				<th><%=hdto.getHostel_kind_name() %></th>
				<th><%=hdto.getHostel_name() %></th>
				<th><%=hdto.getHostel_phone() %></th>
				
				<th><%=hdto.getHostel_detail_addr() %></th>
				<th><%=hdto.getHostel_content() %></th>
				<th><a method="post" href="<%=context%>/grandmaster/master_hostel_delete.do?hostel_no=<%=hdto.getHostel_no()%>">
					숙소 삭제하기</a></th>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div>
</body>
</html>