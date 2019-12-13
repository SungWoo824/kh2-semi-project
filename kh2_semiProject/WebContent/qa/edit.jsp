<%@page import="qa.been.QaDto"%>
<%@page import="qa.been.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String no1 = request.getParameter("no");
	int no = Integer.parseInt(no1);
	QaDao dao = new QaDao();
	QaDto dto = dao.get(no);
%>
<div>
<h1>글수정</h1>
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