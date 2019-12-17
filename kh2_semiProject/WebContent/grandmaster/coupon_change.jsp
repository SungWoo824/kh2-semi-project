<%@page import="beans.CouponDto"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int coupon_no = Integer.parseInt(request.getParameter("coupon_no"));
	CouponDao dao = new CouponDao();
	CouponDto dto = dao.get(coupon_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 페이지</title>
<style>
.explain textarea{
	width:99%;
	height:200px;
	resize:vertical;
}
</style>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
	<h2>쿠폰 수정</h2>
	
	<form action="<%=request.getContextPath() %>/grandmaster/couponchange.do" method="post">
	
	<input type="hidden" name="coupon_no" value="<%=dto.getCoupon_no() %>">
	
	<table border="1" width="40%">
	<tbody>
		<tr>
			<th>쿠폰이름</th>
			<td align="left">
				<input type="text" name="coupon_name" value="<%=dto.getCoupon_name() %>" required>		
			</td>
		</tr>
		<tr>
			<th>할인율</th>
			<td align="left">
				<input type="text" name="coupon_rate" value="<%=dto.getCoupon_rate() %>" required>		
			</td>
		</tr>
		<tr>
			<th>만료일</th>
			<td align="left">
				<input type="date" name="coupon_date" value="<%=dto.getCoupon_date().substring(0, 10) %>" required>		
			</td>
		</tr>
		<tr height="200px">
			<th>상세설명</th>
			<td class="explain">
				<textarea name="coupon_explain" required><%=dto.getCoupon_explain() %></textarea>		
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<a href="coupon_itself.jsp">
				<input type="button" value="목록보기">
			</a>
		</td>
	</tr>
	</tbody>
	</table>
	</div>
	<div>footer</div>
</body>
</html>