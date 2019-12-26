<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//로그인 상태판정
	 	String id = (String)session.getAttribute("id");
	 	boolean login = id != null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nav-menu.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	font-family: binggrae;
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
	height: 800px;
	padding-top: 80px;
	background-image: url("../image/login5.jpg");
	background-position: center;
	background-repeat: no-repeat;
}

@font-face {
	font-family: binggrae;
	src: url("../font/NotoSansCJKkr-Medium.otf");
}

h1 {
	margin-top: 100px;
	color: #565960;
	text-align: center;
	font-size: 40px;
	letter-spacing: -1px;
}

#wrap {
	width: 360px;
	/* 	border: 1px solid #ddd; */
	border: 0px;
	padding: 15px;
	margin-bottom: 10px;
	height: 430px;
	overflow: hidden;
}

#selectbox {
	width: 300px;
	padding: 5px;
}

#region,#sigu {
	padding: 10px;
	padding-left: 0.5rem;
	padding-right: 2rem;
	margin: 30PX;
	font-size: 25px;
	outline: gray;
	border: 0px;
	font-style: italic;
	border-bottom: 1px solid  #565960;
}
#sigu {
	margin-left: 120px;
}

.btn {
	border: 1px;
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 30px;
	margin-left: 220px;
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
</style>

<script type="text/javascript">
	function categoryChange(region) {

		var 서울 = [ "--시/군/구--", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
				"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
				"서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
				"중구", "중랑구" ];

		var 부산 = [ "--시/군/구--", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구",
				"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구" ];

		var 대구 = [ "--시/군/구--", "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구",
				"중구" ];

		var 인천 = [ "--시/군/구--", "강화구", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구",
				"연수구", "옹진구", "중구" ];

		var 광주 = [ "--시/군/구--", "광산구", "남구", "동구", "북구", "서구", ];

		var 대전 = [ "--시/군/구--", "대덕구", "동구", "서구", "유성구", "중구" ];

		var 울산 = [ "--시/군/구--", "남구", "동구", "북구", "중구" ];

		var 세종 = [ "--시/군/구--", "세종시" ];

		var 경기도 = [ "--시/군/구--", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시",
				"군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시",
				"안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "의왕시",
				"의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시" ];

		var 강원도 = [ "--시/군/구--", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군",
				"양양군", "영월군", "원주시", "인제군", "정선군", "철원구", "춘천시", "태백시", "평창군",
				"홍천군", "화천군", "횡성군" ];

		var 충청북도 = [ "--시/군/구--", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군",
				"제천시", "증평군", "진천군", "청주시", "충주시" ];

		var 충청남도 = [ "--시/군/구--", "계룡시", "공주시", "금산구", "논산시", "당진시", "보령시",
				"부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군" ];

		var 전라북도 = [ "--시/군/구--", "고창군", "군산시", "김제시", "남원군", "무주군", "부안군",
				"순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군" ];

		var 전라남도 = [ "--시/군/구--", "강진군", "고흥군", "곡성군", "광샹시", "구례군", "나주시",
				"담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군",
				"완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];

		var 경상북도 = [ "--시/군/구--", "경산시", "경주시", "고령군", "구미시", "군위군", "김천시",
				"문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시",
				"예천시", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시" ];

		var 경상남도 = [ "--시/군/구--", "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시",
				"사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군",
				"함안군", "함양군", "합천군" ];

		var 제주도 = [ "--시/군/구--", "제주시", "서귀포시" ];

		var target = document.getElementById("sigu");

		if (region.value == "서울특별시")
			var d = 서울;

		else if (region.value == "부산광역시")
			var d = 부산;

		else if (region.value == "대구광역시")
			var d = 대구;

		else if (region.value == "인천광역시")
			var d = 인천;

		else if (region.value == "광주광역시")
			var d = 광주;

		else if (region.value == "대전광역시")
			var d = 대전;

		else if (region.value == "울산광역시")
			var d = 울산;

		else if (region.value == "세종시")
			var d = 세종;

		else if (region.value == "경기도")
			var d = 경기도;

		else if (region.value == "강원도")
			var d = 강원도;

		else if (region.value == "충청북도")
			var d = 충청북도;

		else if (region.value == "충청남도")
			var d = 충청남도;

		else if (region.value == "전라북도")
			var d = 전라북도;

		else if (region.value == "전라남도")
			var d = 전라남도;

		else if (region.value == "경상북도")
			var d = 경상북도;

		else if (region.value == "경상남도")
			var d = 경상남도;

		else if (region.value == "제주도")
			var d = 제주도;

		target.options.length = 0;

		for (secondselect in d) {

			var opt = document.createElement("option");
			//opt.value = d[x];
			//console.log(opt.value);  //--시군구--
			opt.innerHTML = d[secondselect];
			console.log(opt.innerHTML);
			target.appendChild(opt);
			//console.log(target.appendChild(opt));

		}
	}
</script>
</head>

<body>
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
	<%if(login){ %>

	<div class="backBody">
		<h1>숙소를 등록할 지역을 설정해주세요</h1>
		
		<div id="wrap">
			<form action="1regist_hostel.jsp" method="post">
			
				<div id="selectbox">
				
					<select id="region" onchange="categoryChange(this)"
						name="region_name">

						<option>--도/광역시/특별시--</option>

						<option>서울특별시</option>

						<option>부산광역시</option>

						<option>대구광역시</option>

						<option>인천광역시</option>

						<option>광주광역시</option>

						<option>대전광역시</option>

						<option>울산광역시</option>

						<option>세종시</option>

						<option>경기도</option>

						<option>강원도</option>

						<option>충청북도</option>

						<option>충청남도</option>

						<option>전라북도</option>

						<option>전라남도</option>

						<option>경상북도</option>

						<option>경상남도</option>

						<option>제주도</option>

					</select> 
					
					<select id="sigu" name="city_name">

						<option>--시/군/구--</option>

					</select> 
					<input class="btn" type="submit" value="다음">
					
			</div>
	</form>
		</div>
	</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	
	s <%} %>
</body>

</html>

