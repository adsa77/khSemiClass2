<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>공지 목록</title>

<%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>
</head>

<body id="container">
	<div id="wrap">
		<%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>
		<%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp"%>
		<section id="mainLoginDiv">
			<form action="/LoveDiary/notice/noticeInsert" method="post" enctype="multipart/form-data">
				<label for="title">Title:</label>
        		<input type="text" id="title" name="title" required><br><br>
        		<label for="content">Content:</label>
        		<textarea id="content" name="content" required></textarea><br><br>
				<input type="submit" value="작성하기">
			</form>

		</section>
	</div>
</body>

</html>