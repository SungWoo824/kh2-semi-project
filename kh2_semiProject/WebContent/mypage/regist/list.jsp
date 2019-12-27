<%@page import="beans.HostelDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.HostelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pagesize = 4;
int navsize = 4;
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
HostelDao hdao = new HostelDao();
MemberDao mdao = new MemberDao();

String id = (String)session.getAttribute("id");

MemberDto mdto = mdao.get(id);

int member_no = mdto.getNo();

List<HostelDto> list = hdao.registHostellist(member_no, start, finish);
	
int owner_no = mdto.getNo();	
int count = hdao.Count(owner_no);
	
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<title>Insert title here</title>
<style type="text/css">

* {
	font-family: binggrae;
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
	background-color: #efefef;
	color: #333;
	font-size: 1.2em;
	font-family: "돋음", dotum, "굴림", gulim, 'Apple SD Gothic Neo', Helvetica,
		sans-serif
}

#listhostel{
	height: 1100px;
	margin-top: 130px; 
	margin-left: 140px;
}

</style>

</head>
<body>
<div>
<jsp:include page="/template/nav.jsp"></jsp:include>
</div>
<div align="left" id="listhostel">
	<table>
		
		<tbody>
		<div id="hostel">
		<%if(count==0){ %>
			<tr>
			
				<td rowspan="4">쿠폰내역이 없습니다.</td>
				
				
			</tr>
			<%} else{%>
					
			<%for(HostelDto hdto:list){ %>
			<tr>
				<td rowspan="3"><img src="http://placehold.it/280x230"></td>
				<td> 숙소 이름 </td>
				<td><%=hdto.getHostel_name()%></td>			
			</tr>
			<tr>
				<td> 숙소 주소</td>
				<td><%=hdto.getHostel_detail_addr()%></td>
			</tr>
			<tr>
				<td> 숙소 전화번호</td>
				<td><%=hdto.getHostel_phone()%> </td>
			</tr>	
				
			<%} %>
			<%} %>
		</div>
		</tbody>
	</table>
	
	<h4 class="navigator">
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
</div>	
<div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</div>
           
</body>
</html>