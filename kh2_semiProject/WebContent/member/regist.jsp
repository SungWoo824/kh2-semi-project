<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
<div>

</div>
<div align ="center">
	<h2>회원가입</h2>
	<form action="regist.do" method = "post">
	<table>
		<tr>
			<th>아이디</th>
			<th><input type = "text" name="member_id"></th>
		</tr>
		<tr>
			<th>비밀번호</th>
			<th><input type = "password" name="member_pw"></th>
		</tr>
		<tr>
			<th>이름</th>
			<th><input type = "text" name="member_name"></th>
		</tr>
		<tr>
			<th>생년월일</th>
			<th><input type = "date" name="member_birthday"></th>
		</tr>
		<tr>
			<th>전화번호</th>
			<th><input type = "text" name="member_phone"></th>
		</tr>
		<tr>
			<th>이메일</th>
			<th><input type = "text" name="member_email"></th>
		</tr>
		<tr>
		<th>사용유형</th>
		<th><select>
			<option>사용자</option>
			<option>판매자</option>
		</select></th>
		</tr>
		<tr><td colspan = "2" align = "right">
		<input type = "submit" value = "회원 가입">
		</td></tr>
	</table>
	</form>
</div>
</body>
</html>