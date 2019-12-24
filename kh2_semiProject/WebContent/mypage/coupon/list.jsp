<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.CouponDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



int pagesize = 10;
int navsize = 10;
int pno;
try{
	pno = Integer.parseInt(request.getParameter("pno"));
	if(pno <= 0) throw new Exception();
}
catch(Exception e){
	pno = 1;
}
int finish = pno * pagesize;
int start = finish - (pagesize - 1);

String context = request.getContextPath();
CouponDao cdao = new CouponDao();
MemberDao mdao = new MemberDao();
String id = (String)session.getAttribute("id");
MemberDto mdto =  mdao.get(id);
int member_no=   mdto.getNo();

	List<CouponDto> list =cdao.id_search(member_no, start, finish);
	
	
int count=cdao.Count(member_no);
	
int pagecount = count / pagesize;
if(count%pagesize!=0){
	pagecount+=1;
}


int startBlock = (pno - 1) / navsize * navsize + 1;
int finishBlock = startBlock + (navsize - 1);


if(finishBlock > pagecount){
	finishBlock = pagecount;
}
























	



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 검색 및 관리</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">


</head>
<body>


	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>


 <div class="master-title w-100"><h2>마이쿠폰</h2></div>
    <table class="w-100 hostel-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>할인율</th>
				<th>유효기간</th>
				<th>쿠폰설명</th>
				<th></th>
				
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
				<th><input type="submit" value="쿠폰사용하기"></th>
				
				
				
			</tr>
			<%} %>
		</tbody>
	</table>
<h4 class="navigator" >
			<%if(startBlock > 1){ %>
				
					<a href="list.jsp?pno=<%=startBlock - 1%>">이전</a>
				
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					
						<a href="list.jsp?pno=<%=i%>"><%=i%></a>
				
				<%} %>
			<%} %>
	
			<%if(finishBlock < pagecount){ %>
			
			
					<a href="list.jsp?pno=<%=finishBlock + 1%>">다음</a>
			
			<%} %>
		</h4>
</body>
</html>