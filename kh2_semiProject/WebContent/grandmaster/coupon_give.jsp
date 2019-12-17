<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수여</title>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
	<h2>쿠폰 수여</h2>
		<form action="<%=request.getContextPath() %>/grandmaster/coupongive.do" method="post">
			<table border="1" width="30%">
				<tr>
					<th>
						<select name="type1">
							<option value="member_no">회원 번호</option>
							<option value="member_id">회원 아이디</option>
						</select>					
					</th>
					<td>
						<input type="text" name="keyword1" required>
					</td>
				</tr>
				<tr>
					<th>쿠폰 번호</th>
					<td>
						<input type="text" name="keyword2" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수여">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>footer</div>
</body>
</html>