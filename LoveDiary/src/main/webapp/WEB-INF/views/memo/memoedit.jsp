<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.love.memo.vo.MemoVo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메모 수정</title>
    <link rel="stylesheet" href="/LoveDiary/resources/css/memoedit.css">
</head>
<body>
    <div class="container">
        <h1>메모 수정</h1>
        <form action="/LoveDiary/memo/edit" method="post">
            <input type="hidden" name="memoNo" value="<%= ((MemoVo) request.getAttribute("memo")).getNo() %>">
            
            <label for="title">제목:</label>
            <input type="text" id="title" name="memoTitle" value="<%= ((MemoVo) request.getAttribute("memo")).getTitle() %>" required>
            
            <label for="content">내용:</label>
            <textarea id="content" name="memoContent" rows="10" required><%= ((MemoVo) request.getAttribute("memo")).getContent() %></textarea>
            
            <label for="date">날짜:</label>
            <input type="date" id="date" name="memoCheckDate" value="<%= ((MemoVo) request.getAttribute("memo")).getCheckDate() %>" required>
            
            <input type="submit" value="메모 수정">
        </form>
    </div>
</body>
</html>
