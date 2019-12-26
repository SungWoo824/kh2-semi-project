<%@page import="beans.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int pagesize = 15;
	int navsize = 10;
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type != null && keyword != null;
	ReservationDao rdao = new ReservationDao();
	List<ReservationDto> list;

	if(isSearch){
		list = rdao.masterReservationSearch(type, keyword, start, finish); 
	}
	else{
		list = rdao.masterReservationList(start, finish);
	}
	int count = rdao.masterReservationCount(type, keyword);
	int pagecount = (count + pagesize) / pagesize;
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color: #666; 
		/*글자색을 바꾸고 싶다면*/
 		color:#666; 
 		padding: 9px 16px;
 		margin-bottom: 2px;
	}
	
	/* 화살표 색상을 바꾸고 싶다면 */
	.select-selected::after{
		border-top-color:#666;
	}
	.select-selected.select-arrow-active::after{
		border-bottom-color:#666;
	}
	/* 화살표 색상을 바꾸고 싶다면 */	
	
	/* 테두리를 바꾸고 싶다면 */
	.select-items{
		border-color:#eaebec;
	}
	/* 테두리를 바꾸고 싶다면 */
	
	
	/* 항목 글자색을 바꾸고 싶다면 */
	.select-items div{
		color:#666;
	}
	/* 항목 글자색을 바꾸고 싶다면 */
	body{
		height: 1000px;
		width: 100%;
		margin: 0;
		padding: 0;
		background-repeat: no-repeat;
		background-size : cover;	
	}
	.background{
		height:1000px;	
		position:fixed;
		width:100%;
		z-index:100;
		background-size: 100%;
		min-height:1000px;
	}
	.background img{
		width:100%;
		height:1000px;
	}
	
	.container{
		width:100%;
		position:absolute;
		z-index:101;
	}
	.form-choice{
		border:none;
		margin-bottom: 200px;
	}
</style>
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
</head>
<body>
<div class="background">
	<img src="../image/master.jpg">
</div>
<section class="container">
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="w-80">
	
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div class="master-title w-100"><h2>회원 목록</h2></div>
    <table class="w-100 couponmember-table">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>등급</th>
				<th>생일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>보유쿠폰수</th>
			</tr>
		</thead>
		<tbody>
			<%for(ReservationDto rdto : list){ %>
			<tr>
			
				<th><%=rdto.getReservation_no() %></th>
				<th><%=rdto.getHostel_no() %></th>
				<th><%=rdto.getRoom_no() %></th>
				<th><%=rdto.getCustomer_no() %></th>
				<th><%=rdto.getReservation_start_date() %></th>
				<th><%=rdto.getReservation_finish_date() %></th>
				<th><a href="#">
				상세보기</a></th>
			
			</tr>
			<%} %>
		</tbody>
	</table>
	<h4 class="navigator">
			<%if(startBlock > 1){ %>
				<%if(isSearch){ %>
					<a href="master_reservation_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
				<%}else{ %>
					<a href="master_reservation_list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="master_reservation_list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					<%if(isSearch){ %>
						<a href="master_reservation_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
					<%}else{ %>
						<a href="master_reservation_list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(finishBlock < pagecount){ %>
				<%if(isSearch){ %>
					<a href="master_member_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
				<%}else{ %>
					<a href="master_member_list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
			<%} %>
		</h4>
	<div align="right" style="border-color:none;">
	<form action="master_reservation_list.jsp" method="get" class="form-choice">
		<select id="select" name="type" class="select-icon custom-select" required>
			<option value="reservation_start_date">시작일</option>
			<option value="hostel_no">숙소 번호</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어" required class="search-input">
		<input type="submit" value="검색" class="button-design">
	</form>
	</div>
	</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</section>
</body>
</html>