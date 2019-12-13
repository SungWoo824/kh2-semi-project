<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<div align="center">
	<h2><font color="brown">로그인 페이지</font></h2>
		
	<form action="/kh2_semiProject/member/login.do" method="post">
	<table border="0">
		<tr>
			<th align="center">
				<input type="text" name="member_id" placeholder="ID">
			</th>
		</tr>

		<tr>
			<th align="center">
				<input type="password" name="member_pw" placeholder="Password">
			</th>
		</tr>
		<tr>
			<th align="center">
				<input type="submit" value="로그인">
			</th>
		</tr>
		

		<tr>
			<th>
				<input type="checkbox">
				<font color="brown">저장하기</font>
			</th>
		</tr>
		<tr>
			<td>
				<a href="#">아이디찾기</a>
				<a href="#">비밀번호찾기</a>
				<a href="regist.jsp">회원가입</a>
			</td>
		</tr>
	</table>
	</form>
</div>
</head>
<body>

</body>
</html>
		
	
	
	
	
	
