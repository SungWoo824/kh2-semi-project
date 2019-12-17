<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

 <style>
        .table {
            width: 100%;
            border: 1px solid black;
            /*            테두리 병합*/
            border-collapse: collapse;
        }

        .table>thead>tr>td,
        .table>thead>tr>th,
        .table>tbody>tr>td,
        .table>tbody>tr>th {
            border: 1px solid black;
            padding: 0.5rem;
        }
    </style>
</head>
<body>
 <div align="center">
        <form action="member/info.jsp"></form>


        <table border="1">


            <h2>회원정보수정</h2>


            <tr>
                <th>아이디</th>
                <td>
                    아이디값
                </td>
            </tr>

            <tr>
                <th>현재 비밀번호</th>
                <td>
                    <input type="text" name="phone" required="required">
                </td>
            </tr>

            <tr>
                <th>새 비밀번호</th>
                <td>
                    <input type="text" name="phone"required="required">
                </td>
            </tr>

            <tr>
                <th>새 비밀번호 확인</th>
                <td>
                    <input type="text" name="phone" required="required">
                </td>
            </tr>

            <tr>
                <th>이름</th>
                <td>
                    이름값
                </td>
            </tr>

            <tr>
                <th>전화번호</th>
                <td>
                    <input type="text" name="phone"  required="required">
                </td>
            </tr>


            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="phone" required="required">
                </td>
            </tr>

            <tr>
                <th>생일</th>
                <td>
                    <input type="text" name="phone" required="required">
                </td>
            </tr>


            <tr align="right">
                <td>
                    <input type="submit" value="회원정보수정">
                </td>
            </tr>



        </table>
    </div>


</body>
</html>