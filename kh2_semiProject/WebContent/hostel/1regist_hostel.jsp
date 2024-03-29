<%@page import="beans.HostelDto"%>
<%@page import="beans.HostelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String region_name = request.getParameter("region_name");
	String city_name = request.getParameter("city_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>숙소 정보를 등록해봅시다!</title>

<style>
* {
	font-family: binggrae;
}
.w-100 master-menu{
	background-color: #efefef;
}
body, h1, h2, h3, #wrap, #loginbox, input, label {
	margin: 0 auto;
	padding: 0;
	border: 0
}

body {
	background-color: #efefef;
	color: #333;
	font-size: 0.8em;
	font-family: "돋음", dotum, "굴림", gulim, 'Apple SD Gothic Neo', Helvetica,
		sans-serif
}

.backBody {
	width: 100%;
	height: 1100px;
	padding-top: 80px;
 	background-image: url("../image/2.jpg");
 	background-size: 1685px;
 	background-color: #D8DFE5;
	background-position: center;
	background-repeat: no-repeat;
}

@font-face {
	font-family: binggrae;
	src: url("../font/NotoSansCJKkr-Medium.otf");
}

h1 {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 100px;
	text-align: left;
	font-size: 40px;
	letter-spacing: -1px
}

#wrap-left {
	display: inline-block;
	width: 440px;
	padding: 15px;
	margin-bottom: 10px;
	height: 750px;
	overflow: hidden;
	margin-left: 80px;
	margin-top: 10px;
	padding-top: 0px;
	background-color: #efefef;
	border-top-right-radius: 10%; 
 	border-bottom-left-radius: 10%;
}
#wrap-right {
	display: inline-block;
	width: 440px;
/* 	border: 1px solid #ddd;
/* 	background-color: rgba(255,255,255,0.3); */
	padding: 10px;
	margin-bottom:10px;
	height: 750px;
	overflow: hidden;
	margin-left: 20px;
	margin-right: 50px;
	margin-top: 10px;
	padding-top: 0px;
	border-left-width: 2px;
	background-color: #efefef;
	border-top-right-radius: 10%; 
 	border-bottom-left-radius: 10%;
}
p{
	font-size: 22px;
	margin: 150px opx;
}
#hostelbox1 {
	width: 95%;
	height: 700px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
}
#kind {
	border-bottom: 1px solid #565960 ;
    padding: 5px;
    padding-left: 0.5rem;
    padding-right: 2rem;
  	margin: 10PX;
	font-size: 20px;
	width: 320px;
	outline: #565960; 
        }
#hostelbox1 input[type=text] {
	outline: #565960; 
	font-size: 1rem;
	border-bottom: 1px solid #565960 ;
	width: 400px;
	height: 3rem;
	padding: 10px;
	

}
#hostelbox1>#postcode {
	width: 200px;
}
#hostelbox1>#address {
	width: 381px;
}
#hostelbox1>#detailAddress {
	width: 230px;
	margin: 5px 0px;
}

#hostelbox1>#extraAddress {
	width: 144px;
}

#hostelbox2 {
	width: 900px;
	height: 1000px;
	padding: 5px;
	margin: opx;
	font-size: 1.5rem;
}
a {
	text-decoration: none;
	color: #333;
}

.btn {
	border: 1px;
	font-size: 20px;
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-right: 380px;
	padding: 6px 8px 10px 10px;;
	background-color: #565960;
	height: 40px;
	width: 80px;
}

.btn:hover {
	background-color: #EFEFEF;
	color: #565960;
	cursor: pointer;
}
.btn-1 {
	display: inline-block;
	border: 1px;
	font-size: 15px;
	margin: 5px auto;
	padding: 5px 10px;
	background-color: #565960;
	height: 40px;
	width: 120px;
	
}
</style>

</head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=534248faec0557257f5c7cc9e504a2da&libraries=services"></script>
<script>
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	function loadMap() {
		// 입력창의 결과값을 불러옵니다.
		var addr = document.querySelector("#address").value;
		//입력값이 없으면 종료
		if (!addr)
			return;

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				debugger;
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 결과값으로 받은 위치를 마커로 표시합니다
				console.log(coords);
				var lat = coords.Ga;
				var log = coords.Ha;
				document.addr.hostel_latitude.value = lat;
				document.addr.hostel_longitude.value = log;
			}
		});
	}
</script>
<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<div class="backBody">
		<h1>2단계 : 숙소의 정보를 등록하세요!</h1>
	
		<form name="addr" action="hostel_regist.do" method="post" enctype="multipart/form-data">
		<div id="wrap-left">

				<div id="hostelbox1">

					<input type="hidden" name="region_name" value="<%=region_name%>">
					<input type="hidden" name="city_name" value="<%=city_name%>">

					<p>  ▶ 등록하실 숙소 종류는 무엇인가요?</p>

					<select id="kind" name="hostel_kind_name">

						<option value="">선택하세요!</option>
						<option>아파트</option>
						<option>빌라</option>
						<option>단독 주택</option>
						<option>펜션</option>
						<option>산장</option>
						<option>호텔</option>
						<option>리조트</option>
						<option>초소형 주택</option>
						<option>캠핑카</option>


					</select>

					<p>  ▶ 숙소의 이름을 정해주세요!</p>
					<input type="text" name="hostel_name" placeholder="숙소 이름">

					<p>  ▶ 숙소의 주소를 적어주세요</p>

					<!--         <input type="text" name="hostel_detail_addr" placeholder="숙소 상세 주소"> -->
					<input type="text" id="postcode" name="postcode" placeholder="우편번호"> 
					<input type="button" class="btn-1" onclick="DaumPostcode()"value="우편번호 찾기"><br> 
					<input type="text" id="address" name="address" placeholder="주소"><br> 
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" onfocus="loadMap()"> 
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
					
					<input type="hidden" name="hostel_latitude" value=""> 
					<input type="hidden" name="hostel_longitude" value="">

					<p>  ▶ 숙소 연락처를 적어 주세요.</p>

					<input type="text" name="hostel_phone" placeholder="숙소 연락처">
				</div>
			
		</div>
				
					
		<div id="wrap-right">
		

				<div id="hostelbox2">

					<p>  ▶ 숙소 설명을 적어주세요</p>

					<table border="0" width="90%">

						<tr>
							<td colspan="2"><textarea name="hostel_content" required
									rows="30" cols="52" style="resize: vertical;"></textarea></td>
						</tr>

						<tr style="font-size: 15px;">
							<th>첨부파일    </th>
							<td><input type="file" name="file" accept=".jpg, .png, .gif">
							</td>
						</tr>

					</table>
				</div>
				</div>
					<input class="btn" type="submit" value="다음">
			</form>
		
	</div>

</body>
</html>