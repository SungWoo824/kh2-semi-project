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
</head>
<body>
<div>header</div>
<div>menu</div>
<div align="center">
<h2>보유 쿠폰 목록</h2>
	<%if(isSearch&&list.size()==0){%>
		<h3>검색결과가 없습니다</h3>
	<%}else{ %>
		<table border="1" width="90%">
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
				<tbody align="center">
					<%for(CouponDto cdto:list){ %>
					<tr>
						<td><%=cdto.getHavecoupon_no() %></td>
						<td><%=cdto.getMember_id() %></td>
						<td><%=cdto.getMember_name() %></td>
						<td><%=cdto.getMember_phone() %></td>
						<td><%=cdto.getCoupon_no() %></td>
						<td><%=cdto.getCoupon_name() %></td>
						<td><%=cdto.getCoupon_rate() %></td>
						<td><%=cdto.getCoupon_date().substring(0, 10) %></td>
						<td>
							<a href="<%=request.getContextPath() %>/grandmaster/couponremove.do?havecoupon_no=<%=cdto.getHavecoupon_no()%>">삭제</a>
						</td>
					</tr>
					<%} %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" align="right">
							<a href="#">쿠폰 수여</a>
							<%if(isSearch) {%>
							<a href="coupon_member.jsp">전체목록 보기</a>
							<%} %>
						</td>
					</tr>
				</tfoot>	
		</table>
		<h4>
			<%if(startBlock > 1){ %>
				<%if(isSearch){ %>
					<a href="coupon_member.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
				<%}else{ %>
					<a href="coupon_member.jsp?pno=<%=startBlock - 1%>">[이전]</a>
				<%} %>
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<%=i%>
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
					<a href="coupon_member.jsp?pno=<%=finishBlock + 1%>">[다음]</a>
				<%} %>
			<%} %>
		</h4>
	<%} %>
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
<div>footer</div>
</body>
</html>