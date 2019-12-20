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
<body style="width: 60%">
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
				<table width="100%" >
				<tr>
						<td><%=rdto.getMember_name() %></td><!-- 멤버이름으로 교체 -->
						<td><%=rdto.getQa_reply_wdate() %></td>
				</tr>
				<tr>
					<td colspan="2"  style="font-size: 1.2rem;"><%=rdto.getQa_reply_content() %></td>
				</tr>
					<tr>
						<form action="qa_reply_delete.do" method="get">
							<td colspan="2" align="right">
							<a href="qa_reply_delete.do?no=<%=rdto.getQa_reply_no() %>"><input type="button" value="삭제"></a>
							</td>
					</form>
				</tr>
				</table>
					   </td>
				</tr>
			</table>
		<%} %>
		</td>
	</tr>
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

</table>
<br>
</div>
</body>