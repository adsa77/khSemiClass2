<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LoveDiary/resources/css/check.css">
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
      
      <form action="/LoveDiary/code/check" method="post">
        <input type="text" id="codeNum" placeholder="코드생성">
     	<button type="button" id="codecheck" onclick="checkcode();">중복검사</button>
        <br>
        <br>
        <input type="submit" id="codeinsert" value="커플다이어리 생성">
      </form>
      
      <form action="/LoveDiary/code/check">
      <input type="text" id="codejoin" placeholder="커플 코드입력">
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