<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	
	
// 	MemberDao dao = new MemberDao();
	
// 	boolean result = dao.find_pw(id, name, phone);
			
	
	
	
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
		<form action="findpw.do" method="post">
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
<%-- 			<%if(result){ %> --%>
			<font color="black"><h2>고객님의 ID : <%=id %>입니다.</h2>
				<a href="login.jsp">로그인 하러 가기</a>
			</font>
				
<%-- 			<%}else{ %> --%>
<!-- 			<h2>입력하신 정보에 해당하는 회원이 없습니다.</h2>	 -->
<!-- 			<h3><a href="find.jsp">다시 입력하기 </a></h3> -->
<%-- 			<%} %> --%>
			
	</div>

</body>
</html>