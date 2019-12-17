<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>숙소 설명을 등록해봅시다.</title>
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
            width: 80%;
            height: 30rem;
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

    <div class="a">
        <h1 style="color: lightsalmon">숙소를 설명해주세요!</h1>
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

        <a href="4regist_date.jsp"><input class="btn" type="button" value="다음"></a>

    </div>
</body></html>
