<%@page import="beans.HostelDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.HostelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pagesize = 5;
	int navsize = 5;
	int pno;
	try {
		pno = Integer.parseInt(request.getParameter("pno"));
		if (pno <= 0)
			throw new Exception();
	} catch (Exception e) {
		pno = 1;
	}
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);

	String context = request.getContextPath();
	HostelDao hdao = new HostelDao();
	MemberDao mdao = new MemberDao();

	String id = (String) session.getAttribute("id");

	MemberDto mdto = mdao.get(id);

	int member_no = mdto.getNo();

	List<HostelDto> list = hdao.registHostellist(member_no, start, finish);

	int owner_no = mdto.getNo();
	int count = hdao.Count(owner_no);

	int pagecount = count / pagesize;
	if (count % pagesize != 0) {
		pagecount += 1;
	}

	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);

	if (finishBlock > pagecount) {
		finishBlock = pagecount;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<title>등록 숙소 조회 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style type="text/css">
* {
	font-family: binggrae;
}

.w-100 master-menu {
	background-color: #efefef;
	margin-top: 80px; 
}

body, h1, h2, h3, #wrap, #loginbox, input, label {
	margin: 0 auto;
	padding: 0;
	border: 0
}

body {
	background-color: #efefef;
	color: #333;
	font-size: 1.2em;
	font-family: "돋음", dotum, "굴림", gulim, 'Apple SD Gothic Neo', Helvetica,
		sans-serif
}

#delete, #regist {
	border-bottom: 1px  solid lightsalmon ; 
	font-size: 18px;
	display: block;
	padding : 2px 2px; 
	height: 50px;
	width: 100px;
	padding: 2px 2px;
	cursor: pointer;
	
}
#delete:hover, #regist:hover {
	border: 1px  solid lightsalmon ;
	font-size: 17px;
	display: block;
	background-color: lightsalmon;
	padding : 2px 2px; 
	height: 50px;
	width: 120px;
	padding: 2px 2px;
}
.navigator {
	font-family: notosanskrmedium;
	color: #666;
	background: none;
	border-radius: 3px;
	text-align: center;
	margin-right: 10px;
	margin-left: 10px;
	font-size: 1.2rem;
}

.navigator a {
	color: #666;
	text-decoration: none;
	margin-right: 10px;
	margin-left: 10px;
}

.navigator a:hover {
	color: black;
	text-decoration: none;
}

.navigator .navigator-choice {
	color: #045912;
	text-decoration: none;
}
.container{
	height: 850px;
	padding-top:40px;
	background-color:;
  	min-height: 90vh;
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
	<div class="master-title w-100"><h2>< 등록된 숙소 내역 ></h2></div>
    <table class="w-100 couponmember-table">
			<thead>
				<tr>
					<th width="20%">HOSTEL</th>
					<th width="10%">NAME</th>
					<th width="20%">ADDRESS</th>
					<th width="18%">PHONE</th>
					<th width="15%">비고</th>

				</tr>
			</thead>
			<tbody align="center">
				<div id="hostel">
					<%
						if (count == 0) {
					%>
					<tr align="center">
						
						<td></td>
						<td></td>
						<td rowspan="4">숙소내역이 없습니다.</td>


					</tr>
					<%
						} else {
					%>

					<%
						for (HostelDto hdto : list) {
					%>
					<tr>
						<td><img src="http://placehold.it/230x180"></td>

						<td><%=hdto.getHostel_name()%></td>

						<td><%=hdto.getHostel_detail_addr()%></td>

						<td><%=hdto.getHostel_phone()%></td>

						<td align="">
						<a href="<%=context%>/hostel/hostel_delete.do?hostel_no=<%=hdto.getHostel_no()%>">
						<input type="button" id="delete" value="숙소 삭제"> 
						<a href="2-1regist_room_info.jsp?hostel_no=<%=hdto.getHostel_no()%>">
						<input type="button" id="regist" value="방 추가"></td>
					</tr>
					<%}%>
					<%}%>
			</tbody>
		</table>

		<h4 class="navigator">
			<%
				if (startBlock > 1) {
			%>

			<a href="list.jsp?pno=<%=startBlock - 1%>">이전</a>
			<%
				}
			%>

			<%
				for (int i = startBlock; i <= finishBlock; i++) {
			%>
			<%
				if (i == pno) {
			%>
			<a href="list.jsp?pno=<%=i%>" class="navigator-choice"><%=i%></a>
			<%
				} else {
			%>

			<a href="list.jsp?pno=<%=i%>"><%=i%></a>
			<%
				}
			%>
			<%
				}
			%>


			<%
				if (finishBlock < pagecount) {
			%>

			<a href="list.jsp?pno=<%=finishBlock + 1%>">다음</a>
			<%
				}
			%>

		</h4>
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</section>
</body>
</html>