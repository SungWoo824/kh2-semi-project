<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
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
	int qa_reply_no;
	try{
		qa_reply_no = Integer.parseInt(request.getParameter("qa_reply_no"));
	}catch(Exception e){
		qa_reply_no=0;
	}
	String id = (String)request.getSession().getAttribute("id");
	String grade = (String)request.getSession().getAttribute("grade");
	boolean isSearch = id!=null && grade!=null;
	int qa_no;
	try{
		qa_no = Integer.parseInt(request.getParameter("qa_no"));
	}catch(Exception e){
		qa_no=0;
	}
	QaDao dao = new QaDao();
	QaDto dto = dao.get(qa_no);
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.memberInfomation(dto.getMember_no());
	String qa_member_id = mdto.getId();
	QaReplyDao QRDao = new QaReplyDao();
	List<QaReplyDto> list = QRDao.select(qa_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시물 상세보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<style>
	.explain textarea{
		width:100%;
		height:50px;
		resize:vertical;
		font-family:inherit;
		outline:none;
		border: 0;
		background-color:transparent
	}
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
	.content-table #replycontent{
		overflow:hidden;
		word-wrap:break-word;
		word-break:break-all;
	}
	.coupon-under-table{
		background-color: rgba( 255, 255, 255, 0.5 );
	}
    .coupon-under-table td {
    	background-color: rgba( 255, 255, 255, 0.5 );
	}
	.coupon-under-table input#b{
		color: #666;
		width:80px;
		font-size: 0.8rem;
		margin:0;
		border:0;
		outline:0;
		background: none;
		font-weight:bold;
	}
	.coupon-under-table input#b:hover{
		color:#292929;
	}
	.content-table input#c{
		color: #666;
		width:80px;
		font-size: 0.8rem;
		margin:0;
		border:0;
		outline:0;
		background: none;
		font-weight:bold;
	}
	.content-table input#c:hover{
		color:#292929;
	}
	.margin{
		margin-bottom: 200px;
	}
	.explain2 textarea{
		width:100%;
		height:20px;
		resize:vertical;
		font-family:inherit;
		outline:none;
		border: 0;
		background-color:transparent
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
<div class="w-60" align="center">
<div align="center"><h2 class="master-title w-100"><%=dto.getQa_title() %></h2></div>

<table class="w-80 coupon-under-table">
	<thead>
		<tr>
			<th width="150px">&nbsp;제목</th>
			<td>&nbsp;<%=dto.getQa_title() %></td>
		</tr>
		<tr>
			<th>&nbsp;글쓴이</th>
			<td>&nbsp;<%=dto.getMember_no() %></td>
		</tr>
		<tr>
			<th>&nbsp;방번호</th>
			<td>&nbsp;<%=dto.getRoom_no() %></td>
		</tr>
		<tr height="200">
			<td valign="top" colspan="2"><%=dto.getQa_content() %> </td>
		</tr>
	</thead>
	<tbody>
	<%for(QaReplyDto rdto : list){ %>
		<table class="w-80 content-table">
				<thead>
					<tr>
						<td align="left" style="border-right: hidden;">&nbsp;<%=rdto.getMember_name() %></td><!-- 멤버이름으로 교체 -->
						<td align="right" style="border-left: hidden;"><%=rdto.getQa_reply_wdate().substring(0,16) %>&nbsp;</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%if(qa_reply_no!=rdto.getQa_reply_no()){ %>
							<td colspan="2" valign="top" id="replycontent"><%=rdto.getQa_reply_content() %></td>
						<%}else{ %>
							<td colspan="2" class="explain2">
								<form action="qa_reply_edit.do" method="post">
									<textarea rows="1" cols="80%" name="qa_reply_content"><%=rdto.getQa_reply_content() %></textarea> 
							</td>
						<%} %>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2" align="right" class="input-button" height="5px" class="input-button">
							<form action="<%=request.getContextPath() %>/qa/qa_reply_delete.do" method="get">
								<div style="float:right;">
								<a href="qa_reply_delete.do?qa_reply_no=<%=rdto.getQa_reply_no() %>">삭제</a>
								</div>
								<%if(qa_reply_no!=rdto.getQa_reply_no()){ %>
									<div style="float:right;">
									<a href="content.jsp?pno=&qa_no=<%=rdto.getQa_no()%>&qa_reply_no=<%=rdto.getQa_reply_no() %>">수정</a>
									</div>
								<%}else{ %>						
									<div style="float:right;">
										<input type="hidden" name="qa_reply_no" value="<%=rdto.getQa_reply_no()%>">
										<input id="c" type="submit" value="수정 완료">
									</form>
									</div>		
								<%} %>
							</form>
						</th>
					</tr>
				</tfoot>
		</table>
	<%} %>
	</tbody>
</table>
<table class="w-80 coupon-under-table margin">
	<form action="<%=request.getContextPath() %>/qa/qa_reply_insert.do?qa_no=<%=dto.getQa_no() %>" method="post" class="reply">
		<tbody>
			<%if(id!=null){ %>
				<tr>
					<td class="explain">	
						<textarea rows="4" cols="80%" required name="qa_reply_content" placeholder="댓글 입력창"></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input id="b" type="submit" value="댓글 등록">
					</td>
				</tr>
			<%} %>		
		</tbody>
	</form>
	<tfoot>
		<tr>
			<td colspan="2" align="right" class="input-button">
				<%if(id!=null){ %>
					<a id="a" href="write.jsp">
						<input type="button" value="글쓰기">
					</a>
				<%} %>
				<% if(isSearch){%> 
				<a id="a" href="qa_edit.jsp?qa_no=<%=dto.getQa_no() %>">
					<input type="button" value="글수정">
				</a>
				<a id="a" href="qa_delete.do?qa_no=<%=dto.getQa_no() %>">
					<input type="button" value="글삭제">
				</a>
				<%} %> 
				<a id="a" href="list.jsp">
					<input type="button" value="글목록">
				</a>
			</td>
		</tr>
	</tfoot>	
</table>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</section>
</body>
</html>