<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@page import="beans.FilesDto"%>
<%@page import="beans.FilesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.RoomDao"%>
<%@page import="beans.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.ReviewDao"%>
<%@page import="beans.ReviewDto"%>
<%@page import="beans.HostelDao"%>
<%@page import="beans.HostelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int hostel_no = Integer.parseInt(request.getParameter("hostel_no"));
	String check_in = request.getParameter("check_in");
	String check_out = request.getParameter("check_out");
	int people;
	try{
		people = Integer.parseInt(request.getParameter("people"));
	}catch(Exception e){
		people = 0;
	}

	boolean isSearch = check_in != null && check_out != null && people != 0;
	/* 	HostelDao dao = new HostelDao();
		HostelDto dto = dao.hostelinfomation(hostel_no);
	======= */

	HostelDao hdao = new HostelDao()	;
	HostelDto hdto = hdao.hostelinfomation(hostel_no);
	ReviewDao rdao = new ReviewDao();
	List<ReviewDto> list = rdao.hostel_review_list(hostel_no);
	RoomDao Rdao = new RoomDao();
	List<RoomDto> Rlist = new ArrayList<>();
	if (isSearch) {
		Rlist = Rdao.hostel_room_list_search(check_in, check_out, people, hostel_no);
	} else {
		Rlist = Rdao.hostel_room_list(hostel_no);
	}

%>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세정보</title>
<link rel="stylesheet" href="../css/hostel-list.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="../css/hostel-content.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/swiper.min.css" />
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<style>

img {
	width: 100%;
	height: 100%;
}
/* span{
	border: 1px dotted black;
}
div{
	border: 1px dotted black;
}  */
.review_star{
	color: gray;
}
</style>
<script src="<%=request.getContextPath()%>/js/custom_select.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=534248faec0557257f5c7cc9e504a2da&libraries=services"></script>
<script>
	var db = {
		//이름:마커객체
		편의점 : {
			imageSrc : '../image/편의점.jpg',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		약국 : {
			imageSrc : '../image/약국.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		주유소 : {
			imageSrc : '../image/주유소.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		지하철역 : {
			imageSrc : '../image/지하철.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		은행 : {
			imageSrc : '../image/은행.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		관광명소 : {
			imageSrc : '../image/관광명소.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		음식점 : {
			imageSrc : '../image/음식점.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},
		카페 : {
			imageSrc : '../image/카페.png',//이미지경로
			imageSize : new kakao.maps.Size(30, 30),//이미지 크기
			imageOption : {
				offset : new kakao.maps.Point(27, 69)
			},//마커 표시옵션(offset : 간격)
			createMarkerImage : function() {
				return new kakao.maps.MarkerImage(this.imageSrc,
						this.imageSize, this.imageOption);
			},
			createMarkerPosition : function(place) {
				return new kakao.maps.LatLng(place.y, place.x);
			}
		},

	};

	function loadMap() {
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(
<%=hdto.getHostel_longitude()%>
	,
<%=hdto.getHostel_latitude()%>
	), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 카테고리로 은행을 검색합니다
		ps.categorySearch('CS2,OL7,SW8,BK9,AT4,FD6,CE7,PM9', placesSearchCB, {
			useMapBounds : true
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			// 				console.log(data, status, pagination);
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
				}
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			//사용해야할 값 : place.category_group_name
			//얻어내야할 값 : 마커 관련 옵션
			var markerObject = db[place.category_group_name];

			//markerObject로 마커 생성
			var marker = new kakao.maps.Marker({
				map : map,
				position : markerObject.createMarkerPosition(place),
				image : markerObject.createMarkerImage()
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	}
</script>
<style>
	#footer{
		position:inherit;
	}
</style>
</head>
<body onload="loadMap();">
	<div>
		<jsp:include page="../template/nav.jsp"></jsp:include>
	</div>
	<section class="section">
		<div class="top">
			<div class="top__gallery">
				<div class="top__image">
					<img src="<%=request.getContextPath()%>/hostel/hostel_download.do?hostel_no=<%=hostel_no%>">
				</div>
				<div class="swiper-container top__slider ">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/hostel-1.jpg" />
						</div>
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/hostel-2.jpg" />
						</div>
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/hostel-3.jpg" />
						</div>
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/hostel-4.jpg" />
						</div>
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/item3__list-1.jpg" />
						</div>
						<div class="swiper-slide">
							<img src="<%=request.getContextPath()%>/image/item3__list-2.jpg" />
						</div>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<div class="top__content">
				<h2 class="top__hostel-name"><%=hdto.getHostel_name() %></h2>
				<div class="top__review">
					<p class="top__review-star">평점 : ★★★★★</p>
				</div>
				<p class="top__hostel-addr">주소 : <%=hdto.getHostel_detail_addr() %></p>
				<p class="top__hostel-tel">전화번호 : <%=hdto.getHostel_phone() %></p>
				<div class="top__hostel-content"><%=hdto.getHostel_content() %></div>
				<div id="map" style="width: 400px; height: 200px; margin-left:auto; margin-right:0; margin-top:15px"></div>
			</div>
		</div>
		<div class="tab">
			<button id="" class="btn tab__list-btn js-list-btn">
				<span>객실정보/예약</span>
			</button>
<!-- 			<button id="" class="btn tab__location-btn js-location-btn"> -->
<!-- 				<span>위치</span> -->
<!-- 			</button> -->
			<button id="" class="btn tab__review-btn js-review-btn">
				<span>리뷰</span>
			</button>
		</div>
		<article class="tab__content">
			<%
				for (RoomDto Rdto : Rlist) {
			%>
			<section class="hostel">
				<div class="tab__room-info js-list">
					<form action="room_content.jsp" method="post">
						<div class="hostel-container">
							<div class="hostel__image">
								<img src="<%=request.getContextPath()%>/image/hostel-4.jpg" />
							</div>
							<div class="hostel__content">
								<ul>
									<li class="hostel__title"><h3><%=Rdto.getRoom_name()%></h3></li>
									<li class="hostel__intro"><span><%=Rdto.getRoom_content()%></span></li>
									<li class="hostel__info">
										<ul class="hostel__info-list">
											<li class="room-info hostel__max-people"><span>최대인원 <%=Rdto.getRoom_max_people()%>명 | </span></li>
											<li class="room-info hostel__bed"><span>침대 <%=Rdto.getRoom_bed()%>개 | </span></li>
											<li class="room-info hostel__bathroom"><span>화장실 <%=Rdto.getRoom_bath()%>개 | </span></li>
											<li class="room-info hostel__cook"><span>요리 <%=Rdto.getRoom_cook()%> | </span></li>
											<li class="room-info hostel__spa"><span>사우나 <%=Rdto.getRoom_spa()%></span></li>
										</ul>
										<ul class="hostel__info-list">
											<li class="room-info hostel__parking"><span>주차장 <%=Rdto.getRoom_parking()%> | </span></li>
											<li class="room-info hostel__pet"><span>애완동물 <%=Rdto.getRoom_pet()%> | </span></li>
											<li class="room-info hostel__wifi"><span>WIFI O | </span></li>
											<li class="room-info hostel__breakfast"><span>조식 <%=Rdto.getRoom_breakfast()%></span></li>
										</ul>
									</li>
									<li>
									<input type="hidden" name="room_no"	value="<%=Rdto.getRoom_no()%>">
									<input type="hidden" name="check_in" value="<%=check_in%>">
									<input type="hidden" name="check_out" value="<%=check_out%>">
									<input type="hidden" name="people" value="<%=people%>">
									<input type="hidden" name="hostel_no" value="<%=hostel_no%>">
									<input type="hidden" name="room_price" value="<%=Rdto.getRoom_price()%>">
									</li>
									<li></li>
								</ul>
							</div>
							<div class="hostel__price">
								<input value="상세 보기" class="submit" type="submit">
								<h3><%=Rdto.getRoom_priceWithFormat()%>원</h3>
							</div>
						</div>
					</form>
				</div>
			</section>
			<%
				}
			%>

<!-- 			<div  class="tab__location js-location"> -->
				
<!-- 			</div> -->

			<div class="tab__reivew js-review">
			
				<%for(ReviewDto rdto : list){ %>
				<% MemberDao mdao = new MemberDao();
						MemberDto mdto = mdao.memberInfomation(rdto.getCustomer_no());
						rdto.setMember_name(mdto.getName());
					%>	
				<div style="width: 50%; height: 300px; border: 1px dotted black;">
				<span style="width: 60%; height: 100%; float: left">
				<img src="<%=request.getContextPath() %>
	/review/review_download.do?review_no=<%=rdto.getReview_no() %>">
	</span>
	<span class="review_star" style="width:40%; height:50px; float: left; text-align:center; font-size: 1.5rem; padding: 20px;">
	<%int j=rdto.getStar_point(); %>
	<%for(int i=0;i<5;i++){ %>
		<%if(j>0){ %>
				<font color="#FFEE4A">★</font>
		<%}else{ %>
		★
		<%} %>
		<%j--; %>
	<%} %>
	</span>
	<span id="review" style="width:40%; height:30px; float: left; padding: 30px; font-size: 1.2rem;">
		<span style="font-size: 0.7rem;"><%=rdto.getReview_wdateWithFormat()%></span> <%=rdto.getMember_name() %>
	</span>
	<span id="review" style="width:40%; height: 220px; float: left; font-size:1.2rem; padding: 30px; border-top: 1px dotted gray;">
		<%=rdto.getReview_content() %>
	</span>
</div>
<br><br>
	<%} %>
			
			</div>
		</article>
	</section>

	<script src="<%=request.getContextPath()%>/js/slide.js"></script>
	<script src="<%=request.getContextPath()%>/js/hostel_content.js"></script>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>