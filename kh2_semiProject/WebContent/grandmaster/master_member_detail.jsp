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
</head>
<body>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div>
	회원정보
	</div>
	<div>
	회원번호
	<%=mdto.getNo() %>
	</div>
	<div>
	아이디
	<%=mdto.getId() %>
	</div>
	<div>
	이름
	<%=mdto.getName() %>
	</div>
	<div>
	등급
	<%=mdto.getGrade() %>
	</div>
	<div>
	생일
	<%=mdto.getBirthday() %>
	</div>
	<div>
	전화번호
	<%=mdto.getPhone() %>
	</div>
	<div>
	이메일
	<%=mdto.getEmail() %>
	</div>
	<div>
	쿠폰내용
	<%for(CouponDto cdto : list){ %>
		<%=cdto.getCoupon_no() %>
		<%=cdto.getCoupon_name() %>
		<%=cdto.getCoupon_rate() %>
		<%=cdto.getCoupon_date().substring(0, 10) %>
		<%=cdto.getCoupon_explain() %>
	<%} %>
	</div>
	<div><a href="#">회원탈퇴</a><br><a href="#">등급변경</a><br><a href="#">쿠폰추가</a></div>
</body>
</html>