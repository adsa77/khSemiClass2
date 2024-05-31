<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러브 다이어리 회원가입</title>
  <link rel="stylesheet" href="/LoveDiary/resources/css/login.css">

</head>
<body id="container">
  <div id="wrap">
    <header>
      <img 
      height="100px"
      width="100px"
      alt="홈버튼 돌아가기" 
      src="/LoveDiary/resources/img/하트.png"
      onclick="location.href='/LoveDiary/home'"
      >
    </header>
    <section id="section">
      
      <form action="/LoveDiary/member/login" method="post">
        <input type="text" id="joinTitle" name="id" placeholder="아이디">
     	<br>
     	<br>
     	<br>
        <input type="password" id="joinTitle" name="pwd" placeholder="비밀번호">
        <br>
        <br>
        <br>
         
        <br>
        <br>
        <br>
        <input type="submit" id="indexinsert" value="로그인 하기">
      </form>

      

      	<div>
     	 	<a href="/LoveDiary/select/id" id="selectId" class="forgetpass">아이디 찾기</a>
       		
       		<a href="/LoveDiary/select/pwd" id="selectPwd" class="forgetpass">비밀번호 찾기</a>
      	</div>

    </section>
    <footer>
      <h1>footer</h1>
    </footer>
  </div>
</body>
</html>