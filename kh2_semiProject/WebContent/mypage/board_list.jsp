<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//아이디로 내가 쓴 보드 글 찾기

String id = (String)session.getAttribute("id");

MemberDao mdao = new MemberDao();
MemberDto mdto =  mdao.get(id);
int member_no=   mdto.getNo();


	


//	페이지 크기
	int pagesize = 10;
//	네비게이터 크기
	int navsize = 10;
	
//	페이징 추가
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);
	
	
	
	
QaDao qdao = new QaDao();
int count=qdao.Countmemberno(member_no);

	int pagecount = (count + pagesize) / pagesize;
	
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	
	List<QaDto> list = qdao.id_search(id, start, finish);
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
		<th> </th>
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
		<td><input type="button" value="상세보기"></td>
	</tr>
	<% } %>
</tbody>
</table>



<h4 class="navigator">
			<%if(startBlock > 1){ %>
			
					<a href="board_list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
	
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="board_list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					
						<a href="board_list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
		
	
			<%if(finishBlock < pagecount){ %>
				
					<a href="board_list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
		
		</h4>

</body>
</html>