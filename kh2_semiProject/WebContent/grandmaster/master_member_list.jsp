<%@page import="beans.MemberDto"%>
<%@page import="java.util.*"%>
<%@page import="beans.MemberDao"%>
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
 	MemberDao mdao = new MemberDao();
 	List<MemberDto> list;

	if(isSearch){
		list = mdao.memberSearch(type, keyword, start, finish); 
	}
	else{
		list = mdao.memberList(start, finish);
	}
	int count = mdao.memberCount(type, keyword);
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
</head>
<body>
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="w-80">
	
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div class="master-title w-100"><h2>회원 목록</h2></div>
    <table class="w-100 member-table">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>등급</th>
				<th>생일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>보유쿠폰수</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto mdto : list){ %>
			<tr>
			
				<th><%=mdto.getNo() %></th>
				<th><%=mdto.getId() %></th>
				<th><%=mdto.getName() %></th>
				<th><%=mdto.getGrade() %></th>
				<th><%=mdto.getBirthday().substring(0, 10) %></th>
				<th><%=mdto.getPhone() %></th>
				<th><%=mdto.getEmail() %></th>
				<th><%=mdao.memberCouponNumber(mdto.getNo()) %></th>
				<th><a href="master_member_detail.jsp?member_no=<%=mdto.getNo() %>">
				상세보기</a></th>
			
			</tr>
			<%} %>
		</tbody>
	</table>
	<h4 class="navigator">
			<%if(startBlock > 1){ %>
				<%if(isSearch){ %>
					<a href="master_member_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
				<%}else{ %>
					<a href="master_member_list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
			<%} %>
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="master_member_list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					<%if(isSearch){ %>
						<a href="master_member_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
					<%}else{ %>
						<a href="master_member_list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(finishBlock < pagecount){ %>
				<%if(isSearch){ %>
					<a href="master_member_list.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
				<%}else{ %>
					<a href="master_member_list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
			<%} %>
		</h4>
	<div align="right">
	<form action="master_member_list.jsp" method="get" class="form=choice">
		<select id="select" name="type" class="select-icon custom-select">
			<option value="member_name">회원 이름</option>
			<option value="member_id">회원 아이디</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어" required class="search-input">
		<input type="submit" value="검색" class="button-design">
	</form>
	</div>
	</div>
</body>
</html>