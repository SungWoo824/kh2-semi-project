<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	System.out.println(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>비밀번호 찾기를 도와드릴게요 !</h2>
		<form action="login.jsp" method="post">
		<table border="0">	
			<tr>
				<td>
				<input type="text" name="member_id" placeholder="아이디" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="member_name" placeholder="이름" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="member_phone" placeholder="핸드폰번호" required>
				
				</td>
			</tr>
					
			<tr align="center">
				<td>
				<input type="submit" value="확인">
				</td>	
			</tr>
		</table>	
		</form>
			<%if(id != null){ %>
			<font color="blue"><h2>고객님의 아이디는 : <%=id %>입니다.
			비밀번호 .. 이제 기억나실까요?</h2></font>
			<%} %>
	</div>

</body>
</html>