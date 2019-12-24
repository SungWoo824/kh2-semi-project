<%@page import="beans.QaReplyDto"%>
<%@page import="beans.QaReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int qa_reply_no = Integer.parseInt(request.getParameter("no"));
	QaReplyDao dao = new QaReplyDao();
	QaReplyDto dto = dao.get(qa_reply_no);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="qa_reply_edit.do">
	<input type="hidden" name="qa_reply_no" value="<%=qa_reply_no %>">
	<input type="text" name="qa_reply_content" value="<%=dto.getQa_reply_content() %>">
	<input type="submit">
	</form>
</body>
</html>