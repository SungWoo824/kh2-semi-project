<%@page import="beans.QaReplyDto"%>
<%@page import="beans.QaReplyDao"%>
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
	int list_count;
	try{
		list_count=Integer.parseInt(request.getParameter("list_count"));
	}catch(Exception e){
		list_count=15;
	}
	int pagesize = list_count;
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
	QaReplyDao Rdao = new QaReplyDao();

%>
<html>
<head>
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
	margin: auto;
	font-family: No;
}
body{
/*  background-image: url("../image/qa1.jpg"); */
 margin: auto;
}
.nav-container {
  padding: 0;
  height: 70px;
  /* border: 1px solid black; */
}

.nav-menu {
  width: 100%;
  top: 0px;
  left: 0;
  position: fixed;
  font-size: 15px;
  padding-bottom: 10px;
  height: 70px;
  background-color: rgba(229, 231, 235, 0.3);
  margin: 0;
  /* border: 1px solid black; */
}

.top-bar > .top-bar__logo {
  float: left;
  margin-left: 150px;
  margin-top: 10px;
}

.top-bar__logo > .logo-box {
  width: 100px;
  text-decoration: none;
  color: black;
}

.top-bar > .top-bar__menu {
  float: right;
  margin-right: 200px;
}

.top-bar > .top-bar__menu > ul > li {
  list-style-type: none;
  float: left;
  margin: 10px 30px;
}
.top-bar > .top-bar__menu > ul > li > a {
  text-decoration: none;
  color: black;
}

.top-bar > .top-bar__menu > ul > li > a:hover {
  background-color: red;
}

.table {
	width: 100%;
	/* 테두리 병합 */
}

.table>thead>tr>th, .table>thead>tr>td, .table>tbody>tr>th, .table>tbody>tr>td
	{
	border-bottom: 0.5px solid gray;
	padding: 0.5rem;
}
.table>thead>tr>th{
	background-color: gray;
}
article {
	margin: auto;
}

.row {
	width:100%;
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
a{
	text-decoration: none; color:#000000}
}
.search{
	width: 80%;
}
.search select,
.search option{
	width: 3rem;
	height: 2rem;
}
.search>input[type=submit] {
	width: 3rem;
	height: 2rem;
}
.search>input[name=keyword] {
	width: 20rem;
	height: 2rem;
}
</style>
</head>

<body style="width: 80%;">
<article>
<div class="row-title"><a href="list.jsp">리스트 목록</a></div>
<form action="list.jsp">
	<div>페이지 높이</div>
		<select name ="list_count">
		<option><%=15%></option>
		<option><%=30%></option>
		<option><%=45%></option>
		<option><%=60%></option>
	</select>
	<input type="submit" value="입력">
</form>
<div class="row">
<div align="right">
	<form action="list2.jsp">
	<input type="submit" value="&clubs;">
	</form>
	</div>
	<table class="table">
	<thead>
	<tr>
		<th>번호</th>
		<th>방번호</th>
		<th>말머리 </th>
		<th width="45%">제목</th>
		<th>작정자 </th>
		<th>작성일 </th>
		</tr>
		</thead>
	<%
		for (QaDto dto : list) {
	%>
	<tbody>
	<tr>
		<td><%=dto.getRn()%></td><!-- member get으로 아이디를 가져와야함 -->
		<td><%=dto.getRoom_no()%></td><!-- room_info get으로 방이름을 가져와야함 -->
		<td><%=dto.getQa_head() %></td>
		<td align="left"><a href="content.jsp?pno=&no=<%= dto.getQa_no() %>" ><%=dto.getQa_title() %></a></td>
		<td><%=dto.getMember_name() %></td>
		<td><%=dto.getQa_wdate() %></td>
	</tr>
<%-- 	<%	List<QaReplyDto> Rlist = Rdao.select(dto.getQa_no()); %>
	<%int i = 1; %>
	<%for(QaReplyDto Rdto: Rlist){ %><!-- 리플 미리보기 -->
		<tr>
			<td>&nbsp; </td>
			<td>&nbsp; </td>
			<td>&nbsp; </td>
			<td align="left">
			<%for(int j=0;j<i;j++){ %>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<%} %>
			ㄴ<%=Rdto.getQa_reply_content() %>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<%i++; %>
		</tr>
	<%} %> --%>
	<%} %>
</tbody>
</table>

<div align="right">
<a href="write.jsp">글쓰기</a>	
<div align="center">
	<ul class="page-navigator">
	<%if(startBlock>1){ %>
		<%if(isSearch){ %>
	<li><a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=startBlock-1%>&list_count=<%=list_count%>">[이전]</a></li>
	<%}else{ %>
		<li><a href="list.jsp?pno=<%=startBlock-1 %>&list_count=<%=list_count%>">[이전]</a></li>
		<%} %>
	<%} %>
	<%for(int i = startBlock;i<finishBlock+1;i++){ %>
		 	<%if(pno==i){ %>
	 		<li><%=i %></li>
	 	<%}else{ %>
	 	<%if(isSearch){ %>
	 		<li><a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=i%>&list_count=<%=list_count%>"><%=i %></a></li>
	 		<%}else{ %>
	 		<li> <a href="list.jsp?pno=<%=i %>&list_count=<%=list_count%>" ><%=i %></a></li>
	 		 <%} %>
	 <%} %>
	 <%} %>
	  <%if(pagecount>finishBlock){ %>
	  <%if(isSearch){ %>
	 <li>	<a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=finishBlock+1%>&list_count=<%=list_count%>">[다음]</a></li>
	 <%}else{ %>
	  	 <li><a href="list.jsp?pno=<%=finishBlock+1 %>&list_count=<%=list_count%>">[다음]</a> </li>
	  	 <%} %>
	  	 <%} %>
	  	 </ul>
</div>
</div>
<form action="list.jsp" class="search">
	<select name ="type">
		<option value="qa_title">제목</option>
		<option value="member_id">아이디</option>
		<option value="member_name">닉네임</option>
	</select>
	<input type="search" name = "keyword">
	<input type="submit">
</form>
</div>
</article>
</body>
</html>