<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<div align="center">
<% request.setCharacterEncoding("UTF-8");%>
<h1>글쓰기</h1>
		<form action="write.do" method="post" enctype="multipart/form-data">
		<%if(request.getParameter("superno")!=null){ %>
		<input type="hidden" name = "superno" value="<%=request.getParameter("superno")%>">
		<%} %>
			<select name="head" style="width:100px;height:40px;font-size:20px">
			<option value="공지">공지</option>	
			<option value="유머">유머</option>
			<option value="정보">정보</option>
			</select>
			<input type="text"  name="title" placeholder="제목을 입력하세요" style="width:300px;height:40px;font-size:20px" required><br>
			첨부파일 : <input type="hidden" name="writer" value="<%= session.getAttribute("id")%>">
			<input type="file" name="file" accept=".jpg, .png, .gif">
			<br>
			<textarea name="content"  rows="20" cols="120" style="font-size:15px"></textarea><br>
			<input type="submit" style="width:100px;height:40px;">
			</form>
	</div>