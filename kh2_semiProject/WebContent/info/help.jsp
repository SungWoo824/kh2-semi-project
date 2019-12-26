<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nav-menu.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
<meta charset="UTF-8">
<title>예약 안내 페이지</title>
<style type="text/css">
@font-face{
    font-family: binggrae;
    src:url("../font/NotoSansCJKkr-Medium.otf");
	}
.block {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 0;
}	
 
#date{
	display: block;
    margin: 1em 0 2em;
    padding: 4px;
    border-radius: 4px;
    border: 1px solid #d6d6d6;
    box-sizing: border-box;
}
#top{
	margin-top: 100px;
	caption-side: 10px;
	font-family: binggrae;
}
.info > .a > p+{
	font-family: binggrae;
}
 
#head, #middle, #low, #low-foot{
	font-family: binggrae;
}
 
#master1{
	font-family: binggrae;
	display: block;
    margin: 1em 0 2em;
    padding: 4px;
    border-radius: 4px;
    border: 1px solid #d6d6d6;
    box-sizing: border-box;
}
 
/* .backBody{
	height: 1200px;
	padding-top:40px;
	background-image: url("../image/white.jpg"); background-position:center; background-repeat: no-repeat; 
} */
</style>
</head>
<body class="backBody">
	<div>
		<jsp:include page="/template/nav.jsp"></jsp:include>
	</div>
 
<div class="info" align="center">
	<article class="a">
	<div id="top" align="center">
		<h1>묵고 더블로가 이용방법</h1>
		
		묵고 더블로가는 대한민국 전역의 호텔을 예약함과 동시에 , AirBnb의 숙소 호스트 기능을 결합한 새로운 방식의 사이트입니다.<br>
		각 예약 사이트와 비교하여 최저가의 상품을 고객님께서 찾으시도록 도와드리며, 숙소 등록을 통한 이윤을 창출해보시기 바랍니다. 
		<p id="head">
		<h2>
			<font color="red">저희 묵고 더블로가 이용방법은 2가지 방법이 있습니다.</font><br>
		</h2>	
			<h3>◎호텔 및 숙박 이용을 원하시는분◎<br></h3>
			1) 원하시는 목적지를 검색해주세요. 대한민국 방방곡곡으로 모시겠습니다.
			<img id="date" src="../image/사용자_목적지.jpg">
		</p>	
	</div>
				
			
			
	
	<div align="center">
		<p id="middle">
			2) 원하시는 날짜를 지정해주세요.(체크인 날짜 /체크아웃 날짜)<br>
			여름휴가 기간, 겨울방학 기간은 예약이 많은 시기라 원하시는 날짜에 이용이 불가하실 수 있는점 양해부탁드립니다.
		</p>	
		<img src="../image/날짜선택.jpg">
	</div>
	
	<div align="center">
		<p id="low">
			3) 투숙하실 인원을 정해주세요. 12세이하 까지 어린이로 분류되며,<br>
			어린이는 최대 5명까지만 예약하실 수 있는점 양해부탁드립니다.<br>    
			(어린이 2명일 경우 성인 1명으로 가격이 측정되는점 참고 부탁드립니다.)  
		</p>
		<img src="../image/성인_어린이등록.jpg">
	</div>
	
	<div align="center">
		<p id="low-foot">
			<h3>◎숙소를 호스팅하시는분◎<br></h3>
			<font color="red">※ 묵고 더블로가 호스팅을 추천하는 이유 ※<br></font>
			묵고 더블로가는 호스트가 공유하는 숙소의 유형과 관계없이 <br>
			게스트를 쉽고 안전하게 호스팅할 수 있도록 해줍니다.<br> 
			예약 가능일, 요금, 숙소 이용규칙, 게스트와의 교류 방식은 전적으로 호스트가 결정합니다.
		</p>
	</div>
	
	<div align="center">
		<p id="master1">
			1) 무료 숙소 등록하기 <br>
			2) 호스팅 세부 사항 설정하기 <br>
			호스팅할 수 있는 날짜, 숙소 요금, 게스트 필수요건을 선택하세요.<br> 
			묵고더블로가 가 호스팅 전반에 걸쳐 도움을 드립니다.<br>
			3) 숙소가 게시되면 설정하신 예약 조건에 부합하는 게스트가 연락을 할 거예요.<br> 
			게스트를 맞이하기 전에 궁금한 점이 있으면 언제든 메시지로 물어볼 수 있습니다.
		</p>
	</div>
	</article>
</div>
	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>