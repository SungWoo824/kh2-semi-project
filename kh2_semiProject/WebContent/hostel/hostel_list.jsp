<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.RoomDto"%>
<%@page import="beans.HostelDto"%>
<%@page import="beans.HostelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	HostelDao hdao = new HostelDao();
	HostelDto hdto = new HostelDto();
	List<HostelDto> hlist = new ArrayList<>();

	String start_day = request.getParameter("check-in");
	String finish_day = request.getParameter("check-out");
	String city_name = request.getParameter("location");
	int adult = 1;
	int child = 0;
	int people = 0;

	boolean isSearch = start_day != null && finish_day != null && city_name != null;
	if (isSearch) {
		adult = Integer.parseInt(request.getParameter("adult"));
		child = Integer.parseInt(request.getParameter("child"));
		people = adult + child;
		hlist= hdao.userSearchHostel(start_day, finish_day, city_name, people);
	}
	// 	System.out.println("hlist : " + hlist.size());
	// 	System.out.println("start : " + start_day);
	// 	System.out.println("start : " + finish_day);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/hostel-list.css" />
<link rel="stylesheet" href="../css/nav-menu.css" />
<link rel="stylesheet" href="../css/footer.css"/>
<script src="../js/custom_select.js"></script>
<style>
.top-bar__menu{
	margin-top: 18px;
}
</style>
</head>
<body>
	<jsp:include page="../template/nav.jsp"></jsp:include>
	<div class="body">
	<form
		action="hostel_list.jsp?"
		method="POST">
		<section class="search-section">
			<div class="search-container">
				<div class="search__inputbox search__location">
					<h6>목적지</h6>
					<input class="search__input" type="text" name="location" required="required"/>
				</div>
				<div class="search__inputbox search__check-in">
					<h6>Check-In</h6>
					<input class="search__input" type="date" name="check-in" required="required"/>
				</div>
				<div class="search__inputbox search__check-out">
					<h6>Check-Out</h6>
					<input class="search__input" type="date" name="check-out" required="required"/>
				</div>
				<div class="search__inputbox search__adult">
					<h6>성인</h6>
					<select class="search__input select-icon custom-select"
						name="adult" required="required">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						<option value="9">9명</option>
						<option value="10">10명</option>
						<option value="11">11명</option>
						<option value="12">12명</option>
						<option value="13">13명</option>
						<option value="14">14명</option>
						<option value="15">15명</option>
						<option value="16">16명</option>
					</select>
				</div>
				<div class="search__inputbox search__child">
					<h6>아동</h6>
					<select id="select" class="search__input select-icon custom-select"
						name="child" required="required">
						<option value="0">0명</option>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
					</select>
				</div>
				<input type="hidden" value="<%=child+adult %>" name="people">
				<div class="search__inputbox search__button">
					<input class="search__input " type="submit" value="검색" />
				</div>
			</div>
		</section>
	</form>
<!-- 	<div class="hotel-list-header"> -->
<%-- 		<span class="hotel-list-result"> <%=hlist.size()%>개의 검색 결과 --%>
<!-- 		</span> <select name="" id=""> -->
<!-- 			<option value="">가격순 위</option> -->
<!-- 			<option value="">가격순 아래</option> -->
<!-- 			<option value="">평점순 위</option> -->
<!-- 			<option value="">평점순 아래</option> -->
<!-- 		</select> -->
<!-- 	</div> -->


	<%
		if (hlist.size() > 0) {
	%>
	<%
		for (HostelDto dto : hlist) {
	%>
	<form method="POST" action="hostel_content.jsp?hostel_no=<%=dto.getHostel_no()%>&check-in=<%=start_day%>&check-out=<%=finish_day%>&people=<%=people%>">
	<section class="hostel">
		<div class="hostel-container">
			<div class="hostel__image">
				<img src="<%=request.getContextPath() %>/image/item3__list-1.jpg" />
			</div>
			<div class="hostel__content">
				<ul>
					<li class="hostel__title"><h3><%=dto.getHostel_name() %></h3></li>
					<li class="hostel__type"><h5><%=dto.getHostel_kind_name() %></h5></li>
					<li class="hostel__intro"><span><%=dto.getHostel_content() %></span></li>
					<li class="hostel__info">
						<ul class="hostel__info-list">
							<li class="room-info hostel__max-people"><span>최대인원
									0명 | </span></li>
							<li class="room-info hostel__bed"><span>침대 0개 | </span></li>
							<li class="room-info hostel__bathroom"><span>화장실 0개 |
							</span></li>
							<li class="room-info hostel__cook"><span>요리 O | </span></li>
							<li class="room-info hostel__spa"><span>사우나 O</span></li>
						</ul>
						<ul class="hostel__info-list">
							<li class="room-info hostel__parking"><span>주차장 O | </span>
							</li>
							<li class="room-info hostel__pet"><span>애완동물 O | </span></li>
							<li class="room-info hostel__wifi"><span>WIFI O | </span></li>
							<li class="room-info hostel__breakfast"><span>조식 O</span></li>
						</ul>
					</li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="hostel__price">
				<input value="상세 보기" class="submit" type="submit">
				<h3>1,000,000원</h3>
			</div>
		</div>
	</section>
	</form>
	<%
		}
	%>
	<%
		}
	%>
	<div class="border-bottom"></div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>