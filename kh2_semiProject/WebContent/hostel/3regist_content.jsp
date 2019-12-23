<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hostel_name = (String)session.getAttribute("hostel_name");
%>
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
	<form action="/hostel/hostel_content_regist.do" method="get">
    <div class="a">

        <h1 style="color: lightsalmon">숙소를 설명해주세요!</h1>
		
		<input type="hidden" name="hostel_name" value="<%=hostel_name%>" >
        <table border="0" width="100%">

            <tr>
                <td colspan="2">
                    <textarea name="content" required rows="30" cols="100" style="resize:vertical;"></textarea>
                </td>
            </tr>

<!--             <tr> -->
<!--                 <th>첨부파일</th> -->
<!--                 <td> -->
<!--                     <input type="file" name="file" accept=".jpg, .png, .gif"> -->
<!--                 </td> -->
<!--             </tr> -->

        </table>

        <input class="btn" type="submit" value="다음">

    </div>
</form>
</body></html>