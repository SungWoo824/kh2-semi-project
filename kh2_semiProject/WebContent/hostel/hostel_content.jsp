<%@page import="java.util.ArrayList"%>
<%@page import="beans.RoomDao"%>
<%@page import="beans.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.ReviewDao"%>
<%@page import="beans.ReviewDto"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String check_in = request.getParameter("check_in");
	String check_out = request.getParameter("check_out");
	int people=0;
	if(request.getParameter("people")!=null){
		people = Integer.parseInt(request.getParameter("people"));
	}
	boolean isSearch = check_in!=null && check_out!=null && people!=0;
	HostelDao dao = new HostelDao();
	HostelDto dto = dao.hostelinfomation(hostel_no);
	ReviewDao rdao = new ReviewDao();
	List<ReviewDto>list = rdao.hostel_review_list(hostel_no);
	RoomDao Rdao = new RoomDao();
	List<RoomDto>Rlist = new ArrayList<>();
	if(isSearch){
		Rlist = Rdao.hostel_room_list_search(check_in, check_out, people, hostel_no);
	}else{
		Rlist = Rdao.hostel_room_list(hostel_no);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	호텔넘버:<%=dto.getHostel_no() %><br>
	오너넘버<%=dto.getOwner_no() %><br>
	지역넘버<%=dto.getRegion_no() %><br>
	지역이름<%=dto.getRegion_name() %><br>
	호텔이름<%=dto.getHostel_name() %><br>
	상세주소<%=dto.getHostel_detail_addr() %><br>
	위도<%=dto.getHostel_latitude() %><br>
	경도<%=dto.getHostel_longitude() %><br>
	호텔종류<%=dto.getHostel_kind_name() %><br><br><br>
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ방자리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br><br>
	<%for(RoomDto Rdto : Rlist){ %>
		
	<a href="room_content.jsp?room_no=<%=Rdto.getRoom_no() %>">	룸번호<%=Rdto.getRoom_no() %></a>
		호텔번호<%=Rdto.getHostel_no() %>
		룸가격<%=Rdto.getRoom_price() %>
		기본인원<%=Rdto.getRoom_standard_people() %>
		최대인원<%=Rdto.getRoom_max_people() %>
		침대<%=Rdto.getRoom_bed() %>
		화장실<%=Rdto.getRoom_bath() %>
		스파<%=Rdto.getRoom_spa() %>
		요리<%=Rdto.getRoom_cook() %>
		방설명<%=Rdto.getRoom_content() %>
		주차<%=Rdto.getRoom_parking() %>
		펫<%=Rdto.getRoom_pet() %>
		아침식사<%=Rdto.getRoom_breakfast() %>
		룸베이직<%=Rdto.getRoom_basic() %>
		티비<%=Rdto.getRoom_tv() %>
		헤어드라이기<%=Rdto.getRoom_dry() %>
		에어컨<%=Rdto.getRoom_cool() %>
		난방<%=Rdto.getRoom_hot() %>
		방이름<%=Rdto.getRoom_name() %><br><br>
	<%} %>
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ리뷰자리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br><br>
	<%for(ReviewDto rdto : list){ %>
	리뷰넘버<%=rdto.getReview_no() %>
	예약넘버<%=rdto.getReservation_no() %>
	고객넘버<%=rdto.getCustomer_no() %>
	호텔넘버<%=rdto.getHostel_no() %>
	리뷰내용<%=rdto.getReview_content() %>
	별점<%=rdto.getStar_point() %>
	리뷰시간<%=rdto.getReview_date() %>
	<br><br>
	<%} %>
</body>
</html>