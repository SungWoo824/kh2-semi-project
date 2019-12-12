<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<div align="center">
<% request.setCharacterEncoding("UTF-8");%>
<h1>글쓰기</h1>
		<form action="write.do" method="post" >
		<input type="text" name="room_no" placeholder="room_no">
			<select name="qa_head" style="width:100px;height:40px;font-size:20px">
			<option value="공지">공지</option>	
			<option value="유머">유머</option>
			<option value="정보">정보</option>
			</select>
			<input type="text"  name="qa_title" placeholder="제목을 입력하세요" style="width:300px;height:40px;font-size:20px" required>
			<textarea name="qa_content"  rows="20" cols="120" style="font-size:15px"></textarea><br>
			<input type="submit" style="width:100px;height:40px;">
			</form>
	</div>