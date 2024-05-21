<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>공지 목록</title>

        <%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp" %>
    </head>

    <body id="container">
        <div id="wrap">
            <%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp" %>
                <%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp" %>
                    <section id="mainLoginDiv">
                        <div id="noticeBoard">
                            <h1>공지 목록</h1>
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
                                                    href="/LoveDiary/notice?no=${nvo.no}&writerNo=${nvo.writerNo}">${nvo.title}</a>
                                            </td>
                                            <td>
                                                <c:if test="${nvo.writerNo == 1}">관리자</c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <c:if test="${not empty sessionScope.loginAdminVo}">
                                <div>
                                    <button onclick="location.href='/LoveDiary/notice/noticeInsert'">공지 작성</button>
                                </div>
                            </c:if>

                            <div id="page-area">
                                <c:if test="${pvo.currentPage > 1}">
                                    <a href="/LoveDiary/notice/noticeList?pno=${pvo.currentPage-1}">이전</a>
                                </c:if>
                                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="x">
                                    <c:choose>
                                        <c:when test="${pvo.currentPage == x}">
                                            <strong>${x}</strong>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/LoveDiary/notice/noticeList?pno=${x}">${x}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${pvo.currentPage < pvo.maxPage}">
                                    <a href="/LoveDiary/notice/noticeList?pno=${pvo.currentPage+1}">다음</a>
                                </c:if>
                            </div>
                        </div>

                    </section>
        </div>
    </body>

    </html>