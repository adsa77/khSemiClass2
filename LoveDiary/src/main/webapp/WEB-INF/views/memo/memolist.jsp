<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.love.memo.vo.MemoVo" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/LoveDiary/resources/css/memoboard.css">
<head>
    <meta charset="UTF-8">
    <title>우리두리TODO 메모장</title>
</head>
<body>
     <div class="container">
        <h1>메모장</h1>
        <button class="new-post-button" onclick="location.href='/LoveDiary/memo/memoinsert'">새 메모 작성</button>

        <%
            List<MemoVo> voList = (List<MemoVo>) request.getAttribute("voList");
            if (voList != null && !voList.isEmpty()) {
                for (MemoVo memo : voList) {
        %>
                    <div class="post">
                        <h2><%= memo.getTitle() %></h2>
                        <p><%= memo.getContent() %></p>
                        <div class="date">
                            <%= memo.getCheckDate() != null ? memo.getCheckDate() : "날짜 없음" %>
                        </div>
                        <form action="/LoveDiary/memo/deleteMemo" method="post" style="display:inline;">
                            <input type="hidden" name="memoNo" value="<%= memo.getNo() %>">
                            <input type="submit" value="삭제">
                        </form>
                        <form action="/LoveDiary/memo/edit" method="get" style="display:inline;">
                            <input type="hidden" name="memoNo" value="<%= memo.getNo() %>">
                            <input type="submit" value="수정">
                        </form>
                    </div>
        <%
                }
            } else {
        %>
            <p>작성된 메모가 없습니다.</p>
        <%
            }
        %>
    </div>
</body>
</html>
