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
	CouponDao dao = new CouponDao();
	List<CouponDto> list;
	if(isSearch){
		list = dao.search(type, keyword, start, finish); 
	}
	else{
		list = dao.getList(start, finish);
	}
	int count = dao.getCount(type, keyword);
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
<title>쿠폰 검색 및 관리</title>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
	<h2>쿠폰 검색</h2>
	<%if(isSearch&&list.size()==0){%>
		<h3>검색결과가 없습니다</h3>
	<%}else{ %>
		<table border="1" width="90%">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>할인율</th>
						<th>유효기간</th>
						<th width="45%">상세설명</th>
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
							<td><%=dto.getCoupon_explain() %></td>
							<td>
								<a href="coupon_change.jsp?coupon_no=<%=dto.getCoupon_no()%>"">수정</a> |
								<a href="<%=request.getContextPath() %>/grandmaster/coupondelete.do?coupon_no=<%=dto.getCoupon_no()%>"">삭제</a>
							</td>
						</tr>
					<%} %>
				</tbody>
				<tfoot>		
					<tr>		
						<td colspan="6" align="right">		
							<a href="coupon_regist.jsp">쿠폰 등록</a>	
						</td>		
					</tr>		
				</tfoot>
		</table>
	<h4>
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
				<a href="coupon_itself.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
			<%}else{ %>
				<a href="coupon_itself.jsp?pno=<%=startBlock - 1%>">[이전]</a>
			<%} %>
		<%} %>
		<%for(int i=startBlock; i <= finishBlock; i++){ %>
			<%if(i == pno){ %>
				<%=i%>
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
	<form action="coupon_itself.jsp" method="get">
		<select name="type">
			<option value="coupon_name">이름</option>
			<option value="coupon_no">번호</option>
			<option value="coupon_rate">할인율(검색값 이상)</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어" required>
		<input type="submit" value="검색">
	</form>
	</div>
	<div>footer</div>
</body>
</html>