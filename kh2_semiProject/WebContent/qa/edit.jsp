<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<meta charset="UTF-8">
<title>글수정하기</title>

<%
	int qa_edit_no;
	try{
		qa_edit_no = Integer.parseInt(request.getParameter("qa_edit_no"));
	}catch(Exception e){
		qa_edit_no=0;
	}
	QaDao dao = new QaDao();
	QaDto dto = dao.get(qa_edit_no);
%>




<style>


</style>
</head>
<body>



			
			<table class="w-80 coupon-under-table" id="wrap">
	<thead>
		<tr>
			<th width="150px">&nbsp;제목</th>
			<td>&nbsp;<%=dto.getQa_title() %></td>
		</tr>
		<tr>
			<th>&nbsp;글쓴이</th>
			<td>&nbsp;<%=dto.getMember_no() %></td>
		</tr>
		<tr>
			<th>&nbsp;방이름</th>
			<td>&nbsp;<%=dto.getRoom_no() %></td>
		</tr>
		<tr height="200">
			<td valign="top" colspan="2"><%=dto.getQa_content() %> </td>
		</tr>
	</thead>
	
		</table>
			
			
			
		<form action="edit.do" method="post" >
			<div id="loginbox">
				<label for="upass" id="fUpass">분류</label> 
				
				<select id="upass" name="qa_head" style="width:50px;height:20px;font-size:10px">
			<option value="공지">공지</option>	
			<option value="유머">유머</option>
			<option value="정보">정보</option>
			</select>
				<label for="uid" id="fUid">룸번호</label> <input id="uid" type="text" title="아이디" name="room_no" value="<%=dto.getRoom_no()%>">
			
				<div class="block"></div>
				
				
				<label for="utitle" id="fUtitle"></label>
			<input id="utitle" type="text" name="qa_title" value="<%=dto.getQa_title() %>" style="width:300px;height:40px;font-size:20px" required><br>
			<input type="hidden" name="qa_no" value="<%= dto.getQa_no()%>"><br>
			

			<textarea   name="qa_content" rows="20" cols="120" style="font-size:15px"><%=dto.getQa_content() %></textarea><br>
			
				<span class="bt">
					<input id="login_bt" type="submit" style="width:100px;height:40px;">
				</span>
			
			</div>
			</form>
		
		
	




	</body>
	</html>