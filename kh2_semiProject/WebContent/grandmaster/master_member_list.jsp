<%@page import="beans.MemberDto"%>
<%@page import="java.util.*"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	MemberDao mdao = new MemberDao();
 	List<MemberDto> list= mdao.memberList();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>

    
</style>
</head>
<body>
	<div>헤더</div>
	<div>매뉴</div>
	<div><br></div>
	<div><br></div>
	<div><br></div>
	<div>회원 목록 보기</div>
	<div class="w-80">
    <table class="w-100 member-table">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>등급</th>
				<th>생일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>보유쿠폰수</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto mdto : list){ %>
			<tr>
			
				<th><%=mdto.getNo() %></th>
				<th><%=mdto.getId() %></th>
				<th><%=mdto.getName() %></th>
				<th><%=mdto.getGrade() %></th>
				<th><%=mdto.getBirthday().substring(0, 10) %></th>
				<th><%=mdto.getPhone() %></th>
				<th><%=mdto.getEmail() %></th>
				<th><%=mdao.memberCouponNumber(mdto.getNo()) %></th>
				<th><a href="master_member_detail.jsp?member_no=<%=mdto.getNo() %>">
				상세보기</a></th>
			
			</tr>
			<%} %>
		</tbody>
	</table>
	</div>
</body>
</html>