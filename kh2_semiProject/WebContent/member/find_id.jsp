<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("member_id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
</head>
<body>
	<div align="center">
		<h2>아이디 찾기를 도와드릴께요 !</h2>
		<form action="find.do" method="post">
		<table border="0">	
			<tr>
				<td>
				<input type="text" name="member_name" placeholder="이름" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="member_birthday" placeholder="생년월일" required>
				
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
	</div>
	

</body>
</html>
				
				
				
					
				
				
			
	
	
	