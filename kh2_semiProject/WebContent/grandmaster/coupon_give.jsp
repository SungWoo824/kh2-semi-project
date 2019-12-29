<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int member_no;
	if(request.getParameter("member_no")!=null){
		member_no = Integer.parseInt(request.getParameter("member_no"));
	}else{
		member_no=0;
	}
	request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수여</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
<script>
function number_check1(){
	
	//기본 전송을 막고
	event.preventDefault();
	
	//입력창을 불러오고
	var check1 = document.querySelector(".number_check1");
	var check2 = document.querySelector(".number_check2");
	
	//검사식을 만들고
	var memberCheck = /[0-9]+/g.test(check1.value);
	var couponCheck = /[0-9]+/g.test(check2.value);
	
// 	console.log(memberCheck, couponCheck, memberCheck && couponCheck);
	
	//만약에 회원번호가 아니라 회원아이디가 선택됐다면 memberCheck는 필요가 없다(true로 변경)
	var select = document.querySelector("select[name=type1]");
	if(select.value == "member_id"){
		memberCheck = true;	
	}
	
	if(memberCheck && couponCheck){
		var form = document.querySelector("form");
		form.submit();
	}
	else{
		window.alert("입력 형식이 잘못되었습니다.");
// 		if(memberCheck==true && couponCheck==false){
		if(memberCheck && !couponCheck){
			check2.value = '';
			check2.focus();
		}else{
			check1.value = '';
			check1.focus();
		}
	}
}
</script>
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color: #eaebec; 
		/*글자색을 바꾸고 싶다면*/
 		color:#666; 
 		text-align: center;
	}
	
	.select-selected::after{
		/* 화살표 색상을 바꾸고 싶다면 */
		border-top-color:#666;
	}
	.select-selected.select-arrow-active::after{
		border-bottom-color:#666;
	}
	
	.coupon-under-table{
		text-shadow: none;
	}
	
	.select-items{
		border-color:#eaebec;
	}
	body{
		height:100%;
		width: 100%;
		margin: 0;
		padding: 0;
		background-attachment:fixed;
		background-image:url("../image/master.jpg");
		background-repeat: no-repeat;
		background-size : cover;	
	}
	html{
		height:100%;
	}

	.container{
		width:100%;
		position:absolute;
		z-index:101;
	}
	*{
		box-sizing: border-box;
	}
	.wrap{
		min-height: 100%;
		position:relative;
		padding-bottom: -300px;
	}
	footer{
		position: absolute;
		bottom:0;
		
	}
</style>
</head>
<body>
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="wrap">
<div class="w-80">
<div class="row-big"></div>
<div class="row-big"></div>
<div class="row-big"></div>
<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
</div>
<div class="w-40">
<div align="center"><h2>쿠폰 수여</h2></div>
<%if(request.getParameter("error")!=null){ %>
<div align="center"><h4 style="color:#4F0101">입력값이 유효하지 않습니다</h4></div>
<%} %>
	<form onsubmit="number_check1();" action="<%=request.getContextPath() %>/grandmaster/coupongive.do" method="post">
		<table class="w-100 coupon-under-table">
		<%if(request.getParameter("member_no")==null){ %>
			<tr>
				<th>
					<select name="type1" class="select-icon custom-select" required>
						<option value="member_no">회원 번호</option>
						<option value="member_id">회원 아이디</option>
					</select>					
				</th>
				<td>
					<input type="text" name="keyword1" required class="number_check1">
				</td>
			</tr>
		<%}else{ %>
			<tr height="52">
				<th width="40%">
					<%String type1 = "member_no";%>회원 번호
				</th>
				<td>
					<input type="text" name="keyword1" value="<%=member_no %>" readonly>
				</td>
			</tr>
		<%} %>
			<tr height="52">
				<th>쿠폰 번호</th>
				<td>
					<input type="text" name="keyword2" required class="number_check2">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" class="input-button">
					<input type="submit" value="수여">
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
<div class="footer">
<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>