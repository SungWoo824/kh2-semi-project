<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//아이디로 내가 쓴 보드 글 찾기

String id = (String)session.getAttribute("id");
	QaDao dao = new QaDao();
	List<QaDto> list = dao.id_search(id);


	
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno<=0)throw new Exception();
	}catch(Exception e){
		pno=1;
	}
	int list_width;
	try{
		list_width=Integer.parseInt(request.getParameter("list_width"));
	}catch(Exception e){
		list_width=3;
	}
	int list_count;
	try{
		list_count=Integer.parseInt(request.getParameter("list_count"));
	}catch(Exception e){
		list_count=list_width*5;
	}
	int pagesize = 10;
	int navsize = 10;
	int startBlock = (pno-1)/navsize*navsize+1;
	int finishBlock = startBlock+9;
	
	int finish = pno * pagesize;
	int start = finish -  (pagesize-1);


	
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	int count = dao.getCount(type,keyword);
	int pagecount = (count+pagesize)/pagesize;
	
	boolean isSearch = type!=null && keyword!=null;
	if(isSearch){
		list = dao.search(type, keyword,start,finish);
	}
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
%>
<html>
<head>
<style>

</style>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

</head>

<body>
<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>

<div class="master-title w-100"><h2>내가 쓴 글</h2></div>



	<table class="w-100 hostel-table">
	<thead>
	<tr>
		<th>번호</th>
		<th>방번호</th>
		<th>말머리 </th>
		<th width="45%">제목</th>
		<th>작성자 </th>
		<th>작성일 </th>
		</tr>
		</thead>
		<tbody>
	<%for (QaDto dto : list) {%>
	<tr>
		<td><%=dto.getQa_no()%></td><!-- member get으로 아이디를 가져와야함 -->
		<td><%=dto.getRoom_no()%></td><!-- room_info get으로 방이름을 가져와야함 -->
		<td><%=dto.getQa_head() %></td>
		<td align="left"><a href="content.jsp?pno=&no=<%= dto.getQa_no() %>" ><%=dto.getQa_title() %></a></td>
		<td><%=dto.getMember_no() %></td>
		<td><%=dto.getQa_wdate() %></td>
	</tr>
	<% } %>
</tbody>
</table>





</body>
</html>