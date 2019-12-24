<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isLogin = session.getAttribute("id") != null;
	String id = null;
	String grade = null;
	if(isLogin){
		id = (String)session.getAttribute("id");
		grade = (String)session.getAttribute("grade");
		System.out.println(id + grade);
	}
%>   
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 헤더에 아래 내용 추가해주세요!! -->
		<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">--%>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      <!-- 상단바 시작 -->
    <nav class="nav-menu">
      <div class="nav-container">
        <!-- 상단바 시작 -->
        <div class="top-bar">
          <div class="top-bar__logo">
            <a class="logo-box" href="<%=request.getContextPath() %>">
              <img src="<%=request.getContextPath() %>/image/logo2.png" />
            </a>
          </div>
          <div class="top-bar__menu">
          <ul>
            <li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/hostel/0regist_region.jsp">HOSTING</a></li>
            <%if(grade!=null && grade.equals("관리자")){ %>
            	<li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/grandmaster/master_index.jsp">ADMIN PAGE</a></li>
            <%} %>
            <%if(isLogin) {%>
            	<li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/mypage/index.jsp">MY PAGE</a></li>            	
            <%}%>
            <li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/info/regist_info.jsp">HELP</a></li>
            <%if(isLogin) {%>
            	<li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/member/logout.do">SIGN OUT</a></li>
            <%}else { %>
           		<li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/member/login.jsp">SIGN IN</a></li>
         	    <li><a class="top-bar__menu-item" href="<%=request.getContextPath() %>/member/regist.jsp">SIGN UP</a></li>
            <%} %>
          </ul>
          </div>
        </div>
      </div>
      <div class="row"></div>
    </nav>
      <!-- 상단바 끝 -->