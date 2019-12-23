<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	
	int room_price = Integer.parseInt(request.getParameter("room_price"));
	int room_standard_people = Integer.parseInt(request.getParameter("room_standard_people"));
	int room_max_people = Integer.parseInt(request.getParameter("room_max_people"));
	int room_bed = Integer.parseInt(request.getParameter("room_bed"));
	int room_bath = Integer.parseInt(request.getParameter("room_bath"));
	String room_spa = request.getParameter("room_spa");
	String room_cook = request.getParameter("room_cook");
	String room_parking = request.getParameter("room_parking");
	String room_pet = request.getParameter("room_pet");
	String room_basic = request.getParameter("room_basic");
	String room_tv = request.getParameter("room_tv");
	String room_dry = request.getParameter("room_dry");
	String room_cool = request.getParameter("room_cool");
	String room_hot = request.getParameter("room_hot");
	String room_breakfast = request.getParameter("room_breakfast");
	String room_name = request.getParameter("room_name");
	String room_content = request.getParameter("room_content");
// 	if(room_spa.equals("null")){
// 		room_spa="X";
// 	}
	if(room_spa == null){
		room_spa="x";
	}
	if(room_cook == null){
		room_cook="X";
	}
	if(room_parking == null){
		room_parking="X";
	}
	if(room_pet == null){
		room_pet="X";
	}
	if(room_basic == null){
		room_basic="X";
	}
	if(room_tv == null){
		room_tv="X";
	}
	if(room_dry == null){
		room_dry="X";
	}
	if(room_cool == null){
		room_cool="X";
	}
	if(room_hot == null){
		room_hot="X";
	}
	if(room_breakfast == null){
		room_breakfast="X";
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>

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

        p {
            font-size: 30px;
            margin: 10px;
            padding: 20px;
        }

        .a>input[type=date] {
            font-size: 30px;
            width: 22%;
            height: 4rem;
            padding: 10px 10px;
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
	<form action="room_info_regist.do">
    <div class="a">
        <h1 style="color: lightsalmon">판매자 등록 페이지(4단계 날짜 정보)</h1>
        <input type="hidden" name="room_price" value="<%=room_price %>">
        <input type="hidden" name="room_standard_people" value="<%=room_standard_people %>">
        <input type="hidden" name="room_max_people" value="<%=room_max_people %>">
        <input type="hidden" name="room_bed" value="<%=room_bed %>">
        <input type="hidden" name="room_bath" value="<%=room_bath %>">
        <input type="hidden" name="room_spa" value="<%=room_spa %>">
        <input type="hidden" name="room_cook" value="<%=room_cook %>">
        <input type="hidden" name="room_parking" value="<%=room_parking %>">
        <input type="hidden" name="room_pet" value="<%=room_pet %>">
        <input type="hidden" name="room_basic" value="<%=room_basic %>">
        <input type="hidden" name="room_tv" value="<%=room_tv %>">
        <input type="hidden" name="room_dry" value="<%=room_dry %>">
        <input type="hidden" name="room_cool" value="<%=room_cool %>">
        <input type="hidden" name="room_hot" value="<%=room_hot %>">
        <input type="hidden" name="room_breakfast" value="<%=room_breakfast %>">
        <input type="hidden" name="room_name" value="<%=room_name %>">
        <input type="hidden" name="room_content" value="<%=room_content %>">
        <p>호스팅을 시작할 날짜를 정해주세요</p>
        <input id="date" type="date" name="start_hosting">
        <p>호스팅을 종료할 날짜를 정해주세요</p>
        <input id="date" type="date" name="finish_hosting">
        <input class="btn" type="submit" value="등록하기">
    </div>
    </form>
</body></html>