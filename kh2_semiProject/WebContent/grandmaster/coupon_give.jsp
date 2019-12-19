<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수여</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color: #eaebec; 
		/*글자색을 바꾸고 싶다면*/
 		color:#666; 
 		text-align: center;
	}
	
	.select-selected::after{
		/* 화살표 색상을 바꾸고 싶다면 */
		border-top-color:#666;
	}
	.select-selected.select-arrow-active::after{
		border-bottom-color:#666;
	}
	
	.coupon-under-table{
		text-shadow: none;
	}
	
	.select-items{
		border-color:#eaebec;
	}
	
</style>
</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>
<div class="w-40">
<div align="center"><h2>쿠폰 수여</h2></div>
	<form action="<%=request.getContextPath() %>/grandmaster/coupongive.do" method="post">
		<table class="w-100 coupon-under-table">
			<tr>
				<th>
					<select name="type1" class="select-icon custom-select" required>
						<option value="member_no">회원 번호</option>
						<option value="member_id">회원 아이디</option>
					</select>					
				</th>
				<td>
					<input type="text" name="keyword1" required>
				</td>
			</tr>
			<tr height="52">
				<th>쿠폰 번호</th>
				<td>
					<input type="text" name="keyword2" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" class="input-button">
					<input type="submit" value="수여">
				</td>
			</tr>
		</table>
	</form>
</div>
<div>footer</div>
</body>
</html>