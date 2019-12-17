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
    font-family: cookieRun;
}

.table{
    width:100%;
    border:1px solid black;

    /* 테두리 병합 */
    border-collapse: collapse;

}

.table > thead > tr > td,
.table > thead > tr > th,
.table > tbody > tr > td,
.table > tbody > tr > th
{
    border:1px solid black;
    padding:0.5rem;
}

.custom-list{
    list-style: none;
    margin:0;
    padding:0;
    display:inline-block;

    width:150px;
}
.custom-list > li{
    background-color:black;
    color:white;
    padding:15px;
    cursor:pointer;
}
.custom-list li:hover{
    background-color:gray;
    color:black;
}

/* 2차 이상의 메뉴 스타일 */
.custom-list ul{
    list-style: none;
    padding:0;
    margin:0;

    position: absolute;
    margin-left: 135px;
    margin-top: -36px;

    /* 2차 이상의 메뉴는 처음에 숨김 처리 */
    display: none;
}
.custom-list ul > li{
    background-color:black;
    color:white;
    padding:15px;
    width:150px;
}

.custom-list li:hover > ul{
    display: block;
}

.custom-list li{
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}


.w-100{ width: 100%; }
.w-90{ width: 90%; }
.w-80{ width: 80%; }
.w-70{ width: 70%; }
.w-60{ width: 60%; }
.w-50{ width: 50%; }
.w-40{ width: 40%; }
.w-30{ width: 30%; }
.w-20{ width: 20%; }
.w-10{ width: 10%; }

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
            padding: 1rem;
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
        
	.title{
background: rgb(34,193,195);
background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(253,187,45,1) 100%);
	color: white;
	text-align: left
	}
}
</style>
<body>
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
	<tr>
		<td>방이름:<%=dto.getRoom_no() %></td>
	</tr>
	<tr height="200">
		<td valign="top"><%=dto.getQa_content() %> </td>
	</tr>
		<tr>
		<td>
		<%for(QaReplyDto rdto : list){ %>
					<table class="table" width="100%" >
			<tr>
				<td><table border="1" width="100%" >
				<tr>
						<td><%=rdto.getMember_no() %></td><!-- 멤버이름으로 교체 -->
						<td><%=rdto.getQa_reply_wdate() %></td>
				</tr>
				<tr>
					<td colspan="2" ><%=rdto.getQa_reply_content() %></td>
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

			<form action="qa_reply_insert.do?qa_no=<%=dto.getQa_no() %>" method="post">
				<textarea rows="4" cols="100" required name="qa_reply_content"></textarea>
				<input type="submit" value="등록">
			</form>
				</td>
		</tr>
	<%} %>

	<tr align="right">
		<td>
	<a href="write.jsp"><input type="button" value="글쓰기"></a>
	<a href="edit.jsp?no=<%=dto.getQa_no() %>"><input type="button" value="글수정"></a>
	<a href="delete.do?no=<%=dto.getQa_no() %>"><input type="button" value="글삭제"></a>
	<a href="list.jsp"><input type="button" value="글목록"></a></td>
	</tr>

</table>
<br>
</div>
</body>