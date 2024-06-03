<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.love.diary.vo.DiaryVo" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/LoveDiary/resources/css/diarylist.css">
<head>
    <meta charset="UTF-8">
    <title>나의 일기장</title>
</head>
<body>
     <div class="container">
        <h1>일기장</h1>
        <button class="new-post-button" onclick="location.href='/LoveDiary/diary/insert'">새 일기 작성</button>

        <%
            List<DiaryVo> voList = (List<DiaryVo>) request.getAttribute("voList");
            if (voList != null && !voList.isEmpty()) {
                for (DiaryVo diary : voList) {
        %>
                    <div class="post">
                        <h2><%= diary.getTitle() %></h2>
                        <p><%= diary.getContent() %></p>
                        <div class="date">
                            <%= diary.getCheckDate() != null ? diary.getCheckDate() : "날짜 없음" %>
                        </div>
                        <form action="/LoveDiary/diary/del" method="post" style="display:inline;">
                            <input type="hidden" name="diaryNo" value="<%= diary.getNo() %>">
                            <input type="submit" value="삭제">
                        </form>
                        <form action="/LoveDiary/diary/edit" method="get" style="display:inline;">
                            <input type="hidden" name="diaryNo" value="<%= diary.getNo() %>">
                            <input type="submit" value="수정">
                        </form>
                    </div>
        <%
                }
            } else {
        %>
            <p>작성된 일기가 없습니다.</p>
        <%
            }
        %>
    </div>
</body>
</html>
