<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리두리TODO 메모 작성</title>
<link rel="stylesheet" href="/LoveDiary/resources/css/memoinsert.css">
</head>
<body>
	<div class="container-grid">
		<div class="container">
			<h1>메모 작성</h1>
			<form action="/LoveDiary/memo/memoinsert" method="post">
				<label for="title">제목:</label> <input type="text" id="memotitle"
					name="memoTitle" required> <label for="content">내용:</label>
				<textarea id="content" name="memoContent" rows="10"
					style="resize: none;" required></textarea>

				<label for="date">날짜:</label> <input type="date" id="date"
					name="memoCheckDate" required> <input type="submit"
					value="메모 작성">
			</form>
		</div>
	</div>
</body>
</html>
