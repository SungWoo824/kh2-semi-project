<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <p>등록하실 숙소 종류는 무엇인가요?</p>

        <select class="kind" name="hostel_kind_name">
            <option value="">선택하세요!</option>
            <option>아파트</option>
            <option>빌라</option>
            <option>단독 주택</option>
            <option>호텔</option>
        </select>

        <p>숙소 연락처를 적어 주세요.</p>

        <input type="text" name="hostel_phone" placeholder="숙소 연락처">

        <p>숙소 주소는 무엇인가요?</p>

        <input type="text" name="hostel_detail_addr" placeholder="숙소 상세 주소">
		
		<h4>(나중에 위도/경도 변환해볼것)</h4>
        <p>숙소 위도는 무엇인가요?</p>

        <input type="text" name="hostel_latitude" placeholder="숙소 위도">

        <p>숙소 경도는 무엇인가요?</p>

        <input type="text" name="hostel_longitude" placeholder="숙소 경도">


        <p>숙소의 이름을 정해주세요!</p>

        <input type="text" name="hostel_name" placeholder="숙소 이름">
        
        <p>숙소 설명!</p>
        <h5>(나중에 따로 페이지 만들것)</h5>
        <input type="text" name="hostel_content" placeholder="숙소 설명">

        <input class="btn" type="submit" value="다음">

    </div>
</form>


</body></html>
