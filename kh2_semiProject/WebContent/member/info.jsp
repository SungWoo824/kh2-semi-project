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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
   
</head>
<body>
 
 <div align="center" class="a">
        <form action="/kh2_semiProject/member/info.do" method="post">


        <table>


            <h2>회원정보수정</h2>


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

            <tr>
                <th>새 비밀번호</th>
                <td>
                    <input type="text" name="newpw"required="required" >
                </td>
            </tr>

            <tr>
                <th>새 비밀번호 확인</th>
                <td>
                    <input type="text"  required="required">
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
                    <input type="text" name="member_phone"  required="required" placeholder="<%=dto.getPhone()%>">
                </td>
            </tr>


            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="member_email" required="required" placeholder="<%=dto.getEmail()%>">
                </td>
            </tr>

            <tr>
                <th>생일</th>
                <td>
                    <input type="text" name="member_birthday" required="required" placeholder="<%=dto.getBirthday() %>"> 
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