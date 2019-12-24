<%@page import="java.util.List"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@page import="beans.RoomDto"%>
<%@page import="beans.RoomDao"%>
<%@page import="beans.InterestDao"%>
<%@page import="beans.InterestDto"%>
<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%
	//회원 정보를 불러오는 코드
	//1. session에서 id에 들어있는 데이터를 꺼낸다
	//2. id를 주고 dao를 이용하여 회원정보(MemberDto)를 꺼낸다
	//3. 원하는 위치에 출력한다.
	
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
	
	
	
	
	String id = (String)session.getAttribute("id");
     
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(id);
	
	int member_no=mdto.getNo();
	
	InterestDao idao = new InterestDao();
	
List<InterestDto> list =  idao.interestinfolist(member_no);
 
 
 


 RoomDao rdao = new RoomDao();
 



	


	int count = idao.Count(member_no);
	int pagecount = (count + pagesize) / pagesize;
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
	
	
	
	
	

HostelDao hdao =new  HostelDao();


 
%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>관심상품</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
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

	<div class="master-title w-100"><h2>나의 위시리스트</h2></div>
    <table class="w-100 couponmember-table">
		
	
		<thead>
			<tr>
				<th></th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>가격</th>
				<th></th>
				<th></th>
				
			</tr>
		</thead>
		<tbody>
		<%if(count==0){ %>
			<tr>
			
				<th colspan="6">위시리스트가 없습니다.</th>
				
				
			</tr>
			<%} else{%>
			<%for(InterestDto idto:list){ %>
			<tr>
			
				<th><input type="checkbox"></th>
				<th><img src="http://placehold.it/200x150"></th>
				<th><%=rdao.roomname( idto.getRoom_no()) %>//<%= hdao.hostelname( rdao.hostelNumber( idto.getRoom_no()))   %></th>
				<th><%=rdao.roomprice(idto.getRoom_no())%></th>
				<th><input type="submit" value="예약하기"></th>
				<th><input type="submit" value="삭제"></th>
				
				
				
			</tr>
			<%} %>
				<%} %>
		</tbody>
	</table>
	


		
		    <h4 class="navigator">
			<%if(startBlock > 1){ %>
			
					<a href="wish_list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
	
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="wish_list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					
						<a href="wish_list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
		
	
			<%if(finishBlock < pagecount){ %>
				
					<a href="wish_list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
		
		</h4>
		
	</div>
</section>


    	
			<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           
		
    
 
    

</body>
</html>