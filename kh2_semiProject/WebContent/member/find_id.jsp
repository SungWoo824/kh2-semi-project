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
<style type="text/css">
	.find_id{
		background-image: url("../image/find_id.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 15px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
	}
	.menu-item{
		border: 0;
	    background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.5 );
	}
	.find-id{
		margin-top: 15%;
	}
</style>
</head>
<body>
	<div class="find_id" align="center">
		<div class="find-id">
		<h2>아이디 찾기를 도와드릴께요 !</h2>
		<form action="find.do" method="post">
		<table border="0">	
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_name" placeholder="이름" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_birthday" placeholder="생년월일" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_phone" placeholder="핸드폰번호" required>
				
				</td>
			</tr>
					
			<tr align="center">
				<td>
				<input class="menu-item" type="submit" value="확인">
				</td>	
			</tr>
		</table>	
		</form>
		</div>
	</div>
	

</body>
</html>
				
				
				
					
				
				
			
	
	
	