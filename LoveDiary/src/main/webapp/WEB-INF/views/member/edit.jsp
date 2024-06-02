<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정</title>
<link rel="stylesheet" href="/LoveDiary/resources/css/edit.css">

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
      <form action="/LoveDiary/member/edit" method="post">
      	
        <span id="idtitle">회원님의 아이디는 : ${loginMemberVo.id} 입니다.</span>
     	<span id="idtitle">회원님의 코드는 : ${loginMemberVo.code} 입니다.</span>
     	<span id="idtitle">회원님의 닉네임은 : ${loginMemberVo.nick} 입니다.</span>
     	<br>
        <input type="password" id="editTitle" name="editpwd" placeholder="변경하실 비밀번호">
        <br>
        <input type="password" id="editTitle" name="editpwd2" placeholder="변경하실 비밀번호 확인">
        <br>
        <br>
        <br>
        <br>
        <br>
        <input type="submit" id="editUpdate" value="비밀번호 변경">
      </form>
   
    </section>
    <footer>
      <h1>footer</h1>
    </footer>
  </div>
</body>
</html>