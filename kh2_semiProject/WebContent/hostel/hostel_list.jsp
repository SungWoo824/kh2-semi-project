<%@page import="beans.RoomDao"%>
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
	RoomDao rdao = new RoomDao();
	List<HostelDto> hlist = new ArrayList<>();

	String start_day = request.getParameter("check_in");
	String finish_day = request.getParameter("check_out");
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
	String popular = request.getParameter("popular");
	boolean isPopular = popular!=null;
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
<link rel="stylesheet" type="text/css" href="datePicker.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="datePicker.js"></script>
<script>
	function loadPicker() {
		var options = {
			//날짜가 입력될 첫 번째 칸 설정
			field : document.querySelector(".sdate"),

			//날짜가 입력될 두 번째 칸 설정
			secondField : document.querySelector(".fdate"),

			//표시될 월의 개수를 설정
			numberOfMonths : 2,

			//날짜 선택이 아닌 범위 선택으로 설정
			singleDate : false,

			//최초 선택일 이후로만 종료일을 선택하도록 설정
			selectForward : true,

			//날짜 구분자 설정
			seperator : '-',

			//문서 내에 표시되도록 설정
			// inline:true,

			//선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
			minDate : moment(new Date()).add(1, 'days'),//내일부터 선택 가능
			// minDate:new Date(),//오늘부터 선택가능

			//날짜 형식 설정
			format : 'YYYY-MM-DD',
		};
		var picker = new Lightpick(options);
	}
</script>
</head>
<body onload="loadPicker();">
	<jsp:include page="../template/nav.jsp"></jsp:include>
	<div class="body">
	<form
		action="hostel_list.jsp?"
		method="POST">
		<section class="search-section">
			<div class="search-container">
				<div class="search__inputbox search__location">
					<h6>목적지</h6>
					<%if(isSearch){ %>
					<input class="search__input" type="text" name="location" value="<%=city_name %>" required="required" autocomplete="off"/>
					<%} else{%>
					<input class="search__input" type="text" name="location" required="required" autocomplete="off"/>
					<%} %>
					
				</div>
				<div class="search__inputbox search__check-in">
					<h6>Check-In</h6>
					<input class="search__input sdate" value="<%=start_day %>"
					 type="text" name="check_in" required="required" autocomplete="off"/>
				</div>
				<div class="search__inputbox search__check-out">
					<h6>Check-Out</h6>
					<input class="search__input fdate" value="<%=finish_day %>"
					 type="text" name="check_out" required="required" autocomplete="off"/>
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
					<input class="search__input" type="submit" value="검색" />
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
	<form method="POST" action="hostel_content.jsp?hostel_no=<%=dto.getHostel_no()%>&check_in=<%=start_day%>&check_out=<%=finish_day%>&people=<%=people%>">
	<section class="hostel">
		<div class="hostel-container">
			<div class="hostel__image">
				<img src="<%=request.getContextPath()%>/hostel/hostel_download.do?hostel_no=<%=dto.getHostel_no()%>">
			</div>
			<div class="hostel__content">
				<ul>
					<li class="hostel__title"><h3><%=dto.getHostel_name() %></h3></li>
					<li class="hostel__type"><h5><%=dto.getHostel_kind_name() %></h5></li>
					<li class="hostel__intro"><span><%=dto.getHostel_content() %></span></li>
					<li class="hostel__info">
					<%	
						RoomDto rdto = rdao.minimumPrice(dto.getHostel_no());
					%>
						<ul class="hostel__info-list">
							<li class="room-info hostel__max-people"><span>최대인원 <%=rdto.getRoom_max_people() %>명 | </span></li>
							<li class="room-info hostel__bed"><span>침대 <%=rdto.getRoom_bed() %>개 | </span></li>
							<li class="room-info hostel__bathroom"><span>화장실 <%=rdto.getRoom_bath() %>개 |</span></li>
							<li class="room-info hostel__cook"><span>요리 <%=rdto.getRoom_cook() %> | </span></li>
							<li class="room-info hostel__spa"><span>사우나 <%=rdto.getRoom_spa() %></span></li>
						</ul>
						<ul class="hostel__info-list">
							<li class="room-info hostel__parking"><span>주차장 <%=rdto.getRoom_parking() %> | </span></li>
							<li class="room-info hostel__pet"><span>애완동물 <%=rdto.getRoom_pet() %> | </span></li>
							<li class="room-info hostel__wifi"><span>WIFI O | </span></li>
							<li class="room-info hostel__breakfast"><span>조식 <%=rdto.getRoom_breakfast() %></span></li>
						</ul>
					</li>	
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="hostel__price">
				<input value="상세 보기" class="submit" type="submit">
				<h3><%=rdto.getRoom_priceWithFormat() %>원</h3>
			</div>
		</div>
	</section>
	</form>
	<%
		}
	%>
	<%
		}else {
	%>
	<br><br><br>
		<p class="tip" style="color: coral;">Tip</p>
		<p class="tip">- 목적지, 체크인/아웃, 인원은 필수 입력 항목입니다.</p>
		<p class="tip">- 아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
		<p class="tip">"서울 강남"</p>
	<%} %>
	<div class="border-bottom"></div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>