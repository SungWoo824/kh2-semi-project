<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
	//회원 정보를 불러오는 코드
	//1. session에서 id에 들어있는 데이터를 꺼낸다
	//2. id를 주고 dao를 이용하여 회원정보(MemberDto)를 꺼낸다
	//3. 원하는 위치에 출력한다.
	
	String id = (String)session.getAttribute("id");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.get(id);
	
	
%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

 <style>
    
        
      
    </style>
   
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

   
</head>
<body>
 
 <div align="center" class="a">
        <form action="info.do" method="post">



	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row" ></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
          <div class="master-title w-100"><h2>회원 정보 수정</h2></div>
        <table>


            <tr>
                <th>아이디</th>
                <td>
                    <%=dto.getId()%>
                </td>
            </tr>

            <tr>
                <th>현재 비밀번호</th>
                <td>
                    <input type="text" name="member_pw" required="required" >
                </td>
            </tr>
             

<%if(request.getParameter("error") != null){ %>
	<div class="row">
		<!-- error라는 이름의 파라미터가 있다면 오류 메시지를 출력 -->
		<h5><font color="red">비밀번호가 일치하지 않습니다.</font></h5>
	</div>
	<%} %>	
             
           
            

            <tr>
                <th>새 비밀번호</th>
                <td>
                    <input type="text" name="newpw"required="required" >
                </td>
            </tr>

           

            <tr>
                <th>이름</th>
                <td>
                   <%=dto.getName() %>
                </td>
            </tr>

            <tr>
                <th>전화번호</th>
                <td>
                    <input type="text" name="member_phone" placeholder="<%=dto.getPhone()%>">
                </td>
            </tr>


            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="member_email" placeholder="<%=dto.getEmail()%>">
                </td>
            </tr>

            <tr>
                <th>생일</th>
                <td>
                    <input type="date" name="member_birthday"placeholder="<%=dto.getBirthday() %>"> 
                </td>
            </tr>


            <tr align="right">
                <td>
                    <input type="submit" value="회원정보수정">
                </td>
            </tr>

        </table>
        </form>
    </div>


</body>
</html>