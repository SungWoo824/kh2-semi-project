<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div align="center">
<form action="#">

<h3>기본정보</h3>
  
<table border="1"  width="450">



<tr> 
<th>아이디</th> 
<td>
사용자아이디
</td>
</tr>

<tr> 
<th>현재 비밀번호</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>


<tr> 
<th>새 비밀번호</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>

<tr> 
<th>새 비밀번호 확인</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>

<tr> 
<th>이름</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>





<tr>
<th>우편번호</th>  
<td>
<input type="text" name="post" placeholder="우편번호" " >
</td>
</tr>

<tr>
<th>기본주소</th>  
<td>
<input type="text" name="basic_addr" placeholder="기본주소" >
</td>
</tr>

<tr> 
<th>상세주소</th> 
<td>
<input type="extra_addr" name="extra_addr" placeholder="상세주소" >
</td>
</tr>

<tr> 
<th>일반전화</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>

<tr> 
<th>휴대전화</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>


<tr> 
<th>SMS 수신여부</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>


<tr> 
<th>이메일</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>


<tr> 
<th>이메일 수신여부</th> 
<td>
<input type="text" name="phone" placeholder="phone"  required="required">
</td>
</tr>


</table>




	
	<h3>추가정보</h3>
	
	<table border="1" width="450">
	
		<tr>
			<th >성별</th>
			<td>
			<input type="checkbox" name="phone" placeholder="phone"  required="required">
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
			<input type="text" name="birthday"required="required">
			</td>
		</tr>
		
		<tr>
			<th >추천인 아이디</th>
			<td><input type="text" name="birthday"required="required"></td>
		</tr>
		
	</table>
	
	<br>	<br>
	
<tr align="right"> 
<td >
<input type="submit" value="회원정보수정">
</td>
</tr>


</form>
  </div>