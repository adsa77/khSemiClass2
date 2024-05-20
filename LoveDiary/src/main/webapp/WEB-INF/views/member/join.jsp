<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<title>Document</title>
  <link rel="stylesheet" href="/LoveDiary/resources/css/join.css">
  <script defer src="/LoveDiary/resources/js/join.js"></script>
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
      
      <form action="" id="formjoin">
        <input type="text" id="userid" placeholder="아이디">
        
  	 	<div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
   		<div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div>
        <input type="password" id="password" class="joinTitle" placeholder="비밀번호">
       
        <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
        
        <input type="password" id="password-retype" class="joinTitle" placeholder="비민번호 확인">
       
        <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
         
        <input type="text" id="username" class="joinTitle" placeholder="이름">
      	<div class="nameerror-message hide">이름은 한글로 입력해주세요.</div>
      	
        <input type="text" id="nuck"  class="joinTitle" placeholder="애칭">
      	
        <input type="text" id="bith" class="joinTitle" placeholder="생년월일 입력 ex)2000-11-11">
        
      	<div class="bitherror-massage hide"> 예시)2003-11-12</div>
      	
        <input type="text" id="phone" class="joinTitle" placeholder="핸드폰번호">
        
      	<div class="phoneerr-massage hide">000-0000-0000</div>
      	
        <input type="email" id="email" class="joinTitle" placeholder="이메일">
      	
      	<div class="emailerr-massage hide">예시)khclass362@naver.com</div>
      	
        <input type="text" id="add" class="joinTitle" placeholder="집주소">
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