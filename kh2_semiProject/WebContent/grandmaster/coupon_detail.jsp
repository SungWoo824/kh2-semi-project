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
<title>쿠폰 상세보기</title>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
	<h2>쿠폰 상세보기</h2>
	
	<table border="1">
	<tbody>
		<tr>
			<th>쿠폰번호</th>
			<td align="left">
				<input type="text" name="coupon_name" value="<%=dto.getCoupon_no() %>" required>		
			</td>
		</tr>
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
				<input type="text" name="coupon_date" value="<%=dto.getCoupon_date().substring(0, 10) %>" required>		
			</td>
		</tr>
		<tr>
			<th>상세설명</th>
			<td>
				<textarea name="coupon_explain" required rows="15" cols="62" 
				style="resize:vertical;"><%=dto.getCoupon_explain() %></textarea>		
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
			<a href="coupon_change.jsp?coupon_no=<%=dto.getCoupon_no()%>">
				<input type="button" value="수정">
			</a>
			<a href="<%=request.getContextPath() %>/grandmaster/coupondelete.do?coupon_no=<%=dto.getCoupon_no()%>">
				<input type="button" value="삭제">
			</a>
			<a href="coupon_itself.jsp">
				<input type="button" value="목록">
			</a>
		</td>
	</tr>
	</tbody>
	</table>
	</div>
	<div>footer</div>
</body>
</html>