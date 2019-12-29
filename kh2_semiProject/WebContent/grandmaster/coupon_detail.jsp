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
<title>쿠폰 상세보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
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
	.coupon-under-table{
		background-color: rgba( 255, 255, 255, 0.5 );
	}
	.coupon-under-table td{
		background-color: rgba( 255, 255, 255, 0.5 );
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
<div align="center"><h2>쿠폰 상세보기</h2></div>
	
<table class="w-100 coupon-under-table">
<tbody>
	<tr>
		<th>쿠폰번호</th>
		<td align="left">
			<%=dto.getCoupon_no() %>	
		</td>
	</tr>
	<tr>
		<th>쿠폰이름</th>
		<td align="left">
			<%=dto.getCoupon_name() %>	
		</td>
	</tr>
	<tr>
		<th>할인율</th>
		<td align="left">
			<%=dto.getCoupon_rate() %>	
		</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td align="left">
			<%=dto.getCoupon_date().substring(0, 10) %>	
		</td>
	</tr>
	<tr height="200px">
		<th>상세설명</th>
		<td class="explain" height="200px" valign="top" align="left">
			<%=dto.getCoupon_explain() %>	
		</td>
	</tr>
	<tr>
	<td colspan="2" align="right" class="input-button">
		<a id="a" href="coupon_change.jsp?coupon_no=<%=dto.getCoupon_no()%>">
			<input type="button" value="수정">
		</a>
		<a id="a" href="<%=request.getContextPath() %>/grandmaster/coupondelete.do?coupon_no=<%=dto.getCoupon_no()%>">
			<input type="button" value="삭제">
		</a>
		<a id="a" href="coupon_itself.jsp">
			<input type="button" value="목록">
		</a>
	</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="footer">
<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>