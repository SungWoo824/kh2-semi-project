<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="qa.been.QaDto"%>
<%@page import="qa.been.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = "운기";
	String grade ="관리자";
	String no1 = request.getParameter("no");
	int no = Integer.parseInt(no1);
	QaDao dao = new QaDao();
	QaDto dto = dao.get(no);
%>
<div align="center">
<h1>	<%=dto.getQa_title() %></h1>
	<table border="1" width="70%">
	<tr>
		<td>제목: <%=dto.getQa_title() %></td>
	</tr>
	<tr>
		<td>글쓴이: 
		<%=dto.getMember_no() %> 

		</td>
	</tr>
	<tr height="200">
		<td valign="top"><%=dto.getQa_content() %> </td>
	</tr>

	<%if(id!=null){ %>
			<tr>
					<td align="right">

			<form action="reply_insert.do?origin=<%=dto.getQa_no() %>" method="post">
				<textarea rows="4" cols="100" required name="content"></textarea>
				<input type="submit" value="등록">
			</form>
				</td>
		</tr>
	<%} %>

	<tr align="right">
		<td>
	<a href="write.jsp"><input type="button" value="글쓰기"></a>
	<a href="edit.jsp?no=<%=dto.getQa_no() %>"><input type="button" value="글수정"></a>
	<a href="write.jsp?superno=<%=dto.getQa_no() %>"><input type="button" value="답글쓰기"></a>
	<a href="delete.do?no=<%=dto.getQa_no() %>"><input type="button" value="글삭제"></a>
	<a href="list.jsp"><input type="button" value="글목록"></a></td>
	</tr>

</table>
<br>
</div>