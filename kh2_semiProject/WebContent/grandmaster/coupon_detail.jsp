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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>
.explain textarea{
	width:99%;
	height:200px;
	resize:vertical;
	font-family:inherit;
	outline:none;
	border: 1px solid #fff;
	background-color:#fff;
}
</style>
</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>
<div class="w-50">
<div align="center"><h2>쿠폰 상세보기</h2></div>
	
<table class="w-100 coupon-under-table">
<tbody>
	<tr>
		<th>쿠폰번호</th>
		<td align="left">
			<%=dto.getCoupon_no() %>	
		</td>
	</tr>
	<tr>
		<th>쿠폰이름</th>
		<td align="left">
			<%=dto.getCoupon_name() %>	
		</td>
	</tr>
	<tr>
		<th>할인율</th>
		<td align="left">
			<%=dto.getCoupon_rate() %>	
		</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td align="left">
			<%=dto.getCoupon_date().substring(0, 10) %>	
		</td>
	</tr>
	<tr height="200px">
		<th>상세설명</th>
		<td class="explain">
			<textarea readonly="readonly" disabled><%=dto.getCoupon_explain() %></textarea>		
		</td>
	</tr>
	<tr>
	<td colspan="2" align="right" class="input-button">
		<a id="a" href="coupon_change.jsp?coupon_no=<%=dto.getCoupon_no()%>">
			<input type="button" value="수정">
		</a>
		<a id="a" href="<%=request.getContextPath() %>/grandmaster/coupondelete.do?coupon_no=<%=dto.getCoupon_no()%>">
			<input type="button" value="삭제">
		</a>
		<a id="a" href="coupon_itself.jsp">
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