<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w-100 master-menu">
		
		<div class="master-menu-item">
			<a href="<%=request.getContextPath() %>/grandmaster/master_hostel_list.jsp">호텔 관리</a>
		</div>
		<div class="master-menu-item">
			<a href="<%=request.getContextPath() %>/grandmaster/master_member_list.jsp">회원 관리</a>
		</div>
		<div class="master-menu-item">
			<a href="<%=request.getContextPath() %>/grandmaster/coupon_itself.jsp">쿠폰 관리</a>
		</div>
		<div class="master-menu-item">
			<a href="<%=request.getContextPath() %>/qa/list.jsp">게시글 관리</a>
		</div>
		<div class="master-menu-item">
			<a href="<%=request.getContextPath() %>/grandmaster/master_reservation_list.jsp">예약 관리</a>
		</div>
</div>