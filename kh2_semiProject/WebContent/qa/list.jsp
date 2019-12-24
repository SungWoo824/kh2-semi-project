<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="beans.QaReplyDto"%>
<%@page import="beans.QaReplyDao"%>
<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getSession().getAttribute("id");
	String grade = (String)request.getSession().getAttribute("grade");
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

	String member_id = (String)request.getSession().getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color: #666; 
		/*글자색을 바꾸고 싶다면*/
 		color:#666; 
 		margin-bottom: 3px;
 		height: 41px;
	}
	
	/* 화살표 색상을 바꾸고 싶다면 */
	.select-selected::after{
		border-top-color:#666;
	}
	.select-selected.select-arrow-active::after{
		border-bottom-color:#666;
	}
	/* 화살표 색상을 바꾸고 싶다면 */	
	
	/* 테두리를 바꾸고 싶다면 */
	.select-items{
		border-color:#eaebec;
	}
	/* 테두리를 바꾸고 싶다면 */
	
	
	/* 항목 글자색을 바꾸고 싶다면 */
	.select-items div{
		color:#666;
	}
	/* 항목 글자색을 바꾸고 싶다면 */
	
	.form-choice{
		border:none;
	}
	
	.master-title{
		margin-bottom: 0px;
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
	.m{
		margin-right: 30px;
		margin-bottom: 15px;
	}
	.form-choice{
		border:none;
		margin-bottom: 200px;
	}
</style>
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
<script>
function formChange(obj){
	obj.submit();
}
</script>
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
<div class="master-title w-100"><h2>Q&A 목록</h2></div>
<form action="list.jsp">
<div align="right">
	<h5></h5>
	<select name ="list_count" onchange="formChange(this.form)" class="m">
		<option value="" hidden>페이지 크기 선택</option>
		<option value="15">15개씩 보기</option>
		<option value="30">30개씩 보기</option>
		<option value="45">45개씩 보기</option>
		<option value="60">60개씩 보기</option>
	</select>
</div>
</form>
<table class="w-100 couponmember-table">
<thead>
	<tr>
		<th>번호</th>
		<th>방번호</th>
		<th>말머리 </th>
		<th width="45%">제목</th>
		<th>작성자 </th>
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
		<td align="left"><a href="content.jsp?pno=&qa_no=<%= dto.getQa_no() %>" ><%=dto.getQa_title() %></a></td>
		<td><%=dto.getMember_name() %></td>
		<td><%=dto.getQa_wdate().substring(0,10) %></td>
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
<%if(grade!=null){ %>
<tfoot>
	<tr style="height: 30px;">
		<th colspan="6" align="right">
			<a href="write.jsp">글쓰기</a>
		</th>
	</tr>
</tfoot>
<%} %>
</table>

<h4 class="navigator">
	<%if(startBlock>1){ %>
		<%if(isSearch){ %>
			<a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=startBlock-1%>&list_count=<%=list_count%>">[이전]</a>
		<%}else{ %>
			<a href="list.jsp?pno=<%=startBlock-1 %>&list_count=<%=list_count%>">이전</a>
		<%} %>
	<%} %>
	<%for(int i = startBlock;i<finishBlock+1;i++){ %>
		 <%if(pno==i){ %>
	 		<a href="list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
	 	<%}else{ %>
	 		<%if(isSearch){ %>
	 			<a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=i%>&list_count=<%=list_count%>"><%=i %></a>
	 		<%}else{ %>
	 			<a href="list.jsp?pno=<%=i %>&list_count=<%=list_count%>" ><%=i %></a>
	 		<%} %>
	 	<%} %>
	 <%} %>
	 
	 <%if(pagecount>finishBlock){ %>
	 	<%if(isSearch){ %>
	 		<a href="list.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=finishBlock+1%>&list_count=<%=list_count%>">[다음]</a>
	 	<%}else{ %>
	  	 	<a href="list.jsp?pno=<%=finishBlock+1 %>&list_count=<%=list_count%>">다음</a>
	  	<%} %>
	 <%} %>
</h4>
<div align="right">
	<form action="list.jsp" class="form-choice">
		<select name ="type" id="select" class="select-icon custom-select" required>
			<option value="qa_title">제목</option>
			<option value="member_id">아이디</option>
			<option value="member_name">닉네임</option>
		</select>
		<input type="search" name = "keyword" placeholder="검색어" required class="search-input">
		<input type="submit" value="검색" class="button-design">
	</form>
</div>
</div>
</section>
<div>footer</div>

</body>
</html>