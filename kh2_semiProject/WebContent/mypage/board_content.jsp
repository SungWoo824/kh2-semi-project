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
<!DOCTYPE html>
<%
	int qa_reply_no;
	try{
		qa_reply_no = Integer.parseInt(request.getParameter("qa_reply_no"));
	}catch(Exception e){
		qa_reply_no=0;
	}
	String id = (String)request.getSession().getAttribute("id");
	String grade = (String)request.getSession().getAttribute("grade");
	
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
	System.out.println(qa_member_id);
	QaReplyDao QRDao = new QaReplyDao();
	List<QaReplyDto> list = QRDao.select(qa_no);
%>
<style>
@charset "UTF-8";

        @font-face{
            font-family:cookieRun;
            src:url("../font/COOKIERUN BLACK.OTF")
        }
        @font-face{
            font-family:No;
            src:url("../font/NotoSansCJKkr-Medium.otf")
        }

* {
	box-sizing: border-box;
	margin: auto;
	font-family: No;
}

.table{
    width:100%;
    border:1px solid black;
    border-collapse: collapse;
}

.table > tbody > tr>.content
{
	padding-top:25px;
	padding-bottom:50px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 1rem; 
	border-bottom: 1px dotted black;
}

article{
    margin:auto;
}

.row{
	text-align: center;
}

.row,.row-left,.row-right,.row-title,row-multi{
    margin:10px 0px;
}
.row-title{
	font-size: 2rem;
	margin-bottom:2rem;
	text-align: center;
}
.row-left{
	text-align: left;
}


.row-right{
	text-align: right;
}
.reply{
	width: 100%;
}
.reply>input[type=submit]{
	width: 20%;
	height: 5rem;
	float: left;
}
.reply>textarea{
	width:80%;
	float: left;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">

<body style="width: 60%">

<jsp:include page="../template/nav.jsp" ></jsp:include>
<br><br><br><br>
<div align="center">
<h1>	<%=dto.getQa_title() %></h1>
	<table class="table">
	<tr>
		<td>제목: <%=dto.getQa_title() %></td>
	</tr>
	<tr>
		<td>글쓴이: 
		<%=dto.getMember_no() %> 

		</td>
	</tr>
	<tr>
		<td style="border-bottom: 1px dotted black">방이름:<%=dto.getRoom_no() %></td>
	</tr>
	<tr height="200">
		<td valign="top" class="content" ><%=dto.getQa_content() %> </td>
	</tr>
		<tr>
		<td>
		<%for(QaReplyDto rdto : list){ %>
					<table  width="100%" >
			<tr>
				<td>
				<table width="100%"  >
				<tr>
						<td><%=rdto.getMember_name() %></td><!-- 멤버이름으로 교체 -->
						<td><%=rdto.getQa_reply_wdate() %></td>
				</tr>
				<tr>
					<%if(qa_reply_no!=rdto.getQa_reply_no()){ %>
					<td colspan="2"  style="font-size: 1.2rem;"><%=rdto.getQa_reply_content() %></td>
				<%}else{ %>
				<td colspan="2"  style="font-size: 1.2rem;">
				<form action="qa_reply_edit.do" method="post">
					<textarea name="qa_reply_content"><%=rdto.getQa_reply_content() %></textarea> 
					<input type="hidden" name="qa_reply_no" value="<%=rdto.getQa_reply_no()%>">
					<input type="submit" value="수정">
				</form>
				</td>
				<%} %>
				</tr>
					<tr>
					<td colspan="2" align="right">
						<form action="qa_reply_delete.do" method="post">
							<%if(qa_reply_no!=rdto.getQa_reply_no()){ %>
							<a href="content.jsp?pno=&qa_no=<%=rdto.getQa_no()%>&qa_reply_no=<%=rdto.getQa_reply_no() %>"><input type="button" value="수정"></a>
							<%} %>
							<a href="qa_reply_delete.do?qa_no=<%=rdto.getQa_reply_no() %>"><input type="button" value="삭제"></a>
					</form>
					</td>
				</tr>
				</table>
					   </td>
				</tr>
			</table>
		<%} %>
		</td>
	</tr>
	
			<tr>
					<td align="right">

			<form action="qa_reply_insert.do?qa_no=<%=dto.getQa_no() %>" method="post" class="reply">
				<textarea rows="4" cols="80%" required name="qa_reply_content"></textarea>
				<input type="submit" value="등록">
			</form>
				</td>
		</tr>
	

	<tr align="right">
		<td>
		
	<a href="write.jsp"><input type="button" value="글쓰기"></a>
	
	
	<a href="edit.jsp?qa_edit_no=<%=dto.getQa_no() %>"><input type="button" value="글수정"></a>
	<a href="delete.do?qa_delete_no=<%=dto.getQa_no() %>"><input type="button" value="글삭제"></a>
	
	<a href="list.jsp"><input type="button" value="글목록"></a></td>
	</tr>

</table>
<br>
</div>


	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           


</body>