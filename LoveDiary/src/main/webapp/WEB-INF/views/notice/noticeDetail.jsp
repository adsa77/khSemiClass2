<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>공지 목록</title>

    <%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>

    <script>
        function deleteNotice(no) {
            if (confirm("정말 삭제하시겠습니까?")) {
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '/LoveDiary/notice/noticeDelete';

                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'no';
                input.value = no;

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</head>

<body id="container">
    <div id="wrap">
        <%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>
        <%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp"%>
        <section id="adminPageMain">
            <div id="noticDetail" class="tableDetailDiv">
                <span class="formTitleSpan">공지 ${vo.no}</span>
                <table class="detailTable" border="1">
                    <tr>
                        <th>작성자</th>
                        <td><c:if test="${vo.writerNo}"></c:if>관리자</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>${vo.title}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>${vo.content}</td>
                    </tr>
                </table>
                <button id="noticeEditButton" class="tableButton" onclick="location.href='/LoveDiary/notice/noticeEdit?no=${vo.no}'">공지수정</button>
                
                <button id="noticeDeleteButton" class="tableButton" onclick="deleteNotice(${vo.no})">공지삭제</button>
            </div>
        </section>
    </div>
</body>

</html>
