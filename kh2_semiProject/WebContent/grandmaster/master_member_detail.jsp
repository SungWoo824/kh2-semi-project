<%@page import="beans.CouponDto"%>
<%@page import="beans.CouponDao"%>
<%@page import="java.util.List"%>
<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.memberInfomation(Integer.parseInt(request.getParameter("member_no")));
	CouponDao cdao = new CouponDao();
	List<CouponDto> list = cdao.memberHasCoupon(Integer.parseInt(request.getParameter("member_no")));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<style>
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
</style>
</head>
	<body onload="display();">
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
		<div class="row-big"></div>
		<div class="row-big"></div>
		<div class="row-big"></div>
		<div class="master-title">
		<h1>회원정보</h1>
		</div>
		<div class="w-100">
		
		<div class="master-detail">
			<div class="master-detail-name">
				<label>&emsp;회원번호  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getNo() %>
			</div>
			<div class="master-detail-name">
				<label>&emsp;아이디  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getId() %>
			</div>
		</div>
		<div class="master-detail">
			
			<div class="master-detail-name">
				<label>&emsp;이름  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getName() %>
			</div>
			<div class="master-detail-name">
				<label>&emsp;등급  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getGrade() %>
			</div>
		</div>
		<div class="master-detail">
			<div class="master-detail-name">
				<label>&emsp;생일  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getBirthday().substring(0,10) %>
			</div>
			<div class="master-detail-name">
				<label>&emsp;전화번호  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getPhone() %>
			</div>
		</div>
		<div class="master-detail">
			<div class="master-detail-name">
				<label>&emsp;이메일  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getEmail() %>
			</div>
			<div class="master-detail-name">
				<label>&emsp;가입일  : </label>
			</div>
			<div class="master-detail-content">
				<%=mdto.getJoindate().substring(0,10) %>
			</div>
		</div>
		
		
		<div class="master-detail">
			
			<div class="master-detail-coupon">
				<label>쿠폰번호 </label>
			</div>
			<div class="master-detail-coupon">
				<label>쿠폰이름 </label>
			</div>
			<div class="master-detail-coupon">
				<label>할인율</label>
			</div>
			<div class="master-detail-coupon">
				<label>사용기간</label>
			</div>
			<div class="master-detail-coupon">
				<label>상세설명</label>
			</div>
		</div>
		<div class="master-detail">
		<%for(CouponDto cdto : list){ %>
			<div class="master-detail-coupon">
				<%=cdto.getCoupon_no() %>
			</div>
			<div class="master-detail-coupon">
				<%=cdto.getCoupon_name() %>
			</div>
			<div class="master-detail-coupon">
				<%=cdto.getCoupon_rate() %>
			</div>
			<div class="master-detail-coupon">
				<%=cdto.getCoupon_date().substring(0, 10) %>
			</div>
			<div class="master-detail-coupon">
				<%=cdto.getCoupon_explain() %>
			</div>
		<%} %>
		</div>
		<div class="coupon-choice-template">
			<a href="#">회원탈퇴</a>
			<a href="#">등급변경</a>
			<a href="<%=request.getContextPath() %>/grandmaster/coupon_give.jsp?member_no=<%=mdto.getNo() %>">쿠폰추가</a>
		</div>
	</div>
	</div>
	<div>
		<h2>Footer 위치</h2>
	</div>
</body>
</html>