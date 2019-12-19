<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	System.out.println(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
		box-sizing: border-box;
				
	}
	.find_pw{
		background-image: url("../image/find_pw.jpg");
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
		text-align: center;
	}
	.find{
		margin-top: 15%;
	}
		
</style>

</head>
<body>
	<div align="center">
	  <div class="find_pw" align="center">
	  	<div class="find">	
		<h2>비밀번호 찾기를 도와드릴게요 !</h2>
		<form action="login.jsp" method="post">
		<table border="0">	
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_id" placeholder="ID" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_name" placeholder="Name" required>
				
				</td>
			</tr>
			<tr>
				<td>
				<input class="menu-item" type="text" name="member_phone" placeholder="Phone" required>
				
				</td>
			</tr>
					
			<tr align="center">
				<td>
				<input class="menu-item" type="submit" value="확인">
				</td>	
			</tr>
		</div>	
	</div>
	</table>	
</form>
			<%if(id != null){ %>
			<font color="black"><h2>고객님의 아이디는 : <%=id %>입니다.
			비밀번호 .. 이제 기억나실까요?</h2></font>
			<%} %>
			
	</div>

</body>
</html>