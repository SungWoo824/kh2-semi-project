<%@page import="beans.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.CouponDao"%>
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
	CouponDao dao = new CouponDao();
	List<CouponDto> list;
	if(isSearch){
		list = dao.search(type, keyword, start, finish); 
	}
	else{
		list = dao.getList(start, finish);
	}
	int count = dao.getCount(type, keyword);
	int pagecount = count / pagesize;
	if(count%pagesize!=0){
		pagecount+=1;
	}
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
<title>쿠폰 검색 및 관리</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color:#666; 
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
	.select-items{
		border-color:#eaebec;
	}
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
<jsp:include page="../template/coupon_choice_template.jsp"></jsp:include>
<div align="center"><h2>쿠폰 목록</h2></div>
<%if(isSearch&&list.size()==0){%>
	<h3>검색결과가 없습니다</h3>
<%}else{ %>
	<table class="w-100 couponmember-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>할인율</th>
					<th>유효기간</th>
					<th>관리메뉴</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(CouponDto dto:list){ %>
					<tr>
						<td><%=dto.getCoupon_no() %></td>
						<td><%=dto.getCoupon_name() %></td>
						<td><%=dto.getCoupon_rate() %>%</td>
						<td><%=dto.getCoupon_date().substring(0, 10) %></td>
						<td>
							<a href="coupon_change.jsp?coupon_no=<%=dto.getCoupon_no()%>">수정</a> 
							<a href="<%=request.getContextPath() %>/grandmaster/coupondelete.do?coupon_no=<%=dto.getCoupon_no()%>">삭제</a>
							<a href="coupon_detail.jsp?coupon_no=<%=dto.getCoupon_no()%>">상세보기</a>
						</td>
					</tr>
				<%} %>
			</tbody>
			<tfoot>		
				<tr style="height: 30px;">		
					<td colspan="5" align="right">		
						<a href="coupon_regist.jsp">쿠폰 등록</a>
						<%if(isSearch) {%>
						<a href="coupon_itself.jsp">전체목록 보기</a>
						<%} %>	
					</td>		
				</tr>		
			</tfoot>
	</table>
	<h4 class="navigator">
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
				<a href="coupon_itself.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
			<%}else{ %>
				<a href="coupon_itself.jsp?pno=<%=startBlock - 1%>">[이전]</a>
			<%} %>
		<%} %>
		<%for(int i=startBlock; i <= finishBlock; i++){ %>
			<%if(i == pno){ %>
				<a href="coupon_member.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
			<%}else{ %>
				<%if(isSearch){ %>
					<a href="coupon_itself.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
				<%}else{ %>
					<a href="coupon_itself.jsp?pno=<%=i%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
	
		<%if(finishBlock < pagecount){ %>
			<%if(isSearch){ %>
				<a href="coupon_itself.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
			<%}else{ %>
				<a href="coupon_itself.jsp?pno=<%=finishBlock + 1%>">[다음]</a>
			<%} %>
		<%} %>
	</h4>
<%} %>
	<div align="right">
	<form action="coupon_itself.jsp" method="get" class="form-choice">
		<select id="select" name="type" class="select-icon custom-select" required>
			<option value="coupon_name">이름</option>
			<option value="coupon_no">번호</option>
			<option value="coupon_rate">할인율(검색값 이상)</option>
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