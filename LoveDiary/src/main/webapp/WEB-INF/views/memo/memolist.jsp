<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.love.memo.vo.MemoVo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <style>
        body {
            background-color: #f8d7da;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffe6e6;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #a94442;
        }
        .post {
            background-color: #ffffff;
            border: 1px solid #e5e5e5;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
        }
        .post h2 {
            margin-top: 0;
            color: #d9534f;
        }
        .post p {
            color: #555;
        }
        .post .date {
            text-align: right;
            color: #aaa;
        }
        .new-post-button {
            display: block;
            width: 100%;
            padding: 10px 0;
            margin: 20px 0;
            background-color: #d9534f;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .new-post-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TODO 목록</h1>
        <button class="new-post-button" onclick="location.href='newPost.jsp'">새 글 작성</button>

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
					</div>
        <%
                }
            } else {
        %>
            <p>게시글이 없습니다.</p>
        <%
            }
        %>
        
    </div>
</body>
</html>
