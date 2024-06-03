<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>우리둘이TODO</title>
  <link rel="stylesheet" href="/LoveDiary/resources/css/index.css">
  
</head>
<body id="container">
  <div id="wrap">
    <header>
      
    </header>
    <section id="section">
      <div id="indexTitle">
        Love Diary
      </div>
      <div id="indexPic">
        <img alt="" src="/LoveDiary/resources/img/북사진.png">
      </div>
      <div id="indexLogin">
        <button  onclick="location.href='/LoveDiary/member/login'" id="indexLoginBtn">
          로그인
        </button>
      </div>
      <div id="indexJoin">
        <button onclick="location.href='/LoveDiary/member/join'" id="indexJoinBtn">
          회원가입
        </button>
      </div>
    </section>
    
  </div>
</body>
</html>