<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
	//회원 정보를 불러오는 코드
	//1. session에서 id에 들어있는 데이터를 꺼낸다
	//2. id를 주고 dao를 이용하여 회원정보(MemberDto)를 꺼낸다
	//3. 원하는 위치에 출력한다.
	
	String id = (String)session.getAttribute("id");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.get(id);


	String error = request.getParameter("error");

%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
 <style type="text/css">
    *{
		font-family: binggrae;
	}
		
body, h1,h2,h3,#wrap, #loginbox, input,label {margin:0 auto; padding:0; border:0}
body {background-color:#efefef; color:#333; font-size:0.8em; font-family:"돋음",dotum,"굴림",gulim,'Apple SD Gothic Neo',Helvetica,sans-serif}

.backBody{
	height: 800px;
	padding-top:40px;
	background-image: url("../image/mypage1.jpg"); background-position:center; background-repeat: no-repeat; 
  min-height: 90vh;
}

@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
	
h1 {
	margin-top: 100px;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px
}

h2 {
	padding-bottom: 20px;
	text-align: center;
	font-size: 13px;
	font-weight: normal;
	line-height: 120%;
	letter-spacing: -1px;
	color: #666;
}

h3 {
	text-align: center;
	padding: 10px 0 10px 0;
	margin-bottom: 10px;
	font-size: 14px;
	letter-spacing: -1px;
	border-bottom: 1px solid #ccc;
}

#wrap {
	width: 360px;
	border: 1px solid #ddd;
	background-color: #fff;
	padding: 15px;
	margin-bottom:10px;
	height: 550px;
	overflow: hidden
padding-bottom: 8rem;
}

#loginbox {
	width: 300px;
	padding: 5px;
	margin:50p;
}

input#uid, input#upass ,input#newupass,input#uname,input#uphone,input#uemail{
	width: 220px;
	margin: 0;
	height: 25px;
	line-height: 25px;
	background-color: #efefef
}

label#fUid, label#fUpass ,label#fUnewpass,label#fUname,label#fUphone,#fUemail{
	width: 60px;
	margin: 0;
	padding-top: 5px;
	display: inline-block;
	vertical-align: top
}

.bt {
	display: inline-block;
/* 	border: 1px solid #ccc */
}

.bt1 {
	display: inline-block;
	width: 140px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

.bt2 {
	display: inline-block;
	width: 285px;
	padding: 5px;
	margin-top: 10px;
	text-align: center;
	font-size: 0.85em;
	background-color: #efefef
}

#loginbox hr {
	color: #ddd;
	height: 1px;
	background-color: #5B6D5E;
}

#login_bt ,#member_bt{
	width: 285px;
	height: 35px;
	background-color: #5B6D5E;
	font-weight: bold;
	color: #fff;
}

.block {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 0;
}

a {
	text-decoration: none;
	color: #333;
}
    
        	footer{
		background-color: #f6f6f6;
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	bottom:0;
	
	width: 100%;
	height: 8rem;
	}
      
    </style>
   
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

   
</head>
<body>

<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>

	<div class="backBody">
		<h1>회원정보수정</h1>
		
		<div id="wrap">
			 <form action="info.do" method="post">
			<div id="loginbox">
			
				<label for="uid" id="fUid">아이디</label> 
				<h3 id="uid" type="text" title="아이디" name="member_id" placeholder="ID"><%=dto.getId() %></h3>
		

				<div class="block"></div>
				<label for="upass" id="fUpass">현재 암호</label> <input id="upass" title="암호" type="password" name="member_pw" placeholder="Password" required="required">
         
				
				<div class="block"></div>
				<label for="newupass" id="fUnewpass">새 암호</label> <input id="newupass" title="암호" type="password" name="newpw" placeholder="NewPassword" required="required">
				
				
				<div class="block"></div>
				<label for="uname" id="fUname">이름</label> 
				<h3 id="uname" type="text" title="이름" name="member_name" placeholder="Name"><%=dto.getName() %></h3>
		
				
    <div class="block"></div>
				<label for="uphone" id="fUphone">전화번호</label> <input id="uphone" title="암호" type="text" name="member_phone" value="<%=dto.getPhone()%>">
         
				
				  <div class="block"></div>
				<label for="uemail" id="fUemail">이메일</label> <input id="uemail" title="암호" type="text" name="member_email" value="<%=dto.getEmail()%>">
         
		
 <div class="block"></div>
 <label for="ubirthday" id="fUbirthday">생일</label>
                <% if(dto.getBirthday()==null) {%>
                
<input id="ubirthday" title="생일" type="date" name="member_birthday" >
                  <%} else{%>
         	<h3 ><%=dto.getBirthday().substring(0, 10) %></h3>
         
         	<input id="ubirthday" title="생일" type="hidden" name="member_birthday"  value="<%=dto.getBirthday().substring(0, 10)%>">            
                  <%} %>
           

     


				
				<div class="block"></div>
			
					<input id="login_bt" type="submit" value="회원정보수정">
				<div class="block"></div>
				<input id="member_bt" type="button" value="회원탈퇴">
			</div>
			</form>
		</div>
		<%if(error != null){%>
			<font color="red"><h3>비밀번호가 일치하지 않습니다.</h3></font>
		<%} %>
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           



  


</body>
</html>