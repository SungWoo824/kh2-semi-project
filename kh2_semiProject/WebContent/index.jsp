<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="css/header-style.css" />
    <link rel="stylesheet" href="css/nav-style.css" />
    <script src="datepicker/jquery-1.12.4.js"></script>
    <script src="datepicker/jquery-ui.js"></script>
    <link rel="stylesheet" href="datepicker/jquery-ui.css" />
    <script src="js/top-bar.js"></script>
    <link rel="stylesheet" href="css/index-style.css" />
  </head>
  <body onscroll="scroll()">
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
            <li><a class="top-bar__menu-item" href="">메뉴 A</a></li>
            <li><a class="top-bar__menu-item" href="">메뉴 B</a></li>
            <li><a class="top-bar__menu-item" href="">메뉴 C</a></li>
            <li><a class="top-bar__menu-item" href="">메뉴 D</a></li>
            <li><a class="top-bar__menu-item" href="">메뉴 E</a></li>
            <li><a class="top-bar__menu-item" href="">메뉴 F</a></li>
          </ul>
        </div>
      </div>
      <div class="row"></div>
      <!-- 상단바 끝 -->
    </nav>

    <header id="header">
      <!-- 검색창 시작 -->
      <form action="" method="POST">
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
                    class="check-in"
                    type="text"
                    placeholder="&nbsp;"
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
                    class="check-out"
                    type="text"
                    placeholder="&nbsp;"
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
              <select name="" class="adult">
                <option value="">성인 1명</option>
                <option value="">성인 2명</option>
                <option value="">성인 3명</option>
                <option value="">성인 4명</option>
                <option value="">성인 5명</option>
                <option value="">성인 6명</option>
                <option value="">성인 7명</option>
                <option value="">성인 8명</option>
                <option value="">성인 9명</option>
                <option value="">성인 10명</option>
                <option value="">성인 11명</option>
                <option value="">성인 12명</option>
                <option value="">성인 13명</option>
                <option value="">성인 14명</option>
                <option value="">성인 15명</option>
                <option value="">성인 16명</option>
              </select>
              <select name="" class="child">
                <option value="">어린이 0명</option>
                <option value="">어린이 1명</option>
                <option value="">어린이 2명</option>
                <option value="">어린이 3명</option>
                <option value="">어린이 4명</option>
                <option value="">어린이 5명</option>
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
          <div class="pupular-image__background">
            <div class="popular-image image-left-top">
              <a class="popular-imageBox" href="">
                <img src="image/seoul.jpg" alt="" />
                <span class="image-title1">서울</span>
              </a>
            </div>
          </div>
          <div class="pupular-image__background">
            <div class="popular-image image-right-top">
              <a class="popular-imageBox" href="">
                <img src="image/전주.jpg" alt="" />
                <span class="image-title2">전주</span>
              </a>
            </div>
          </div>
          <div class="pupular-image__background">
            <div class="popular-image image-right-bottom">
              <a class="popular-imageBox" href="">
                <img src="image/부산.jpg" alt="" />
                <span class="image-title3">부산</span>
              </a>
            </div>
          </div>
        </div>
        <div class="row"></div>
      </section>
      <!-- 홈 리스트 1번 끝 -->

      <!-- 홈 리스트 2번 시작 -->
      <section id="home-item2" class="home-item">
        <!-- 제목  -->
        <!-- 리스트 가져와서 뽑아줄 공간 #####################-->
        <div class="item1 review-title">
          <h2>리뷰 입니다</h2>
          <h4>설명이다다다다다다우다다다다다다</h4>
        </div>
        <!-- 리스트 가져와서 뽑아줄 공간 #####################-->
        <div class="list-container hvr-fade">
          <div class="item1 review-list">
            <div class="list-item1">
              <div class="list-item1__imageBox">
                <a href=""><img src="image/고양이1.jpg"/></a>
              </div>
              <div class="list-item1__contentBox contentBox">
                <a href=""><h4>내용이다다다다다다우다다다다다다다다다</h4></a>
              </div>
            </div>
          </div>
        </div>
        <!-- ###################################################### -->
        <div class="list-container hvr-fade">
          <div class="item1 popular-list">
            <div class="list-item1">
              <div class="list-item1__imageBox">
                <a href=""><img src="image/고양이1.jpg"/></a>
              </div>
              <div class="list-item1__contentBox contentBox">
                <a href=""><h4>내용이다다다다다다우다다다다다다다다다</h4></a>
              </div>
            </div>
          </div>
        </div>
        <div class="list-container hvr-fade">
          <div class="item1 popular-list">
            <div class="list-item1">
              <div class="list-item1__imageBox">
                <a href=""><img src="image/고양이1.jpg"/></a>
              </div>
              <div class="list-item1__contentBox contentBox">
                <a href=""><h4>내용이다다다다다다우다다다다다다다다다</h4></a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 홈 리스트 2번 끝 -->
    </main>
  </body>
</html>
