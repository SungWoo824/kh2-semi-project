<%@page import="beans.RoomDao"%>
<%@page import="beans.HostelDto"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.ReservationDto"%>
<%@page import="beans.ReservationDao"%>
<%@page import="beans.MemberDto"%>
<%@page import="java.util.List"%>
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
	
	String context = request.getContextPath();
	
	ReservationDao rdao = new ReservationDao();
  	String id = (String)session.getAttribute("id");

 	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(id);
     
	int member_no=mdto.getNo();
	
	
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
  List<ReservationDto> list = rdao.list(member_no, start, finish);
	
	int count = rdao.Count(member_no);
	int pagecount = (count + pagesize) / pagesize;
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
  
  
  
  

RoomDao roomdao = new RoomDao();
	HostelDao hosteldao = new HostelDao();
	

	

  

  
  
  
  
  
  


  
  
  
 
 %>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
 <title>예약목록</title>
 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">




<style type="text/css">
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
	width:100%;
	height: 100%;
	padding-top:40px;
background-color: #FDFDFD;
  min-height: 90vh;
  background-image: url("<%=context %>/image/mypage6.jpg"); background-position:center; background-repeat: no-repeat; 
 
}

.w-80{

padding-bottom: 7rem;
 min-height: 100vh;
 
 padding-top:40px;

	
}

	footer{
		background-color: #f6f6f6;
		border-top: 1px solid rgba(34, 50, 84, 0.2);
		font-family: binggrae;
	bottom:0;
		
	width: 100%;
	height: 7rem;
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
	<div class="master-title w-100"><h2>나의 예약 내역</h2></div>
    <table class="w-100 couponmember-table">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>이미지</th>
				<th>예약정보</th>
				
				<th>숙박기간</th>
				<th>인원수</th>
				
				<th>고객요구사항</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%if(count==0){ %>
			<tr>
			
				<th colspan="7">예약내역이 없습니다.</th>
				
				
			</tr>
			<%} else{%>
			
			<%for(ReservationDto rdto2 : list){ %>
			<tr>
			
				<th><%=rdto2.getReservation_no() %></th>
				<th><img src="<%=request.getContextPath()%>/hostel/hostel_download.do?hostel_no=<%=rdto2.getHostel_no()%>" style="width: 200px; height: 150px;"></th>
				
				<th><a href="<%=context %>/hostel/hostel_content.jsp?hostel_no=<%=rdto2.getHostel_no() %>">
				<%if( hosteldao.hostelname(roomdao.hostelNumber(rdto2.getRoom_no()))==null){ %>
				
				<%} else{%>
				<%= hosteldao.hostelname(roomdao.hostelNumber(rdto2.getRoom_no()))%>
				<%} %>
				 / 
				 <%if(roomdao.roomname(rdto2.getRoom_no())==null){ %>
				
				<%} else{%>
			<%=roomdao.roomname(rdto2.getRoom_no()) %>
				<%} %>
				 
			
				
				
				</a></th>
		
				<th><%=rdto2.getReservation_start_date().substring(0, 10) %> ~ <%=rdto2.getReservation_finish_date().substring(0, 10) %></th>
				<th><%=rdto2.getCustomer_count() %></th>
				
				
				
			
			<%if(rdto2.getCustomer_request()==null){ %>
		<th>X</th>	
			<%} else{ %>
				<th><%=rdto2.getCustomer_request() %></th>
			
			<%} %>
				
	
				<th><a href="<%=context %>/review/review_write.jsp?reservation_no=<%=rdto2.getReservation_no() %>&hostel_no=<%=rdto2.getHostel_no()%>"><input type="button" value="리뷰쓰러가기"></a></th>
			
				
			</tr>
			
			<%} %>
			<%} %>
			
		</tbody>
	
	</table>
	

<h4 class="navigator">
			<%if(startBlock > 1){ %>
			
					<a href="list.jsp?pno=<%=startBlock - 1%>">이전</a>
				<%} %>
	
			<%for(int i=startBlock; i <= finishBlock; i++){ %>
				<%if(i == pno){ %>
					<a href="list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
				<%}else{ %>
					
						<a href="list.jsp?pno=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
		
	
			<%if(finishBlock < pagecount){ %>
				
					<a href="list.jsp?pno=<%=finishBlock + 1%>">다음</a>
				<%} %>
		
		</h4>
	</div>
 
 

 
 
 
 
 
 

			<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</section>
		
           
		
		
</body>
</html>