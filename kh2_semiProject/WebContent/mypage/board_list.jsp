<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">




<title>내 게시물 관리</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>
.row-big{

height: 0.1px;
}

 .navigator{
    	font-family: notosanskrmedium;
    	color:#666;
    	background:none;
    	border-radius: 3px;
    	text-align: center;
    	margin-right: 10px;
    	margin-left: 10px;
    	font-size: 1.2rem;
    }
    .navigator a{
    	color:#666;
    	text-decoration: none;
    	margin-right: 10px;
    	margin-left: 10px;
    }
    

    .navigator a:hover{
    	color: black;
    	text-decoration: none;
    }
    .navigator .navigator-choice{
    	color: #045912;
    	text-decoration: none;
    }


.container{
	height: 670px;
	padding-top:40px;
	background-image: url(""); background-position:center; background-repeat: no-repeat; 
 min-height: 110vh;
}

.w-80{

padding-bottom: 7rem;
}

	footer{
		background-color: #f6f6f6;
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	
	bottom:0;
	width: 100%;
	height: 7rem;
	}


#wrap {
	width: 360px;
	border: 1px solid #ddd;
	background-color: #fff;
	padding: 15px;
	margin-bottom:10px;
	height: 500px;
	overflow: hidden
padding-bottom: 8rem;
}

</style>
</head>

<body>

<section class="container">
<div>
<jsp:include page="/template/nav.jsp"></jsp:include>
</div>
<div class="w-80">
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
		<div class="row-big"></div>

	<div class="master-title w-100"><h2>내가 쓴 글 </h2></div>
    <table class="w-100 couponmember-table">
		
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
		<%if(count==0){ %>
			<tr>
			
				<th colspan="7">게시물이 없습니다.</th>
				
				
			</tr>
			<%} else{%>
	<%for (QaDto dto : list) {%>
	<tr>
		<td><%=dto.getQa_no()%></td><!-- member get으로 아이디를 가져와야함 -->
		<td><%=dto.getRoom_no()%></td><!-- room_info get으로 방이름을 가져와야함 -->
		<td><%=dto.getQa_head() %></td>
		<td align="left"><a href="board_content.jsp?pno=&qa_no=<%= dto.getQa_no() %>" ><%=dto.getQa_title() %></a></td>
		<td><%=dto.getMember_no() %></td>
		<td><%=dto.getQa_wdate() %></td>
		<td><a href="board_content.jsp?pno=&qa_no=<%= dto.getQa_no() %>" ><input type="button" value="상세보기"></a></td>
	</tr>
	<% } %>
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
	


	</div>
</section>
 



		<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           



</body>
</html>