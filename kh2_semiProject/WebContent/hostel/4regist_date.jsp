<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 날짜를 등록해봅시다!</title>

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

.date{
	border: none;
	margin: 50px auto;
}

.a>input[type=number] {
	font-size: 25px;
	margin: 30px;
	padding: 10px;
}

.a>input[type=text] {
	font-size: 25px;
	width: 40%;
	height: 10rem;
	padding: 10px;
}

p {
	font-size: 30px;
	margin: 10px;
	padding: 20px;
}

.convenience>.check {
	display: block;
	margin: 10px auto;
}

.convenience {
	text-align: center;
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

input[type=checkbox]:checked+label {
            background-color: yellow;
        }

     
</style>

<script>
	function back(tag){
// 		tag는 클릭한 td 태그를 쳐다보는 객체
// 		우리는 색상을 부여할지 말지 알아내야 하므로 tag안에 있는 input[type=checkbox]를 쳐다보는 객체를 얻어내야함
// 		- tag.childNodes : tag 객체의 하위요소들 전체 목록정보
// 		- tag.childNodes.item(n) : 목록중 n번위치 태그(현재 checkbox는 1번위치 태그)
		
		console.log(tag.childNodes);
		
		var checkbox = tag.childNodes.item(1);
// 		console.log(checkbox.checked);
		
		if(checkbox.checked){
			checkbox.checked = false;//체크를 해제
			tag.style.backgroundColor = "white";
		}
		else{
			checkbox.checked = true;//체크를 설정
			tag.style.backgroundColor = "lightpink";
			console.log(checkbox.value);
		}
	}
</script>

</head>
<body>
	<form action="5regist_success.jsp" method="get">
		<div class="a">

		<h1 style="color: lightsalmon">판매자 등록 페이지(4단계 날짜 정보)</h1>
		<h3>(예약 차단 날짜 설정)</h3>
		<%
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int date = cal.get(Calendar.DATE);
			String today = year + ":" + (month + 1) + ":" + date; // 오늘 날짜
			int numtoday = year * 13 + (month + 1) * 15 + date * 17;
			// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
			cal.set(year, month, 1);

			// 셋팅한 날짜로 부터 아래 내용을 구함

			// 해당 월의 첫날를 구함
			int startDate = cal.getMinimum(Calendar.DATE);

			// 해당 월의 마지막 날을 구함
			int endDate = cal.getActualMaximum(Calendar.DATE);

			// 1일의 요일을 구함
			int startDay = cal.get(Calendar.DAY_OF_WEEK);
			int count = 0;
		%>
		<table class="date" width="90%" border="1" align="center" >
		
		<tr height="50" >
			 <td colspan="2">
			 <label onclick="prevCalendar()"><</label></td>
			 <td colspan="3"><%=year %>년 <%=month + 1%>월</td>
			 <td colspan="2"><label onclick="nextCalendar()">></label>
			 </td>
		</tr>
		
			<tr height="50">
				<td><font size="5">일</font></td>
				<td><font size="5">월</font></td>
				<td><font size="5">화</font></td>
				<td><font size="5">수</font></td>
				<td><font size="5">목</font></td>
				<td><font size="5">금</font></td>
				<td><font size="5">토</font></td>
			</tr>
			
		<tr height="50">

				<%
					for (int i = 1; i < startDay; i++) {
						count++;
				%>
				<td>&nbsp;</td>

				<%
					}
					for (int i = startDate; i <= endDate; i++) {
						
// 						String bgcolor = (today.equals(year + ":" + (month + 1) + ":" + i)) ? "#CCCCCC" : "#FFFFFF";
						String bgcolor;
						if(today.equals(year + ":" + (month + 1) + ":" + i)){//현재 날짜라면
							bgcolor = "lightsalmon";
						}
						else{
							bgcolor = "white";
						}
						
// 						String color = (count % 7 == 0 || count % 7 == 6) ? "red" : "black";
						String color;
						if(count % 7 == 0){//일요일이라면
							color = "red";
						}
						else if(count % 7 == 6){//토요일이라면
							color = "blue";
						}
						else{
							color = "black";
						}
						
						count++;
				%>

<!-- 				현재 날짜에 체크X / 그 이전 날짜에 체크 안되게 하기-->
				<%if(numtoday >= (year * 13 + (month + 1) * 15 +  i * 17) ){%>
					<td bgcolor="<%=bgcolor%>">
				<%}else{%>
					<td bgcolor="<%=bgcolor%>" onclick="back(this);" style="cursor:pointer;">
				<% }%>
               	<input type="checkbox" name="date" value="10-<%=i%>" style="display:none;">
                <font color="<%=color %>"><%=i%></font>
				</td>
				
				
				<%
					if (count % 7 == 0 && i < endDate) {
				%>

			</tr>

			<tr height="50">
				<%
					}
					}
					while (count % 7 != 0) {
				%>
				<td>&nbsp;</td>
				<%
					count++;
					}
				%>
			</tr>
	
		</table>

		<table>
			<thead>
				<tr>
					<th>예약 차단 날짜</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td>뭐</td>		
				</tr>
				
			</tbody>
		</table>

			<input class="btn" type="submit" value="등록하기">
	</div>

</body>
</html>