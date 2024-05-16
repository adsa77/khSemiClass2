<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<title>Document</title>
  <link rel="stylesheet" href="/LoveDiary/resources/css/join.css">
  
<html>
<head>
<meta charset="UTF-8">
<title>러브 다이어리 회원가입</title>
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
      
      <form action="">
        <input type="text" id="joinTitle" placeholder="아이디">
        <button type="button" id="joinDup" onclick="checkDup();">중복검사</button>
     	<br>
        <input type="password" id="joinTitle" placeholder="비밀번호">
        <br>
        <input type="password" id="joinTitle" placeholder="비민번호 확인">
        <br>
        <input type="text" id="joinTitle" placeholder="이름">
      	<br>
        <input type="text" id="joinTitle" placeholder="애칭">
      	<br>
        <input type="text" id="joinTitle" placeholder="생년월일">
      	<br>
        <input type="text" id="joinTitle" placeholder="핸드폰번호">
      	<br>
        <input type="email" id="joinTitle" placeholder="이메일">
      	<br>
        <input type="text" id="joinTitle" placeholder="집주소">
        <br>
        <br>
        <br>
        <br>
        <br>
        <input type="submit" id="indexinsert" value="회원가입">
      </form>
    </section>
    <footer>
      <h1>footer</h1>
    </footer>
  </div>
</body>
</html>