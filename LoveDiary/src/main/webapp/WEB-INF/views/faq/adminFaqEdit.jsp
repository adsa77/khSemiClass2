<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>FAQ 수정</title>

    <%@ include file="/WEB-INF/views/adminLayout/adminUtil.jsp"%>
</head>

<body id="container">
    <div id="wrap">
        <%@ include file="/WEB-INF/views/adminLayout/adminHeader.jsp"%>
        <%@ include file="/WEB-INF/views/adminLayout/adminNav.jsp"%>
        <section id="adminPageMain">
            <div class="insertBoxDiv">
                <form action="/LoveDiary/faq/adminFaqEdit" method="post" class="insertForm">
                    <span class="formTitleSpan">FAQ 수정</span>
                    <input type="hidden" name="no" value="${FaqVo.no}">
                    <table class="insertTable">
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" value="${FaqVo.title}" placeholder="제목을 입력하시오." id="title" class="title"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea name="content" placeholder="내용을 입력하시오." id="content" class="content">${FaqVo.content}</textarea></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="수정하기" class="formSubmit">
                </form>
            </div>
        </section>
        <%@ include file="/WEB-INF/views/adminLayout/adminFooter.jsp"%>
    </div>
</body>

</html>
