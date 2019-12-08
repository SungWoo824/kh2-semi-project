<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String grade = request.getParameter("grade");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 페이지</title>
</head>
<body>
<div>
	<h2>회원가입 성공</h2>
	<h3>지금바로 등록/예약 해보세요.</h3>
	<%if(grade.equals("사용자")) {%>
	<a href = "/info/reserve_info.jsp">예약 설명 보러가기</a>
	<%} else{%>
	<a href = "/info/regist_info.jsp">등록 설명 보러가기</a>
	<%} %>
</div>
</body>
</html>