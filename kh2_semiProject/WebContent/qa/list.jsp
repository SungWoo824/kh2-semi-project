<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = "김운기";
	QaDao dao = new QaDao();
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno<=0)throw new Exception();
	}catch(Exception e){
		pno=1;
	}
	int pagesize = 10;
	int navsize = 10;
	int startBlock = (pno-1)/navsize*navsize+1;
	int finishBlock = startBlock+9;
	
	int finish = pno * pagesize;
	int start = finish -  (pagesize-1);


	List<QaDto> list = dao.list(start,finish);
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
<style>
@charset "UTF-8";

@font-face {
	font-family: cookieRun;
	src: url("../font/COOKIERUN BLACK.OTF")
}

@font-face {
	font-family: No;
	src: url("../font/NotoSansCJKkr-Medium.otf")
}

* {
	box-sizing: border-box;
	font-family: cookieRun;
}

.table {
	width: 100%;
	border: 1px solid black;
	/* 테두리 병합 */
	border-collapse: collapse;
}

.table>thead>tr>td, .table>thead>tr>th, .table>tbody>tr>td, .table>tbody>tr>th
	{
	border: 1px solid black;
	padding: 0.5rem;
}

.custom-list {
	list-style: none;
	margin: 0;
	padding: 0;
	display: inline-block;
	width: 150px;
}

.custom-list>li {
	background-color: black;
	color: white;
	padding: 15px;
	cursor: pointer;
}

.custom-list li:hover {
	background-color: gray;
	color: black;
}

/* 2차 이상의 메뉴 스타일 */
.custom-list ul {
	list-style: none;
	padding: 0;
	margin: 0;
	position: absolute;
	margin-left: 135px;
	margin-top: -36px;
	/* 2차 이상의 메뉴는 처음에 숨김 처리 */
	display: none;
}

.custom-list ul>li {
	background-color: black;
	color: white;
	padding: 15px;
	width: 150px;
}

.custom-list li:hover>ul {
	display: block;
}

.custom-list li {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

article {
	margin: auto;
}

.row {
	text-align: center;
}

.row, .row-left, .row-right, .row-title, row-multi {
	margin: 10px 0px;
}

.row-title {
	font-size: 2rem;
	margin-bottom: 2rem;
	text-align: center;
}

.row-left {
	text-align: left;
}

.row-right {
	text-align: right;
}

.page-navigator {
	list-style: none;
	margin: 0;
	padding: 0;
	color: black;
	display: inline-block;
}

.page-navigator::after {
	content: "";
	display: block;
	clear: both;
}

.page-navigator>li {
	float: left;
	background-color: white;
	padding: 0.7rem;
	font-size: 2rem;
}

.page-navigator>li.active {
	background-color: black;
}

.page-navigator>li>a {
	text-decoration: none;
}

.page-navigator>li:hover {
	background-color: gray;
}

.title {
	background: rgb(34, 193, 195);
	background: linear-gradient(0deg, rgba(34, 193, 195, 1) 0%,
		rgba(253, 187, 45, 1) 100%);
	color: white;
	text-align: left
}
}
</style>
<body>
<article >
<div class="row-title"><a href="list.jsp">리스트 목록</a></div>
<div class="row">
<%
	if (true) {
%>
	<table class="table">
	<tr>
		<th>번호</th>
		<th>방번호</th>
		<th>말머리 </th>
		<th width="45%">제목</th>
		<th>작정자 </th>
		<th>작성일 </th>
		</tr>
	<%
		for (QaDto dto : list) {
	%>
	<tr>
		<td><%=dto.getQa_no()%></td><!-- member get으로 아이디를 가져와야함 -->
		<td><%=dto.getRoom_no()%></td><!-- room_info get으로 방이름을 가져와야함 -->
		<td><%=dto.getQa_head() %></td>
		<td align="left"><a href="content.jsp?pno=&no=<%= dto.getQa_no() %>" ><%=dto.getQa_title() %></a></td>
		<td><%=dto.getMember_no() %></td>
		<td><%=dto.getQa_wdate() %></td>
	</tr>
	<%} %>

		<%} %>

</table>
</div>
<div align="right">
<a href="write.jsp">글쓰기</a>	
</div>
</article>
	<ul class="page-navigator">
	<%if(startBlock>1){ %>
		<%if(isSearch){ %>
	<li><a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=startBlock-1%>">[이전]</a></li>
	<%}else{ %>
		<li><a href="list.jsp?pno="<%=startBlock-1 %>>[이전]</a></li>
		<%} %>
	<%} %>
	<%for(int i = startBlock;i<finishBlock+1;i++){ %>
		 	<%if(pno==i){ %>
	 		<li><%=i %></li>
	 	<%}else{ %>
	 	<%if(isSearch){ %>
	 		<li><a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=i%>"><%=i %></a></li>
	 		<%}else{ %>
	 		<li> <a href="list.jsp?pno=<%=i %>" ><%=i %></a></li>
	 		 <%} %>
	 <%} %>
	 <%} %>
	  <%if(pagecount>finishBlock){ %>
	  <%if(isSearch){ %>
	 <li>	<a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=finishBlock+1%>">[다음]</a></li>
	 <%}else{ %>
	  	 <li><a href="list.jsp?pno=<%=finishBlock+1 %>">[다음]</a> </li>
	  	 <%} %>
	  	 <%} %>
	  	 </ul>

<form action="list.jsp">
	<select name ="type">
		<option value="qa_title">제목</option>
		<option value="member_id">아이디</option>
		<option value="member_name">닉네임</option>
	</select>
	<input type="search" name = "keyword">
	<input type="submit">
</form>
</body>