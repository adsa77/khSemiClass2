<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>공휴일 목록</title>

<%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>

</head>

<body id="container">
	<div id="wrap">
		<%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>
		<%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp"%>
		<section id="adminPageMain">
			<div class="listBoardTable">
				<span class="listBoardTableTitle">공휴일 목록</span>
				<table id="noticeBoardTable" border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>공휴일</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${voList}" var="hvo">
							<tr>
								<td>${hvo.no}</td>
								<td><a
									href="/LoveDiary/calender/adminEditCalenderList?no=${hvo.no}&writerNo=${hvo.writerNo}">${hvo.title}</a>
								</td>
								<td>${hvo.holidayDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div id="page-area">
					<c:if test="${pvo.currentPage > 1}">
						<a href="/LoveDiary/calender/adminEditCalenderList?caPvo=${pvo.currentPage-1}">이전</a>
					</c:if>
					<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="x">
						<c:choose>
							<c:when test="${pvo.currentPage == x}">
								<strong>${x}</strong>
							</c:when>
							<c:otherwise>
								<a href="/LoveDiary/notice/noticeList?caPvo=${x}">${x}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pvo.currentPage < pvo.maxPage}">
						<a href="/LoveDiary/calender/adminEditCalenderList?caPvo=${pvo.currentPage+1}">다음</a>
					</c:if>
				</div>

				<div id="search-area">
					<form action="${pageContext.request.contextPath}/calender/adminEditCalenderList" method="post">
						<select name="noticeCol" class="tableButton">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writerNo">작성자</option>
						</select>
						<input type="text" name="searchBox" id="searchBox">
						<button type="submit" class="tableButton">검색</button>
					</form>
					<c:if test="${not empty sessionScope.loginAdminVo}">
						<button id="noticeInsertButton"
							onclick="location.href='/LoveDiary/calender/noticeInsert'">공휴일 작성</button>
					</c:if>
				</div>

			</div>
		</section>
		<%@ include file="/WEB-INF/views/adminLayout/adminFooter.jsp"%>
	</div>
</body>

</html>