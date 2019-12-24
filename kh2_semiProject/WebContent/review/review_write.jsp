<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<body>
	<form action="review_write.do" class="dropzone"  name="review_file" method="post" enctype="multipart/form-data">
		예약번호:<input type="text" name="reservation_no" required="required"><br>
		호텔번호:<input type="text" name="hostel_no" required="required"><br>
		리뷰내용:<input type="text" name="review_content" required="required"><br>
		별포이트:<input type="text" name="star_point" required="required"><br>
		<input type="file" class="dropzone" name="review_file" accept=".jpg, .png, .gif"><br>
	<input type="submit">
	</form>
</body>
</html>