<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="css/hotel-list.css" />
    <script
      src="https://kit.fontawesome.com/6e55adb245.js"
      crossorigin="anonymous"
    ></script>
    <script src="datepicker/jquery-1.12.4.js"></script>
    <script src="datepicker/jquery-ui.js"></script>
    <link rel="stylesheet" href="datepicker/jquery-ui.css" />
  </head>
  <body>
    <section id="hotel-search-section">
      <div class="hotel-search-container">
        <div class="search-wrap">
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
              </div>
            </section>
          </form>
        </div>
      </div>
    </section>
    <section id="hotel-list-section">
      <div class="hotel-list-container">
        <div class="hotel-list-header">
          <span class="hotel-list-result">
            ???개의 검색 결과
          </span>
          <select name="" id="">
            <option value="">가격순 위</option>
            <option value="">가격순 아래</option>
            <option value="">평점순 위</option>
            <option value="">평점순 아래</option>
          </select>
        </div>
        <div class="hotel-list__item list-item1">
          <div class="imageBox">
            <img src="image/item3__list-1.jpg" alt="" />
          </div>
          <div class="contentBox">
            <h3>hostel__hostel_name</h3>
            <span>room_info__parking</span>
            <span>pet</span>
            <span>breakfast</span>
            <span>cook</span>
            <span>spa</span>
            <h4>review__star_point</h4>
            <span>hostel__hostel_content</span>
            <h3>room_info__room_price</h3>
          </div>
        </div>
        <div class="hotel-list__item list-item2">
          <div class="imageBox">
            <img src="image/item3__list-2.jpg" alt="" />
          </div>
          <div class="contentBox">
            <h3>hostel__hostel_name</h3>
            <span>room_info__parking</span>
            <span>pet</span>
            <span>breakfast</span>
            <span>cook</span>
            <span>spa</span>
            <h4>review__star_point</h4>
            <span>hostel__hostel_content</span>
            <h3>room_info__room_price</h3>
          </div>
        </div>
        <div class="hotel-list__item list-item3">
          <div class="imageBox">
            <img src="image/item3__list-3.jpg" alt="" />
          </div>
          <div class="contentBox">
            <h3>hostel__hostel_name</h3>
            <span>room_info__parking</span>
            <span>pet</span>
            <span>breakfast</span>
            <span>cook</span>
            <span>spa</span>
            <h4>review__star_point</h4>
            <span>hostel__hostel_content</span>
            <h3>room_info__room_price</h3>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
