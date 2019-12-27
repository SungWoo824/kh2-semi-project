<%@page import="beans.CouponDto"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int coupon_no = Integer.parseInt(request.getParameter("coupon_no"));
	CouponDao dao = new CouponDao();
	CouponDto dto = dao.get(coupon_no);
	
	request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
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
<div class="w-50">
<div align="center"><h2>쿠폰 수정</h2></div>
<%if(request.getParameter("error")!=null){ %>
<div align="center"><h4 style="color:#4F0101">입력값이 유효하지 않습니다</h4></div>
<%} %>	
<form onsubmit="number_check();" action="<%=request.getContextPath() %>/grandmaster/couponchange.do" method="post">
	
<input type="hidden" name="coupon_no" value="<%=dto.getCoupon_no() %>">
	
<table class="w-100 coupon-under-table">
<tbody>
	<tr>
		<th>쿠폰이름</th>
		<td align="left">
			<input type="text" name="coupon_name" value="<%=dto.getCoupon_name() %>" required>		
		</td>
	</tr>
	<tr>
		<th>할인율</th>
		<td align="left">
			<input class="number_check" type="text" name="coupon_rate" value="<%=dto.getCoupon_rate() %>" required placeholder="(단위 : %)">		
		</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td align="left" class="wrap">
			<input id="date" type="date" name="coupon_date" value="<%=dto.getCoupon_date().substring(0, 10) %>" required>		
		</td>
	</tr>
	<tr height="200px">
		<th>상세설명</th>
		<td class="explain">
			<textarea oninput="prevent();" name="coupon_explain" required placeholder="85자 입력제한"><%=dto.getCoupon_explain() %></textarea>		
		</td>
	</tr>
	<tr>
	<td colspan="2" align="right" class="input-button">
		<input type="submit" value="수정하기">
		<a href="coupon_itself.jsp">
			<input type="button" value="목록보기">
		</a>
	</td>
</tr>
</tbody>
</table>
</form>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>