<%@page import="beans.ReviewDto"%>
<%@page import="beans.ReviewDao"%>
<%@page import="beans.HostelDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.HostelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	HostelDao dao = new HostelDao();
	List<HostelDto>list = dao.hostelList(1, 1000);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(HostelDto dto : list){ %>&clubs;
	<a href="hostel_content.jsp?hostel_no=<%=dto.getHostel_no()%>" >호텔넘버:<%=dto.getHostel_no() %>&clubs;</a>
	오너넘버<%=dto.getOwner_no() %>&clubs;
	지역넘버<%=dto.getRegion_no() %>&clubs;
	지역이름<%=dto.getRegion_name() %>&clubs;
	호텔이름<%=dto.getHostel_name() %>&clubs;
	상세주소<%=dto.getHostel_detail_addr() %>&clubs;
	위도<%=dto.getHostel_latitude() %>&clubs;
	경도<%=dto.getHostel_longitude() %>&clubs;
	호텔종류<%=dto.getHostel_kind_name() %>&clubs;
	<br><br>
<%} %>
</body>
</html>