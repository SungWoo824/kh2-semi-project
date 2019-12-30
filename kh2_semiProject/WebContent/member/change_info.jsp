<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	
	MemberDao dao = new MemberDao();
	/* MemberDto dto = dao.get(member_id); */
	/* MemberDto dto = new MemberDto(); */
	MemberDto dto = dao.get(id);
	
%>
<style>
	*{
		box-sizing: border-box;
		
	}
	
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
	.change-info{
	font-family: binggrae;
	margin-top: 80px;
	height: 800px;
	width: 100%;
	padding-top:40px;
	background-image: url("../image/login5.jpg");
	background-repeat: no-repeat;
	background-size: 98% 100%;
	background-position:center;	
	}	
	
	.change-low{
	bottom: 0px;
	position: absolute;
	width: 100%;	
	}
	#login_bt {
	width: 285px;
	height: 35px;
	background-color: #000;
	font-weight: bold;
	color: #fff;
}

</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">

	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
<div class="change-info" align="center">
	<form id="change-center" action="../member/login.jsp">

		<h3>고객님 기본정보</h3>
  
<table class="infomation" border="1"  width="450">
<tr> 
	<th>아이디</th> 
		<td>
 			<%=dto.getId()%>
		</td>
</tr>

<tr> 
	<th>새 비밀번호</th> 
		<td>
			<input type="password" name="New Password" placeholder="New Password"  required="required">
		</td>
</tr>

<tr> 
	<th>새 비밀번호 확인</th> 
		<td>
			<input type="password" name="phone" placeholder="New Password"  required="required">
		</td>
</tr>

<tr> 
	<th>이름</th> 
		<td>
			<%=dto.getName()%>
		</td>
</tr>

<tr> 
	<th>휴대전화</th> 
		<td>
			<%=dto.getPhone()%>
		</td>
</tr>

<tr> 
	<th>이메일</th> 
		<td>
			<%=dto.getEmail()%>
		</td>
</tr>
</table>

	<h3>추가정보</h3>
	
	<table border="1" width="450">

		<tr>
			<th>생년월일</th>
			<td>
			<%=dto.getMember_birthDayWithFormat()%><!-- <input type="text" name="birthday"required="required"> -->
			</td>
		</tr>
		
		<tr>
			<th >추천인 아이디</th>
			<td><input type="text" name="recommand_id"></td>
		</tr>
		
	</table>
	
	<br>	<br>
	
<tr align="right"> 
<td >
<input id="login_bt" type="submit" value="회원정보수정">
</td>
</tr>
</form>
  </div>
  	
  	<div class="change-low">
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>







	

