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
  ReservationDao rdao = new ReservationDao();
	
  
  List<ReservationDto> list= rdao.list();
ReservationDto rdto=rdao.get();
	
	
	int room_no=rdto.getRoom_no();
	HostelDao hdao = new HostelDao();
	
	HostelDto hdto =hdao.hostelinfomation(room_no);
 %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<style>


</style>

</head>
<body>
    
    <div class="row-title"><a href="list.jsp">예약정보</a></div>
    <div class="w-80">
        <table class="w-100 reli-table">
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>이미지</th>
                    <th>상품정보</th>
                    <th>숙박기간</th>
                    <th>인원수</th>
                    <th>고객요구사항</th>

                </tr>
            </thead>
            
            
            <tbody>
	<%for(ReservationDto rdto2 : list){ %>
                <tr>

                    <td><%=rdto2.getReservation_no() %></td>
                    
                    <td>이미지창</td>
                    
                   
                    <td><%=hdto.getHostel_name() %></td>
                 
                    
                    <td><%=rdto2.getReservation_start_date() %>~ 2019-12-20</td>
                    
                    <td><%=rdto2.getCustomer_count() %></td>
                    
                    <td><%=rdto2.getCustomer_request() %></td>

                </tr>
<%} %>
            </tbody>
        </table>
    </div>


</body>
</html>