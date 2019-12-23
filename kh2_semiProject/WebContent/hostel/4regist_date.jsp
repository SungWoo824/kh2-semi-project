<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String id = (String) session.getAttribute("id");
	boolean login = id != null; 
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
	<form action="5regist_success.jsp">
    <div class="a">
        <h1 style="color: lightsalmon">판매자 등록 페이지(4단계 날짜 정보)</h1>
        <p>호스팅을 시작할 날짜를 정해주세요</p>
        <input id="date" type="date" name="hosting_start">
        <p>호스팅을 종료할 날짜를 정해주세요</p>
        <input id="date" type="date" name="hosting_finish">
        <input class="btn" type="submit" value="등록하기">
    </div>
    </form>
</body></html>