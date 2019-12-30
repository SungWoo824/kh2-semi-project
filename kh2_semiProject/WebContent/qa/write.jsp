<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8");%>
<%
	int room_no;
	if(request.getParameter("room_no")!=null){
		room_no = Integer.parseInt(request.getParameter("room_no"));
	}else{
		room_no=0;
	}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">


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
		background-image: url("../image/write1.jpg");
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
		/* text-decoration: underline; */
	}
	
	.text>.menu-item{
		text-align: center;
		margin: 0px;
		font-family: binggrae;
		border: 1px;
		resize: none;
	}
	#login_bt {
	width: 285px;
	height: 35px;
	background-color: #000;
	font-weight: bold;
	color: #fff;
}

</style>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">		
</head>
<body>


<jsp:include page="../template/nav.jsp" ></jsp:include>
	<form action="qa_write.do" method="post" >
	<div class="write" align="center">	
  		
		<h1 class="board">Q&A BOARD</h1>
		<div class="write1">
		<%if(request.getParameter("room_no")!=null){ %>
			<input class="menu-item" type="text" name="room_no" value="<%=room_no%>" readonly><!--룸정보를 옵션으로 만듦  -->
		<%}else{ %>
			<input class="menu-item" type="text" name="room_no" placeholder="방 번호"><!--룸정보를 옵션으로 만듦  -->
		<% }%>
			<select class="menu-item" name="qa_head">
				<option value="">선택하세요</option>
				<option value="입금 관련">입금관련</option>	
				<option value="예약 확인">예약확인</option>
				<option value="예약일 변경">예약일 변경</option>
				<option value="기타문의">기타문의</option>
		<input class="menu-item" type="text"  name="qa_title"  placeholder="제목을 입력하세요" required>
			</select>		
		</div>
		<div class="text">
		<img src="<%=request.getContextPath() %>/image/캡처.jpg" style="width: 881px;">
			<textarea class="menu-item" name="qa_content"  rows="20" cols="90"></textarea>
			
			<div class="block"></div>
		<input id="login_bt" type="submit" value="등록">
		</div>	
	</div>
	</form>
			
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>