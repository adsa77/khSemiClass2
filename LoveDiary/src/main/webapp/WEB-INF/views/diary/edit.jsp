<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.love.diary.vo.DiaryVo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리두리TODO 일기 수정</title>
    <link rel="stylesheet" href="/LoveDiary/resources/css/diaryedit.css">
</head>
<body>
    <div class="container">
        <h1>일기 수정</h1>
        <form action="/LoveDiary/diary/edit" method="post">
            <input type="hidden" name="diaryNo" value="<%= ((DiaryVo) request.getAttribute("diary")).getNo() %>">
            
            <label for="title">제목:</label>
            <input type="text" id="title" name="diaryTitle" value="<%= ((DiaryVo) request.getAttribute("diary")).getTitle() %>" required>
            
            <label for="content">내용:</label>
            <textarea id="content" name="diaryContent" rows="10" required><%= ((DiaryVo) request.getAttribute("diary")).getContent() %></textarea>
            
            <label for="date">날짜:</label>
            <input type="date" id="date" name="diaryCheckDate" value="<%= ((DiaryVo) request.getAttribute("diary")).getCheckDate() %>" required>
            
            <input type="submit" value="일기 수정">
        </form>
    </div>
</body>
</html>
