<%@page import="beans.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pagesize = 10;
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
	CouponDao cdao = new CouponDao();
	List<CouponDto> list;
	if(isSearch){
		list = cdao.couponSearch(type, keyword, start, finish); 
	}
	else{
		list = cdao.getCouponList(start, finish);
	}
	int count = cdao.getCouponCount(type, keyword);
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
<title>사용자 보유 쿠폰 목록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>

</style>
</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>
<div class="w-80">
<div align="center"><h3>보유 쿠폰 목록</h3></div>
	<%if(isSearch&&list.size()==0){%>
		<h3>검색결과가 없습니다</h3>
	<%}else{ %>
		<table class="w-100 couponmember-table">
				<thead>
					<tr>
						<th>보유쿠폰 번호</th>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 연락처</th>
						<th>쿠폰 번호</th>
						<th>쿠폰 이름</th>
						<th>쿠폰 할인율</th>
						<th>쿠폰 유효기간</th>
						<th>관리메뉴</th>
					</tr>
				</thead>
				<tbody>
					<%for(CouponDto cdto:list){ %>
					<tr>
						<th><%=cdto.getHavecoupon_no() %></th>
						<th><%=cdto.getMember_id() %></th>
						<th><%=cdto.getMember_name() %></th>
						<th><%=cdto.getMember_phone() %></th>
						<th><%=cdto.getCoupon_no() %></th>
						<th><%=cdto.getCoupon_name() %></th>
						<th><%=cdto.getCoupon_rate() %></th>
						<th><%=cdto.getCoupon_date().substring(0, 10) %></th>
						<th>
							<a href="<%=request.getContextPath() %>/grandmaster/couponremove.do?havecoupon_no=<%=cdto.getHavecoupon_no()%>">삭제</a>
						</th>
					</tr>
					<%} %>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="9" align="right">
							<%if(isSearch) {%>
							<a href="coupon_member.jsp">전체목록 보기</a>
							<%} %>
							<a href="coupon_give.jsp">쿠폰 수여</a>
						</th>
					</tr>
				</tfoot>	
		</table>
		<h4 class="navigator">
			<%if(startBlock > 1){ %>
				<%if(isSearch){ %>
					<a href="coupon_member.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
				<%}else{ %>
					<a href="coupon_member.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="coupon_member.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					<%if(isSearch){ %>
						<a href="coupon_member.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
					<%}else{ %>
						<a href="coupon_member.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(finishBlock < pagecount){ %>
				<%if(isSearch){ %>
					<a href="coupon_member.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
				<%}else{ %>
					<a href="coupon_member.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
			<%} %>
		</h4>
	<%} %>
	<div align="right">
	<form action="coupon_member.jsp" method="get">
		<select name="type">
			<option value="member_name">회원 이름</option>
			<option value="member_id">회원 아이디</option>
			<option value="coupon_name">쿠폰 이름</option>
			<option value="coupon_no">쿠폰 번호</option>
			<option value="coupon_rate">할인율(검색값 이상)</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어" required>
		<input type="submit" value="검색">
	</form>
	</div>
</div>
<div>footer</div>
</body>
</html>