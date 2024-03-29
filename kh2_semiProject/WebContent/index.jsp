<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	boolean isLogin = session.getAttribute("id") != null;
	String id = null;
	String grade = null;
	if(isLogin){
		id = (String)session.getAttribute("id");
		grade = (String)session.getAttribute("grade");
	}
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	SimpleDateFormat format = new SimpleDateFormat ("yyyy/MM/dd");
	
	cal.add(Calendar.DATE, 1);
	String currentDate = format.format(cal.getTime());
	cal.add(Calendar.DATE, 1);
	String nextDate = format.format(cal.getTime());
	
%>    

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>묵고 더블로가</title>
    <link rel="stylesheet" href="css/header-style.css" />
    <link rel="stylesheet" href="css/homenav-style.css" />
<!--     <script src="js/datepicker/jquery-1.12.4.js"></script> -->
<!--     <script src="js/datepicker/jquery-ui.js"></script> -->
<!--     <link rel="stylesheet" href="js/datepicker/jquery-ui.css" /> -->
    <script src="js/top-bar.js"></script>
    <link rel="stylesheet" href="css/index-style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css" /> -->
    <script src="js/home-slider.js"></script>
    <link rel="stylesheet" type="text/css" href="hostel/datePicker.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="hostel/datePicker.js"></script>
  </head>
  <body onload="loadPicker();" onscroll="scroll(); item3__slider();">
    <nav>
      <!-- 상단바 시작 -->
      <div class="top-bar">
        <div class="top-bar__logo">
          <a class="logo-box" href="">
            <img src="image/logo2.png" />
          </a>
        </div>
        <div class="top-bar__menu">
          <ul>

            <li><a class="top-bar__menu-item" href="hostel/0regist_region.jsp">HOSTING</a></li>

            <%if(grade!=null && grade.equals("관리자")){ %>
            	<li><a class="top-bar__menu-item" href="grandmaster/master_index.jsp">ADMIN PAGE</a></li>
            <%} %>
            <%if(isLogin) {%>
            	<li><a class="top-bar__menu-item" href="mypage/index.jsp">MY PAGE</a></li>            	
            <%}%>
            <li><a class="top-bar__menu-item" href="info/help.jsp">HELP</a></li>
            <%if(isLogin) {%>
            	<li><a class="top-bar__menu-item" href="member/logout.do">SIGN OUT</a></li>
            <%}else { %>
           		<li><a class="top-bar__menu-item" href="member/login.jsp">SIGN IN</a></li>
         	    <li><a class="top-bar__menu-item" href="member/regist.jsp">SIGN UP</a></li>
            <%} %>
          </ul>
        </div>
      </div>
      <div class="row"></div>
      <!-- 상단바 끝 -->
    </nav>

    <header id="header">
      <!-- 검색창 시작 -->
      <form
		action="hostel/hostel_list.jsp?"
		method="POST">
        <section class="search">
          <div class="search__empty"></div>

          <!-- 목적지 검색창 -->
          <div class="search-background">
            <div class="search-inputArea">
              <label for="inp" class="inp">
                <input
                  id="inp"
                  class="search__location"
                  type="text"
                  placeholder="&nbsp;"
                  name="location"
                  required="required"
                  autocomplete="off"
                />
                <span class="label">목적지</span>
                <span class="border"></span>
              </label>
            </div>

            <!-- Check in/out -->
            <div class="date">
              <div class="check-inBox">
                <label for="inp-in" class="inp">
                  <input
                    id="inp-in"
                    class="check-in sdate"
                    type="text"
                    placeholder="&nbsp;"
                    name="check_in"
                    required="required"
                    autocomplete="off"
                  />
                  <span class="label">Check In</span>
                  <span class="border"></span>
                </label>
                <script>
                  $(".check-in").datepicker();
                </script>
              </div>
              <div class="check-outBox">
                <label for="inp-out" class="inp">
                  <input
                    id="inp-out"
                    class="check-out fdate"
                    type="text"
                    placeholder="&nbsp;"
                    name="check_out"
                    required="required"
                    autocomplete="off"
                  />
                  <span class="label">Check Out</span>
                  <span class="border"></span>
                </label>
                <script>
                  $(".check-out").datepicker();
                </script>
              </div>
              <div class="row"></div>
            </div>

            <!-- 인원 입력창 -->
            <div class="people">
              <select name="adult" class="adult" required="required">
                <option value="1">성인 1명</option>
                <option value="2">성인 2명</option>
                <option value="3">성인 3명</option>
                <option value="4">성인 4명</option>
                <option value="5">성인 5명</option>
                <option value="6">성인 6명</option>
                <option value="7">성인 7명</option>
                <option value="8">성인 8명</option>
                <option value="9">성인 9명</option>
                <option value="10">성인 10명</option>
                <option value="11">성인 11명</option>
                <option value="12">성인 12명</option>
                <option value="13">성인 13명</option>
                <option value="14">성인 14명</option>
                <option value="15">성인 15명</option>
                <option value="16">성인 16명</option>
              </select>
              <select name="child" class="child" required="required">
                <option value="0">어린이 0명</option>
                <option value="1">어린이 1명</option>
                <option value="2">어린이 2명</option>
                <option value="3">어린이 3명</option>
                <option value="4">어린이 4명</option>
                <option value="5">어린이 5명</option>
              </select>
            </div>
            <div class="search-btn-box">
              <button class="search-btn" type="submit">검 색</button>
            </div>
          </div>
        </section>
      </form>
      <!-- 검색창 끝 -->
    </header>

    <main id="main">
      <!-- 홈 리스트 1번 시작 -->
      <section id="home-item1" class="home-item">
        <!-- 제목  -->
        <div class="item1 popular-title">
          <h2>인기 여행지</h2>
        </div>
        <div class="item1 popular-list">
          <div class="popular-image__background">
            <a href="hostel/hostel_list.jsp?location=서울&check_in=<%=currentDate%>&check_out=<%=nextDate%>&adult=1&child=0">
              <div class="popular-image image-left-top">
                <img src="image/seoul.jpg" alt="" />
                <span class="image-title">서울</span>
                <div class="darkness"></div>
              </div>
            </a>
          </div>
          <div class="popular-image__background">
            <a href="hostel/hostel_list.jsp?location=전주&check_in=<%=currentDate%>&check_out=<%=nextDate%>&adult=1&child=0">
              <div class="popular-image image-right-top">
                <img src="image/전주.jpg" alt="" />
                <span class="image-title image-title-sub">전주</span>
                <div class="darkness"></div>
              </div>
            </a>
          </div>
          <div class="popular-image__background">
            <a href="hostel/hostel_list.jsp?location=부산&check_in=<%=currentDate%>&check_out=<%=nextDate%>&adult=1&child=0">
              <div class="popular-image image-right-bottom">
                <img src="image/부산.jpg" alt="" />
                <span class="image-title image-title-sub">부산</span>
                <div class="darkness"></div>
              </div>
            </a>
          </div>
        </div>
        <div class="row"></div>
      </section>
      <!-- 홈 리스트 1번 끝 -->

      <!-- 홈 리스트 2번 시작 -->

      <!-- 홈 리스트 2번 끝 -->
      <section id="home-item3" class="home-item">
        <div class="item1 popular-title">
          <h2>인기 상품</h2>
        </div>
        <div class="item3-container">
          <div class="item3__menu">
            <div class="item3__list item3__list-1">
              <img src="image/item3__list-1.jpg" class="active" />
            </div>
            <div class="item3__list item3__list-2">
              <img src="image/item3__list-2.jpg"/>
            </div>
            <div class="item3__list item3__list-3">
              <img src="image/item3__list-3.jpg" />
            </div>
          </div>
          <div class="item3__imagebox">
            <img class="item3__img" src="image/item3__list-1.jpg"/>
          </div>
        </div>
      </section>
    </main>
    <footer id="main-footer">
     <div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
    </footer>
  </body>
</html>