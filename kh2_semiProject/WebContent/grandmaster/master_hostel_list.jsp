<%@page import="java.util.*"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pagesize = 10;
	int navsize = 10;
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
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type != null && keyword != null;
	String context = request.getContextPath();
	HostelDao hdao = new HostelDao();
	List<HostelDto> list;

	if(isSearch){
		list = hdao.masterHostelSearch(type, keyword, start, finish); 
	}
	else{
		list = hdao.hostelList(start, finish);
	}
	int count = hdao.hostelCount(type, keyword);
	int pagecount = (count + pagesize) / pagesize;
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 목록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom_select.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
<style>
	.select-selected{
		/*배경을 바꾸고 싶다면 */
  		background-color:#eaebec;  
 		border-bottom-color: #666; 
		/*글자색을 바꾸고 싶다면*/
 		color:#666; 
 		padding: 9px 16px;
 		margin-bottom: 2px;
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
	.form-choice{
		border:none;
		margin-bottom: 200px;
	}
</style>
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
</head>
<script type="text/javascript">
	function hostel_remove_event(){
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	   		document.form.submit();
		}else{   //취소
	   	 return;
		}
	}
</script>
<body>
<div class="background">
	<img src="../image/master.jpg">
</div>
<section class="container">
<div>
<jsp:include page="../template/nav.jsp"></jsp:include>
</div>
<div class="w-80">
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div class="master-title w-100"><h2>호텔 목록</h2></div>
    <table class="w-100 couponmember-table">
		<thead>
			<tr>
				<th>숙소번호</th>
				<th>숙소등록자 번호</th>
				<th>지역 이름</th>
				<th>숙소 종류</th>
				<th>숙소이름</th>
				<th>숙소번호</th>
				<th>숙소상세주소</th>
				<th>숙소설명</th>
			</tr>
		</thead>
		<tbody>
			<%for(HostelDto hdto : list){ %>
			<tr>
			
				<th><%=hdto.getHostel_no() %></th>
				<th><%=hdto.getOwner_no() %></th>
				<th><%=hdto.getRegion_name() %></th>
				<th><%=hdto.getHostel_kind_name() %></th>
				<th><%=hdto.getHostel_name() %></th>
				<th><%=hdto.getHostel_phone() %></th>
				
				<th>(<%=hdto.getHostel_detail_addr().substring(0, 5) %>) <%=hdto.getHostel_detail_addr().substring(5) %></th>
				<th><%=hdto.getHostel_content() %></th>
				<th><a href="<%=context%>/grandmaster/master_hostel_delete.do?hostel_no=<%=hdto.getHostel_no()%>" onclick="hostel_remove_event();">
					숙소 삭제하기</a></th>
			</tr>
			<%} %>
		</tbody>
	</table>
	<h4 class="navigator">
			<%if(startBlock > 1){ %>
				<%if(isSearch){ %>
					<a href="master_hostel_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
				<%}else{ %>
					<a href="master_hostel_list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="master_hostel_list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					<%if(isSearch){ %>
						<a href="master_hostel_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
					<%}else{ %>
						<a href="master_hostel_list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(finishBlock < pagecount){ %>
				<%if(isSearch){ %>
					<a href="master_hostel_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
				<%}else{ %>
					<a href="master_hostel_list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
			<%} %>
		</h4>
	<div align="right">
	<form action="master_hostel_list.jsp" method="get" class="form-choice">
		<select id="select" name="type" class="select-icon custom-select">
			<option value="hostel_name">숙소 이름</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어" required class="search-input">
		<input type="submit" value="검색" class="button-design">
	</form>
	</div>
	</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</section>
</body>
</html>