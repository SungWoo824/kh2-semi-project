<%@page import="beans.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	boolean isSearch = type != null && keyword != null;
	
	CouponDao dao = new CouponDao();
	List<CouponDto> list;
	if(isSearch){
		list = dao.search(type, keyword); 
	}
	else{
		list = null;
	}	
	System.out.println(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리 페이지</title>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
		
		<h2>쿠폰 검색</h2>
		
		<!-- 검색창 -->
		<form action="coupon_itself.jsp" method="get">
		
			<select name="type">
				<option value="coupon_name">이름</option>
				<option value="coupon_no">번호</option>
				<option value="coupon_rate">할인율(검색값 이상)</option>
			</select>
			
			<input type="text" name="keyword">
			<input type="submit" value="검색">
			<div></div>
		
		</form>
		
<!-- 		<h3> -->
<%-- 			type = <%=request.getParameter("type") %>, --%>
<%-- 			keyword = <%=request.getParameter("keyword") %> --%>
<!-- 		</h3> -->
		
		<% if(list.isEmpty()){ %>
			<h3>검색결과가 없습니다</h3>
		<%}else{ %>
		
			<table border="1" width="80%">
			
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>할인율</th>
						<th>유효기간</th>
						<th>상세설명</th>
					</tr>
				</thead>
				
				<tbody>
					<%for(CouponDto dto:list){ %>
					<tr>
						<td><%=dto.getCoupon_no() %></td>
						<td><%=dto.getCoupon_name() %></td>
						<td><%=dto.getCoupon_rate() %></td>
						<td><%=dto.getCoupon_date() %></td>
						<td><%=dto.getCoupon_explain() %></td>
					</tr>
					<%} %>
				</tbody>
				
			</table>
		<%} %>	
	</div>
	<div>footer</div>
</body>
</html>


















