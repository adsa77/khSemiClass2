<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.love.member.vo.MemberVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="/LoveDiary/resources/css/check.css">
<script src="/LoveDiary/resources/js/check.js" defer></script>
</head>
<body id="container">
  <div id="wrap">
    <header>
      <img 
      height="100px"
      width="100px"
      alt="홈버튼 돌아가기" 
      src="/LoveDiary/resources/img/하트.png"
      onclick="location.href='http://127.0.0.1:8888/LoveDiary/home'"
      >
    </header>
    <section id="section">
      
         <form id="codeForm" action="/LoveDiary/code/check" method="post">
        <%
          MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
          String userNo = (loginMemberVo != null) ? loginMemberVo.getNo() : "";
          String userCode = (loginMemberVo != null) ? loginMemberVo.getCode() : "";
        %>
        <input type="hidden" name="no" id="hiddenNo" value="<%= userNo %>">
        <input type="hidden" id="hiddenCode" value="<%= userCode %>"> <!-- 현재 사용자의 code 값 -->

        <%
          if (userCode == null || userCode.isEmpty()) {
        %>
          <button type="button" id="codecheckBtn" name="codecheck" onclick="initCode();">커플 다이어리 생성</button>
        <%
          }
        %>
        <span id="reText"></span>
        <br>
        <br>
      </form>
      
      <form id="codeForm2" action="/LoveDiary/code/check" method="post">
        <input type="text" id="codejoin" name="code" placeholder="커플 코드입력" required>
        <br>
        <input type="submit" id="codecnt" value="커플 다이어리 접속">
      </form>
    </section>
    <footer>
      <h1>footer</h1>
    </footer>
  </div>
</body>
</html>
