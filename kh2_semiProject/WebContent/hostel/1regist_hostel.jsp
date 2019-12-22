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

        <p>숙소의 상세주소를 적어주세요</p>

        <input type="text" name="hostel_detail_addr" placeholder="숙소 상세 주소">

		<h4>(나중에 위도/경도 변환해볼것)</h4>

        <p>숙소 위도는 무엇인가요?</p>

        <input type="text" name="hostel_latitude" placeholder="숙소 위도"> 

        <p>숙소 경도는 무엇인가요?</p>

        <input type="text" name="hostel_longitude" placeholder="숙소 경도">

        <p>숙소의 이름을 정해주세요!</p>

        <input type="text" name="hostel_name" placeholder="숙소 이름">

        <p>숙소 설명을 적어주세요!</p>		 

        <table border="0" width="100%">

            <tr>
                <td colspan="2">
                    <textarea name="content" required rows="30" cols="100" style="resize:vertical;"></textarea>
                </td>
            </tr>

            <tr>
                <th>첨부파일</th>
                <td>
                    <input type="file" name="file" accept=".jpg, .png, .gif">
                </td>
            </tr>

        </table>
        
        <input class="btn" type="submit" value="다음">

    </div>

</form>

</body></html>