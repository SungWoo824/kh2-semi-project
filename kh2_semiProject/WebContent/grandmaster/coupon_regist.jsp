<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>
.explain textarea{
	width:99%;
	height:200px;
	resize:vertical;
	font-family:inherit;
	outline:none;
	border: 1px solid #fff;
	background-color:#fff;
}
</style>
</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>
<div class="w-50">
<div align="center"><h2>쿠폰 등록</h2></div>
	<form action="<%=request.getContextPath() %>/grandmaster/couponregist.do" method="post">
		<table class="w-100 coupon-under-table">
			<tr>
				<th>쿠폰이름</th>
				<td>
					<input type="text" name="coupon_name" required>		
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
					<input id="date" type="date" name="coupon_date" required>		
				</td>
			</tr>
			<tr height="200px">
				<th>상세설명</th>
				<td class="explain">
					<textarea name="coupon_explain" required></textarea>		
				</td>
			</tr>
			<tr>
			<td colspan="2" align="right" class="input-button">
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