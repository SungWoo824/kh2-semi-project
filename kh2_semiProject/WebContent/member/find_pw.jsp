<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>비밀번호 찾기를 도와드릴게요 !</h2>
		<form action="find.do" method="post">
		<table border="0">	
			<tr>
				<td>
				<input type="text" name="member_id" placeholder="아이디" required>
				<input type="submit" value="확인">
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="member_name" placeholder="이름" required>
				<input type="submit" value="확인">
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="member_phone" placeholder="핸드폰번호" required>
				<input type="submit" value="확인">
				</td>
			</tr>
					
			<tr align="center">
				<td>
				<input type="submit" value="찾기">
				</td>	
			</tr>
		</table>	
		</form>
	</div>

</body>
</html>