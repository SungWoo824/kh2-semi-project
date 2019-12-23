<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="review_write.do" method="post" enctype="multipart/form-data">
		예약번호:<input type="text" name="reservation_no"><br>
		호텔번호:<input type="text" name="hostel_no"><br>
		리뷰내용:<input type="text" name="review_content"><br>
		별포이트:<input type="text" name="star_point"><br>
		<input type="file" name="review_file" accept=".jpg, .png, .gif"><br>
	<input type="submit">
	</form>
</body>
</html>