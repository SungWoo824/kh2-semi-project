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
	
	
	String context = request.getContextPath();
	
	String id = (String)session.getAttribute("id");
     
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(id);
	
	int member_no=mdto.getNo();
	
	InterestDao idao = new InterestDao();
InterestDto idto= idao.interestinfo(id);
  int room_no=    idto.getRoom_no();
	
List<InterestDto> list =  idao.interestinfolist(member_no);
 
 
 


 RoomDao rdao = new RoomDao();
 RoomDto rdto = rdao.get(room_no);



	


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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<meta charset="UTF-8">
 <title>관심상품</title>

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
	height: 670px;
	padding-top:40px;
	background-image: url("../image/mypage6.jpg"); background-position:center; background-repeat: no-repeat; 
 min-height: 110vh;
 
}

.w-80{

padding-bottom: 7rem;
 min-height: 100vh;
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

	<div class="master-title w-100"><h2>나의 위시리스트</h2></div>

    <table class="w-100 couponmember-table">
		
	
		<thead>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>가격</th>
				<th></th>
<!-- 				<th></th> -->
				
			</tr>
		</thead>
		<tbody>
		<%if(count==0){ %>
			<tr>
			
				<th colspan="6">관심상품이 없습니다.</th>
				
				
			</tr>
			<%} else{%>
			<%for(InterestDto idto2:list){ %>
			<tr>
			
				<th><%=rdto.getRoom_no()%></th>
				<th><img src="http://placehold.it/200x150"></th>
				<th><%=rdao.roomname( idto.getRoom_no()) %>//<%= hdao.hostelname( rdao.hostelNumber( idto2.getRoom_no()))   %></th>
				<th><%=rdao.roomprice(idto.getRoom_no())%></th>
				<th><a href="<%=context %>/hostel/hostel_content.jsp?hostel_no=<%=rdto.getHostel_no() %>"><input type="button" value="예약하기"></a></th>
<!-- 				<th> -->
<!-- 				<span class="bt"> -->
<%-- 					<a href="<%=context %>/mypage/wish_list.do?room_no=<%=rdto.getRoom_no()%>"><input id="login_bt" type="button" value="삭제"></a> --%>
<!-- 				</span> -->
				
<!-- 				</th> -->
				
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
			<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           
</section>


    	
		
    
 
    

</body>
</html>