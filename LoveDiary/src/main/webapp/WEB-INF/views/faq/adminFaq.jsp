<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>공지 목록</title>

<%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>
</head>

<body id="container">
	<div id="wrap">
		<%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>
		<%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp"%>
		<section id="adminPageMain">
			<div class="listBoardTable">
				<span class="listBoardTableTitle">자주묻는 질문</span>
				<table id="noticeBoardTable" border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${voList}" var="nvo">
							<tr>
								<td>${nvo.no}</td>
								<td><a
									href="/LoveDiary/faq/adminFaqDetail?no=${nvo.no}&writerNo=${nvo.writerNo}">${nvo.title}</a>
								</td>
								<td><c:if test="${nvo.writerNo == 1}">관리자</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div id="page-area">
					<c:if test="${pvo.currentPage > 1}">
						<a href="/LoveDiary/faq/faqList?pno=${pvo.currentPage-1}">이전</a>
					</c:if>
					<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="x">
						<c:choose>
							<c:when test="${pvo.currentPage == x}">
								<strong>${x}</strong>
							</c:when>
							<c:otherwise>
								<a href="/LoveDiary/faq/faqList?pno=${x}">${x}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pvo.currentPage < pvo.maxPage}">
						<a href="/LoveDiary/faq/faqList?pno=${pvo.currentPage+1}">다음</a>
					</c:if>
				</div>

				<div id="search-area">
					<form action="${pageContext.request.contextPath}/faq/faqList" method="post">
						<select name="faqCol" class="tableButton">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writerNo">작성자</option>
						</select>
						<input type="text" name="searchBox" id="searchBox">
						<button type="submit" class="tableButton">검색</button>
					</form>
					<c:if test="${not empty sessionScope.loginAdminVo}">
						<button id="faqInsertButton"
							onclick="location.href='/LoveDiary/faq/adminFaqInsert'">공지작성</button>
					</c:if>
				</div>

			</div>
		</section>
		<%@ include file="/WEB-INF/views/adminLayout/adminFooter.jsp"%>
	</div>
</body>

</html>
