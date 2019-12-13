<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<div align="center">
	<h2><font color="red">♨운기랑 화끈하게 놀아보실래요?♨</font></h2>
		<h4>연락을 기다리고있겠습니다....</h4>
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
				아이디 저장하기
			</th>
		</tr>
		<tr>
			<td>
				<a href="#">아이디찾기</a>
				<a href="#">비밀번호찾기</a>
				<a href="#">회원가입</a>
			</td>
		</tr>
	</table>
	</form>
</div>
</head>
<body>

</body>
</html>
		
	
	
	
	
	
