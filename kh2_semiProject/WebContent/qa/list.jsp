<%@page import="qa.been.QaDto"%>
<%@page import="qa.been.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = "김운기";
	QaDao dao = new QaDao();
	List<QaDto> list = dao.list();
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	if(keyword!=null){
		list = dao.search(type, keyword);
	}
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<article class="w-100">
<div class="row-title">리스트 목록</div>
<div class="row">
<% if(true){ %>
	<table class="table" >
	<tr>
		<th>번호</th>
		<th>방번호</th>
		<th>말머리 </th>
		<th width="45%">제목</th>
		<th>작정자 </th>
		<th>작성일 </th>
		</tr>
	<%for(QaDto dto : list){ %>
	<tr>
		<td><%=dto.getQa_no() %></td><!-- member get으로 아이디를 가져와야함 -->
		<td><%=dto.getRoom_no() %></td><!-- room_info get으로 방이름을 가져와야함 -->
		<td><%=dto.getQa_head() %></td>
		<td align="left"><a href="content.jsp?no=<%= dto.getQa_no() %>" ><%= dto.getQa_content() %></a></td>
		<td><%=dto.getMember_no() %></td>
		<td><%=dto.getQa_wdate() %></td>
	</tr>
	<%} %>

		<%} %>

</table>
</div>
</article>
<a href="write.jsp">글쓰기</a>	
	<h4>[이전] 1 2 3 4 5 6 7 8 9 10 [다음]</h4>

<form action="list.jsp">
	<select name ="type">
		<option value="title">제목</option>
		<option value="writer">작성자</option>
	</select>
	<input type="search" name = "keyword">
	<input type="submit">
</form>