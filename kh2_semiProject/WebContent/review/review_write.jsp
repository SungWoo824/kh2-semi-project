<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#foo	').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <style>
    	.dropzone{
    	position: relative;
    	top:100px;
    	left:100px;
    	width: 310px;
    	height: 250px;
    	border: 0px;
    	opacity: 0.1;
    	z-index: 1;
    	}
    	input{
    	}
    	img{
    	position: absolute;
    	top:205px;
    	left:160px;
    	width:300px;
    	height:250px;
    	}
    </style>	
</head>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<body>
	<form action="review_write.do" method="post" enctype="multipart/form-data">
		예약번호:<input type="text" name="reservation_no" required="required"><br>
		호텔번호:<input type="text" name="hostel_no" required="required"><br>
		리뷰내용:<input type="text" name="review_content" required="required"><br>
		별포이트:<input type="text" name="star_point" required="required"><br>
		<input type="submit">
 		<input type="file" name="review_file" class="dropzone" id="imgInp" accept=".jpg, .png, .gif"><br> 
		 <img id="foo"src="#">
	</form>
</body>
</html>