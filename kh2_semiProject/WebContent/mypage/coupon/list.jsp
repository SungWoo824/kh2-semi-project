<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//아이디로 내쿠폰 확인
String id =(String)session.getAttribute("id");
	
System.out.println(id);


MemberDao mdao = new  MemberDao();
MemberDto mdto=mdao.get(id);
 
int member_no  =  mdto.getNo();
	
CouponDao cdao = new CouponDao();
List<CouponDto> list=  cdao.id_search(member_no);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 검색 및 관리</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">


</head>
<body>
<div>header</div>
<div>menu</div>
<div><br></div>
<div><br></div>
<div><br></div>


 <div class="master-title w-100"><h2>마이쿠폰</h2></div>
    <table class="w-100 hostel-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>할인율</th>
				<th>유효기간</th>
				<th>쿠폰설명</th>
				
				
			</tr>
		</thead>
		<tbody>
			<%for(CouponDto dto:list){ %>
			<tr>
			
				<th><%=dto.getCoupon_no()%></th>
				<th><%=dto.getCoupon_name()%></th>
				<th><%=dto.getCoupon_rate()%> </th>
				<th><%=dto.getCoupon_date()%></th>
				<th><%=dto.getCoupon_explain()%></th>
				
				
				
				
			</tr>
			<%} %>
		</tbody>
	</table>

<div>footer</div>
</body>
</html>