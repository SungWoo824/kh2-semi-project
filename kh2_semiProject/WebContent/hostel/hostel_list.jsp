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
	int adult = 0;
	int child = 0;
	int people = 0;
	
	boolean isSearch = start_day != null && finish_day != null && city_name != null;
	if(isSearch){
		adult = Integer.parseInt(request.getParameter("adult"));
		child = Integer.parseInt(request.getParameter("child"));
		people = adult + child;
		hlist = hdao.userSearchHostel(start_day, finish_day, city_name, people);
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
	<script src="../js/custom_select.js"></script>
</head>
<body>
     <form action="hostel_list.jsp?city_name=<%=city_name %>&check-in=<%= start_day %>&check-out=<%=finish_day %>&adult=<%=adult %>&child=<%=child %>" method="GET">
      <section class="search-section">
        <div class="search-container">
          <div class="search__inputbox search__location">
            <h6>목적지</h6>
            <input class="search__input" type="text" name="location"/>
          </div>
          <div class="search__inputbox search__check-in">
            <h6>Check-In</h6>
            <input class="search__input" type="date" name="check-in"/>
          </div>
          <div class="search__inputbox search__check-out">
            <h6>Check-Out</h6>
            <input class="search__input" type="date" name="check-out"/>
          </div>
          <div class="search__inputbox search__adult">
            <h6>성인</h6>
            <select class="search__input select-icon custom-select" name="adult">
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
            <select
              id="select"
              class="search__input select-icon custom-select"
              name="child"
            >
              <option value="0">0명</option>
              <option value="1">1명</option>
              <option value="2">2명</option>
              <option value="3">3명</option>
              <option value="4">4명</option>
              <option value="5">5명</option>
            </select>
          </div>
          <div class="search__inputbox search__button">
            <input class="search__input " type="submit" value="검색" />
          </div>
        </div>
      </section>
    </form>        
    <section id="hotel-list-section">
      <div class="hotel-list-container">
        <div class="hotel-list-header">
          <span class="hotel-list-result">
            <%=hlist.size() %>개의 검색 결과
          </span>
          <select name="" id="">
            <option value="">가격순 위</option>
            <option value="">가격순 아래</option>
            <option value="">평점순 위</option>
            <option value="">평점순 아래</option>
          </select>
        </div>
        <div class="hotel-list__item list-item1">
          <div class="imageBox">
            <img src="image/item3__list-1.jpg" alt="" />
          </div>
          
          <%if(hlist.size()>0) {%>
	          <%for(HostelDto dto : hlist){ %>
	          <div class="contentBox">
				<span>호스텔이름 : <%=dto.getHostel_name() %></span><br>
				<span>호스텔종류 : <%=dto.getHostel_kind_name() %></span><br>
	            <span>호스텔전화번호 : <%=dto.getHostel_phone() %></span><br>
				<span>호스텔디테일주소 : <%=dto.getHostel_detail_addr() %></span><br>
				<span>호스텔내용 : <%=dto.getHostel_content() %></span><br>            
	            <h4>review__star_point</h4>
	          </div>
          	<%} %>
          <%} %>
        </div>
      </div>
    </section>
  </body>
</body>

</html>