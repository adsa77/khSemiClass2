<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp" %>

</head>

<body id="container">
	<div id="warp">
		<%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>

		<section id="adminPageMain">
			<div id="loginDiv">
				<form action="/LoveDiary/admin/adminLogin" method="post">
					<table>
						<span id="loginSpan">로그인</span>
						<tr>
							<td><input type="text" name="id" placeholder="아이디를 입력하세요">
							</td>
						</tr>
						<tr>
							<td><input type="password" name="pwd"
								placeholder="비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td><input type="submit" value="로그인"></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		<footer id="footer"> footer </footer>
	</div>
</body>

</html>