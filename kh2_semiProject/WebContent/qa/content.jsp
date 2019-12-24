<%@page import="beans.QaReplyDao"%>
<%@page import="beans.QaReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "운기";
	String grade ="관리자";
	String no1 = request.getParameter("no");
	int qa_no = Integer.parseInt(no1);
	QaDao dao = new QaDao();
	QaDto dto = dao.get(qa_no);
	QaReplyDao QRDao = new QaReplyDao();
	List<QaReplyDto> list = QRDao.select(qa_no);
	
	String member_id = (String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시물 상세보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<style>
	body{
		height: 1000px;
		width: 100%;
		margin: 0;
		padding: 0;
		background-repeat: no-repeat;
		background-size : cover;	
	}
	.background{
		height:1000px;	
		position:fixed;
		width:100%;
		z-index:100;
		background-size: 100%;
		min-height:1000px;
	}
	.background img{
		width:100%;
		height:1000px;
	}
	
	.container{
		width:100%;
		position:absolute;
		z-index:101;
	}
</style>
</head>
<body>
<div class="background">
	<img src="../image/master.jpg">
</div>
<section class="container">
<jsp:include page="../template/nav.jsp" ></jsp:include>
<div class="w-80">
<div class="row-big"></div>
<div class="row-big"></div>
<div class="row-big"></div>
<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
</div>
<div class="w-60">
<div align="center"><h2 class="master-title w-100"><%=dto.getQa_title() %></h2></div>

<table class="w-100 coupon-under-table">
	<thead>
		<tr>
			<td width="150px">&nbsp;제목</td>
			<td>&nbsp;<%=dto.getQa_title() %></td>
		</tr>
		<tr>
			<td>&nbsp;글쓴이</td>
			<td>&nbsp;<%=dto.getMember_no() %></td>
		</tr>
		<tr>
			<td>&nbsp;방이름</td>
			<td>&nbsp;<%=dto.getRoom_no() %></td>
		</tr>
		<tr height="200">
			<td valign="top" colspan="2"><%=dto.getQa_content() %> </td>
		</tr>
			<tr>
			<td>
	</thead>
	<tbody>
		<table class="w-100 coupon-under-table">
			<%for(QaReplyDto rdto : list){ %>
				<tr>
					<td><%=rdto.getMember_name() %></td><!-- 멤버이름으로 교체 -->
					<td><%=rdto.getQa_reply_wdate().substring(0,16) %></td>
				</tr>
				<tr>
					<td colspan="2"><%=rdto.getQa_reply_content() %></td>
				</tr>
				<tr>
					<form action="<%=request.getContextPath() %>/qa/qa_reply_delete.do" method="get">
						<td colspan="2">
							<a href="qa_reply_delete.do?no=<%=rdto.getQa_reply_no() %>"><input type="button" value="삭제"></a>
						</td>
					</form>
				</tr>
			<%} %>
		</table>
		<%if(id!=null){ %>
			<tr>
				<td align="right">	
					<form action="qa_reply_insert.do?qa_no=<%=dto.getQa_no() %>" method="post" class="reply">
						<textarea rows="4" cols="80%" required name="qa_reply_content"></textarea>
						<input type="submit" value="등록">
					</form>
				</td>
			</tr>
		<%} %>	
		<tr align="right">
			<td>
			<%if(member_id!=null){ %>
				<a href="write.jsp"><input type="button" value="글쓰기"></a>
			<%} %>
			<a href="edit.jsp?no=<%=dto.getQa_no() %>"><input type="button" value="글수정"></a>
			<a href="delete.do?no=<%=dto.getQa_no() %>"><input type="button" value="글삭제"></a>
			<a href="list.jsp"><input type="button" value="글목록"></a></td>
		</tr>
	</tbody>
</table>
</div>
</section>
</body>
</html>