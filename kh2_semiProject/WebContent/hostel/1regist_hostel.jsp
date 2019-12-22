<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String region_name = request.getParameter("region_name");
	String city_name = request.getParameter("city_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>숙소 정보를 등록해봅시다!</title>
    
    <style>
        * {
            box-sizing: border-box;
        }
        .a {
            width: 70%;
            /* 내용물 가운데 정렬 */
            text-align: center;
            /* div 자신을 가운데 정렬 */
            margin-left: auto;
            margin-right: auto;
        }
       .a>input[type=text] {
            font-size: 25px;
            margin: 30px;
            padding: 10px;
        }
        .kind {
            padding: 10px;
            padding-left: 0.5rem;
            padding-right: 2rem;
            margin: 30PX;
            font-size: 25px;
        }
        p {
            font-size: 30px;
            margin: 10px;
        }
        .btn {
            border: 0;
            font-size: 18px;
            display: block;
            margin: 35px auto;
            padding: 15px 20px;
            background-color: lightsalmon;
        }
        .btn:hover {
            background-color: white;
            color: lightsalmon;
            cursor: pointer;
        }
    </style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function getLatLog(){
    	
    	var addr = document.querySelector('#sample6_address').value;
    	console.log(addr);
    	
    	var oReq = new XMLHttpRequest();
    	
    	oReq.onreadystatechange = function(){
    		debugger
    		if(oReq.readystate == 4 && oReq.status ==200){
    			var data = JSON.parse(oReq.responseText).documents.x;
    	    	console.log(data);
    		}
    			
    		
    	}
    	/* oReq.addEventListener("load", reqListener); */
    	oReq.open("GET", "https://dapi.kakao.com/v2/local/search/address.json?query="+addr);
    	
    	oReq.setRequestHeader("Authorization", "KakaoAK d772651d091a5ca1d7dc5670526b357f");
    	
    	oReq.send();
    	console.log(oReq);
    	
    	
    }
</script>
</head>

<body>
<form action="hostel_regist.do" method="get">
    <div class="a">
        <h1 style="color: lightsalmon">판매자 등록 페이지(1단계 숙소 정보)</h1>
        
        <input type="hidden" name="region_name" value="<%=region_name%>" >
        <input type="hidden" name="city_name" value="<%=city_name%>">
        		
        <p>등록하실 숙소 종류는 무엇인가요?</p>
		
        <select class="kind" name="hostel_kind_name">

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

        <p>숙소 연락처를 적어 주세요.</p>

        <input type="text" name="hostel_phone" placeholder="숙소 연락처">       

        <p>숙소의 상세주소를 등록하세요</p>
		
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" readonly><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" onfocus="getLatLog()">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">

        <p>숙소의 이름을 정해주세요!</p>

        <input type="text" name="hostel_name" placeholder="숙소 이름">
		
        <input type="hidden" name="hostel_content" value="일단 null">
        <input type="hidden" name="x">
        <input type="hidden" name="y">
        <input class="btn" type="submit" value="다음">

    </div>

</form>

</body></html>