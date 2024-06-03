<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>FAQ 상세</title>

    <%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>

    <script>
        function deleteFaq(no) {
            if (confirm("정말 삭제하시겠습니까?")) {
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '/LoveDiary/faq/adminFaqDelete';

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
            <div id="faqDetail" class="tableDetailDiv">
                <span class="formTitleSpan">FAQ ${fvo.no}</span>
                <table class="detailTable" border="1">
                    <tr>
                        <th>작성자</th>
                        <td><c:if test="${fvo.writerNo == 1}">관리자</c:if></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>${fvo.title}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>${fvo.content}</td>
                    </tr>
                </table>
                <button id="faqEditButton" class="tableButton" onclick="location.href='/LoveDiary/faq/adminFaqEdit?no=${fvo.no}'">FAQ 수정</button>
                
                 <button id="faqDeleteButton" class="tableButton" onclick="deleteFaq(${fvo.no})">FAQ 삭제</button>
            </div>
        </section>
    </div>
    <%@ include file="/WEB-INF/views/adminLayout/adminFooter.jsp"%>
</body>

</html>
