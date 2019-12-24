<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<script>
    function prevent(){
        var tag = document.querySelector("textarea");
        var text = tag.value;
        var len = text.length;
        console.log(len);
        if(len > 85){
            text = text.substring(0, 85);
            tag.value = text;
        }
    }
    function number_check(){
    	event.preventDefault();
    	var check = document.querySelector(".number_check");
    	var regex = /[0-9]+/g;//검사식(정규표현식)
//     	console.log(regex.test(check.value));
    	var a = regex.test(check.value);
    	if(!a){
    		window.alert("입력 형식이 잘못되었습니다.");
			check.value = '';
    		check.focus();
    	}else{
    		var form = document.querySelector("form");
            form.submit();
    	}
    }
</script>
<style>
.explain textarea{
	width:99%;
	height:200px;
	resize:vertical;
	font-family:inherit;
	outline:none;
	border: 1px solid #fff;
	background-color:#fff;
}
	body{
		height: 1000px;
		width: 100%;
		margin: 0;
		padding: 0;
		background-repeat: no-repeat;
		background-size : cover;	
	}
	.background{
		height:1000px;	
		position:fixed;
		width:100%;
		z-index:100;
		background-size: 100%;
		min-height:1000px;
	}
	.background img{
		width:100%;
		height:1000px;
	}
	
	.container{
		width:100%;
		position:absolute;
		z-index:101;
	}
</style>
</head>
<body>
<div class="background">
	<img src="../image/master.jpg">
</div>
<section class="container">
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="w-80">
<div class="row-big"></div>
<div class="row-big"></div>
<div class="row-big"></div>
<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
</div>
<div class="w-50">
<div align="center"><h2>쿠폰 등록</h2></div>
<%if(request.getParameter("error")!=null){ %>
<div align="center"><h4 style="color:#4F0101">입력값이 유효하지 않습니다</h4></div>
<%} %>
	<form action="<%=request.getContextPath() %>/grandmaster/couponregist.do" method="post" onsubmit="number_check();">
		<table class="w-100 coupon-under-table">
			<tr>
				<th>쿠폰이름</th>
				<td>
					<input type="text" name="coupon_name" required>		
				</td>
			</tr>
			<tr>
				<th>할인율</th>
				<td>
					<input class="number_check" type="text" name="coupon_rate" required placeholder="(단위 : %)">		
				</td>
			</tr>
			<tr>
				<th>만료일</th>
				<td>
					<input id="date" type="date" name="coupon_date" required>		
				</td>
			</tr>
			<tr height="200px">
				<th>상세설명</th>
				<td class="explain">
					<textarea oninput="prevent();" name="coupon_explain" required placeholder="85자 입력제한"></textarea>		
				</td>
			</tr>
			<tr>
			<td colspan="2" align="right" class="input-button">
				<input type="submit" value="등록하기">
				<a href="coupon_itself.jsp">
					<input type="button" value="목록보기">
				</a>
			</td>
		</tr>
		</table>
	</form>
</div>
</section>
<div>footer</div>
</body>
</html>