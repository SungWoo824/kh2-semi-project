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





</head>
<body>
<section class="container">
<div class="w-80">

		<form action="edit.do" method="post" >
			<input type="text" name="room_no" value="<%=dto.getRoom_no()%>">
				<select name="qa_head" style="width:100px;height:40px;font-size:20px">
			<option value="공지">공지</option>	
			<option value="유머">유머</option>
			<option value="정보">정보</option>
			</select>
			<input type="text" name="qa_title" value="<%=dto.getQa_title() %>" style="width:300px;height:40px;font-size:20px" required><br>
			<input type="hidden" name="qa_no" value="<%= dto.getQa_no()%>"><br>
			<textarea name="qa_content" rows="20" cols="120" style="font-size:15px"><%=dto.getQa_content() %></textarea><br>
			<input type="submit" style="width:100px;height:40px;">
			</form>
	</div>
	</section>
	</body>
	</html>