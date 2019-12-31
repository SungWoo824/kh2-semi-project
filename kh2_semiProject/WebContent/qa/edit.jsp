<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
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
	

	MemberDao mdao = new MemberDao();
	
	
	MemberDto mdto=    mdao.memberInfomation(dto.getMember_no());
	String context = request.getContextPath();
%>




<style>
* {
	font-family: binggrae;
	align-content: center;
}
.w-100 master-menu{
	background-color: #efefef;
}
body, h1, h2, h3, #wrap, #loginbox, input, label {
	margin: 0 auto;
	padding: 0;
	border: 0
}

body {
	background-color: #FFFFFF;
	color: #333;
	font-size: 1.0em;
	font-family: "돋음", dotum, "굴림", gulim, 'Apple SD Gothic Neo', Helvetica,
		sans-serif
}

.backBody {
	width: 100%;
	height: 1100px;
	padding-top: 80px;
 	background-image: url("");
 	background-size: 1685px;
 	background-color: #77;
	background-position: center;
	background-repeat: no-repeat;
}

@font-face {
	font-family: binggrae;
	src: url("../font/NotoSansCJKkr-Medium.otf");
}







p{
	margin: 150px opx;
}
#hostelbox1 {
	width: 95%;
	height: 700px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
	align-content: center;
}
#kind {
	border-bottom: 1px solid #565960 ;
    padding: 5px;
    padding-left: 0.5rem;
    padding-right: 2rem;
  	margin: 10PX;
	font-size: 20px;
	width: 320px;
	outline: #565960; 
        }
#hostelbox1 input[type=text] {
	outline: #565960; 
	font-size: 1rem;
	border-bottom: 1px solid #565960 ;
	width: 400px;
	height: 3rem;
	padding: 10px;
	

}
#hostelbox1>#postcode {
	width: 200px;
}
#hostelbox1>#address {
	width: 381px;
}
#hostelbox1>#detailAddress {
	width: 230px;
	margin: 5px 0px;
}

#hostelbox1>#extraAddress {
	width: 144px;
}

#hostelbox2 {
	width: 900px;
	height: 1000px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
}
a {
	text-decoration: none;
	color: #333;
}

.btn {
	border: 1px;
	font-size: 20px;
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-right: 160px;
	padding: 6px 8px 10px 10px;;
	background-color: #565960;
	height: 40px;
	width: 80px;
}

.btn:hover {
	background-color: #EFEFEF;
	color: #565960;
	cursor: pointer;
}
.btn-1 {
	display: inline-block;
	border: 1px;
	font-size: 15px;
	margin: 5px auto;
	padding: 5px 10px;
	background-color: #565960;
	height: 40px;
	width: 120px;
	
}


h1 {
	margin-top: 100px;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px
}
	
	

h3 {
	text-align: center;
	padding: 10px 0 10px 0;
	margin-bottom: 10px;
	font-size: 14px;
	letter-spacing: -1px;
	border-bottom: 1px solid #ccc;
}
	
	
	
	.row-big{

height: 0.1px;
}
	
	
	
	
		
	#wrap {
	
	border: 1px solid #D4CCD4;
	background-color: #fff;
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden;
     border-top-right-radius : 5%; 
 	border-bottom-left-radius: 5%;
 	border-bottom-right-radius: 5%;
 	border-top-left-radius: 5%;
 	min-height: 110vh;
 	width: 100%;
 	text-align: center;
 	
}
	
	
	
	
	.w-50{
	padding-bottom: 5rem;
	text-align: center;
	align-content: center;
		
	}
	
	
		footer{
		background-color: #f6f6f6;
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	bottom:0;
	
	width: 100%;
	height: 8rem;
	}
	
	
	
	.menu-item{
	
	border: 1px solid #D4CCD4;
	padding: 10;
	
	}
	
	
	.title-item{
	border: 1px solid #ddd;
	}
	
	
	
	* {
	font-family: binggrae;
}
@font-face {
	font-family: binggrae;
	src: url("../font/NotoSansCJKkr-Medium.otf");
}
	
	
	.text-item{
	padding: 1rem;
	
	}
	
	
	
	#login_bt {
	width: 100px;
	height: 35px;
	background-color: #666666;
	font-weight: bold;
	color: #fff;
}
	
	
	.container{
		width:100%;
		position:;
		z-index:101;
		height: 100%;
	padding-top:40px;
	
	 background-image: url("<%=context %>/image/mypage6.jpg"); background-position:center; background-repeat: no-repeat; 
	}
	
	.w-80 coupon-under-table{
	 text-align:center;
	width: 60%;
	}
</style>
</head>
<body>

















			
<section class="container">
					<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>

	<div class="row-big"></div>
	<div class="row-big"></div>
	
	
		<jsp:include page="/template/nav.jsp"></jsp:include>

<form action="qa_edit.do" method="post" >




<div class="w-50" align="center">
	
<div align="center"><h2 class="master-title w-100">Q&A 수정</h2></div>

			<table class="w-80 coupon-under-table" id="wrap" >
	<thead>
		<tr class="title-item" >
			<th width="150px">&nbsp;제목</th>
			<td><input class="title-item" type="text"  name="qa_title"  placeholder="제목을 입력하세요" required value="<%=dto.getQa_title()%>"></td>
		</tr>
		<tr>
			<th>&nbsp;방번호</th>
			<td><input class="menu-item" type="text" name="room_no" value="<%=dto.getRoom_no()%>"  readonly="readonly"></td>
		
	<td>	<input type="hidden" name="qa_no" value="<%= dto.getQa_no()%>"></td>
		</tr>
		<tr>
			<th>&nbsp;글쓴이</th>
		<td><input class="menu-item" type="text" name="room_no" value="<%=mdto.getName()%>"  readonly="readonly"></td>
		</tr>
		<tr height="200">
			<td valign="top" colspan="2"><textarea class="text-item" name="qa_content"  rows="20" cols="90" ><%=dto.getQa_content() %></textarea> </td>
		</tr>
	</thead>
	
</table>

<span class="bt">
		<input id="login_bt" type="submit" value="수정">
				
				</span>
		</div>

	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</form>
</section>
	


	</body>
	</html>