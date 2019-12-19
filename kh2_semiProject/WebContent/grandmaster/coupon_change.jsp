<%@page import="beans.CouponDto"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int coupon_no = Integer.parseInt(request.getParameter("coupon_no"));
	CouponDao dao = new CouponDao();
	CouponDto dto = dao.get(coupon_no);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
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
    	var check = document.querySelector(".number_check");
    	var regex = /[0-9]+/g;//검사식(정규표현식)
    	console.log(regex.test(check.value));
    	if(regex.test(check.value)==false){
    		window.alert("입력 형식이 잘못되었습니다.");
    		check.select();
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
</style>
</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>
<div class="w-50">
<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
<div align="center"><h2>쿠폰 수정</h2></div>
	
<form action="<%=request.getContextPath() %>/grandmaster/couponchange.do" method="post">
	
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
			<input class="number_check" type="text" name="coupon_rate" value="<%=dto.getCoupon_rate() %>" required>		
		</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td align="left" class="wrap">
			<input id="date" type="date" name="coupon_date" value="<%=dto.getCoupon_date().substring(0, 10) %>" required onblur="number_check();" onsubmit="number_check();">		
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
</div>
<div>footer</div>
</body>
</html>