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
	HostelDao hdao = new HostelDao();
	HostelDto hdto = hdao.hostelinfomation(hostel_no);
	ReviewDao rdao = new ReviewDao();
	List<ReviewDto>list = rdao.hostel_review_list(hostel_no);
	RoomDao Rdao = new RoomDao();
	List<RoomDto>Rlist = Rdao.hostel_room_list(hostel_no);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=534248faec0557257f5c7cc9e504a2da&libraries=services"></script>
	<script>
		var db = {
			//이름:마커객체
			편의점:{
				imageSrc:'../image/편의점.jpg',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			약국:{
				imageSrc:'../image/약국.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			주유소:{
				imageSrc:'../image/주유소.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			지하철역:{
				imageSrc:'../image/지하철.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			은행:{
				imageSrc:'../image/은행.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			관광명소:{
				imageSrc:'../image/관광명소.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			음식점:{
				imageSrc:'../image/음식점.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			카페:{
				imageSrc:'../image/카페.png',//이미지경로
				imageSize:new kakao.maps.Size(30, 30),//이미지 크기
				imageOption:{offset: new kakao.maps.Point(27, 69)},//마커 표시옵션(offset : 간격)
				createMarkerImage:function(){
					return new kakao.maps.MarkerImage(this.imageSrc, this.imageSize, this.imageOption);
				},
				createMarkerPosition:function(place){
					return new kakao.maps.LatLng(place.y, place.x);
				}
			},
			
		};
	
		function loadMap(){
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(<%=hdto.getHostel_longitude()%>, <%=hdto.getHostel_latitude()%>), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(map); 

			// 카테고리로 은행을 검색합니다
			ps.categorySearch('CS2,OL7,SW8,BK9,AT4,FD6,CE7,PM9', placesSearchCB, {useMapBounds:true}); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
// 				console.log(data, status, pagination);
			    if (status === kakao.maps.services.Status.OK) {
			        for (var i=0; i<data.length; i++) {
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
			        map: map,
			        position: markerObject.createMarkerPosition(place),
			        image:markerObject.createMarkerImage()
			    });
			    
			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
		}
	</script>
</head>
<body onload="loadMap();">
	호텔넘버:<%=hdto.getHostel_no() %><br>
	오너넘버<%=hdto.getOwner_no() %><br>
	지역넘버<%=hdto.getRegion_no() %><br>
	지역이름<%=hdto.getRegion_name() %><br>
	호텔이름<%=hdto.getHostel_name() %><br>
	상세주소<%=hdto.getHostel_detail_addr() %><br>
	호텔종류<%=hdto.getHostel_kind_name() %><br>
	
	<div id="map" style="width:500px;height:400px;"></div>
	<br><br>
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ방자리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br><br>
	<%for(RoomDto Rdto : Rlist){ %>
		
	<a href="room_content.jsp?room_no=<%=Rdto.getRoom_no() %>">	룸번호<%=Rdto.getRoom_no() %></a>
		호텔번호<%=Rdto.getHostel_no() %>
		룸가격<%=Rdto.getRoom_price() %>
		기본인원<%=Rdto.getRoom_standard_people() %>
		최대인원<%=Rdto.getRoom_max_people() %>
		침대<%=Rdto.getRoom_bed() %>
		화장실<%=Rdto.getRoom_bath() %>
		스파<%=Rdto.getRoom_spa() %>
		요리<%=Rdto.getRoom_cook() %>
		방설명<%=Rdto.getRoom_content() %>
		주차<%=Rdto.getRoom_parking() %>
		펫<%=Rdto.getRoom_pet() %>
		아침식사<%=Rdto.getRoom_breakfast() %>
		룸베이직<%=Rdto.getRoom_basic() %>
		티비<%=Rdto.getRoom_tv() %>
		헤어드라이기<%=Rdto.getRoom_dry() %>
		에어컨<%=Rdto.getRoom_cool() %>
		난방<%=Rdto.getRoom_hot() %>
		방이름<%=Rdto.getRoom_name() %><br><br>
	<%} %>
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ리뷰자리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br><br>
	<%for(ReviewDto rdto : list){ %>
	리뷰넘버<%=rdto.getReview_no() %>
	예약넘버<%=rdto.getReservation_no() %>
	고객넘버<%=rdto.getCustomer_no() %>
	호텔넘버<%=rdto.getHostel_no() %>
	리뷰내용<%=rdto.getReview_content() %>
	별점<%=rdto.getStar_point() %>
	리뷰시간<%=rdto.getReview_date() %>
	<br><br>
	<%} %>
</body>
</html>