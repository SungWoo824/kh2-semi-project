<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
</head>
<body>
	<div>header</div>
	<div>menu</div>
	<div align="center">
	<h2>쿠폰 등록</h2>
		<form action="<%=request.getContextPath() %>/grandmaster/couponregist.do" method="post">
			<table border="1" width="60%">
				<tr>
					<th>쿠폰이름</th>
					<td>
						<input type="text" name="coupon_id" required>		
					</td>
				</tr>
				<tr>
					<th>할인율</th>
					<td>
						<input type="text" name="coupon_rate" required>		
					</td>
				</tr>
				<tr>
					<th>만료일</th>
					<td>
						<input type="date" name="coupon_date" required>		
					</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td>
						<textarea name="coupon_explain" required rows="15" cols="62" 
						style="resize:vertical;"></textarea>		
					</td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기">
					<a href="coupon_itself.jsp">
						<input type="button" value="목록보기">
					</a>
				</td>
			</tr>
			</table>
		</form>
</div>
<div>footer</div>
</body>
</html>