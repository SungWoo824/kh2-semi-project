<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<style type="text/css">
	@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
	* {
		box-sizing: border-box;
		font-family: binggrae;
		border-collapse: collapse;
	}

	.write{
		background-image: url("../image/write.jpg");
		height: 1000px;
		width: 100%;
		margin: auto;
		padding: 140px;
		background-repeat: no-repeat;
		background-size: 98% 100%;
		font-family: binggrae;
		
	}
	.menu-item{
		text-align: center;
		margin-bottom: 20px;
		background-color: rgba( 255, 255, 255, 0.8 );
		font-size: 18px;
		font-family: binggrae;
	}
	.write1{
		text-align: center;
		border-color: aqua;
		font-family: binggrae;
	}
		
	.board{
		text-decoration: underline;
	}
	
	.text>.menu-item{
		text-align: center;
		margin: 0px;
		font-family: binggrae;
		border: 1px;
	
	}

</style>			
</head>
<body>
	<form action="write.do" method="post" >
	<div class="write" align="center">	
  		
		<h1 class="board">Q&A B O A R D</h1>
		<div class="write1">
		<input class="menu-item" type="text" name="room_no" placeholder="방 번호"><!--룸정보를 옵션으로 만듦  -->
			<select class="menu-item" name="qa_head">
				<option value="">선택하세요</option>
				<option value="입금 관련">입금 관련</option>	
				<option value="예약 확인">예약 확인</option>
				<option value="예약일 변경">예약일 변경</option>
				<option value="기타문의">기타문의</option>
		<input class="menu-item" type="text"  name="qa_title"  placeholder="제목을 입력하세요" required>
			</select>		
		</div>
		<div class="text">
			<textarea class="menu-item" name="qa_content"  rows="20" cols="120"></textarea>
		<input class="menu-item" type="submit" value="글쓰기">
		</div>	
	</div>		
	</form>
</body>
</html>