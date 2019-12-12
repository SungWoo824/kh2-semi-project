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
				<option value="name">이름</option>
				<option value="no">번호</option>
				<option value="rate">할인율(검색값 이상)</option>
				<option value="date">사용가능여부(유효기간)</option>
			</select>
			
			<input type="text" name="keyword">
			
			<input type="submit" value="검색">
		
		</form>
		
	</div>
	<div>footer</div>
</body>
</html>