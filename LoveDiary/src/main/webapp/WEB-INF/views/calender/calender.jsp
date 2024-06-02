<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script defer
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="/LoveDiary/resources/css/sidebar.css">
<link rel="stylesheet" href="/LoveDiary/resources/css/calender.css">
<link rel="stylesheet" href="/LoveDiary/resources/css/popUpBoard.css">
<script defer src="/LoveDiary/resources/js/sidebar.js"></script>
<script defer src="/LoveDiary/resources/js/calender.js"></script>
<script defer src="/LoveDiary/resources/js/calenderCode.js"></script>
<script defer src="/LoveDiary/resources/js/popUpBoard.js"></script>
<script defer src="/LoveDiary/resources/js/logout.js"></script>
<script defer>
    var voList = [
        <c:forEach items="${voList}" var="vo" varStatus="status">
            {
                code: "${vo.code}",
                title: "${vo.title}",
                content: "${vo.content}",
                date: "${vo.date}",
                category: "${vo.category}"
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    
    var voHoliList = [
        <c:forEach items="${voHoliList}" var="hvo" varStatus="status">
            {
                code: "${hvo.code}",
                title: "${hvo.title}",
                date: "${hvo.holidayDate}",
                category: "${hvo.category}"
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    console.log(voHoliList);
    
    </script>
</head>
<body id="container">
	<!-- <aside id="sideL">
    <h1>sideLeft</h1>
  </aside> -->
	<div id="wrap">
		<header id="header">
			<div id="headerL">
				<h3>1000일</h3>
			</div>
			<div class="headerBtn">
				<button id="lastMonthBtn">◀</button>
			</div>
			<div id="centerDate">
				<div id="today"></div>
				<div>
					<input type="month" id="currentMonth">
				</div>
			</div>
			<div class="headerBtn">
				<button id="nextMonthBtn">▶</button>
			</div>
			<div id="headerR">
				<button id="sidebarBtn">메뉴</button>
			</div>
		</header>
		<div id="popUp">
			<span id="popUpDate">팝업</span>
			<br>
			<span id="popUpDateHoli"></span>
			<ul id="eventList">
				<li>일정1</li>
			</ul>
			<div>
				<div id="anniversaryBoardBtn"
					class="insertBoardBnt ,anniversaryBoard">
					<button id="anniversaryBoardBtn">기념일</button>
				</div>
				<div id="scheduleBoardBtn" class="insertBoardBnt, scheduleBoard">
					<button id="scheduleBoardBtn">스캐쥴</button>
				</div>
				<div id="todoBoardBtn" class="insertBoardBnt, todoBoard">
					<button id="todoBoardBtn">todo</button>
				</div>
				<div id="diaryBoardBtn" class="insertBoardBnt, diaryBoard">
					<button id="diaryBoardBtn">일기</button>
				</div>
				<div id="accountBoardBtn" class="insertBoardBnt, accountBoard">
					<button id="accountBoardBtn">가계부</button>
				</div>
			</div>
			<button id="insertToggleBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="anniversaryBoard" class="anniversaryBoard">
			<form id="insertCalendar" action="/LoveDiary/anni/insert"
				method="post">
				<div id="categoryName">
					<span>기념일</span>
				</div>
				<div id="inputBox">
					<div>
						<input type="text" id="title" name="anniTitle" placeholder="제목 :">
					</div>
					<div>
						<textarea id="content" name="anniContent" placeholder="내용 :"></textarea>
					</div>
					<div>
						<input type="date" id="date" name="anniDate" placeholder="날짜">
					</div>
					<input type="submit" id="submitBtn">
				</div>
			</form>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="scheduleBoard" class="scheduleBoard">
			<form id="insertCalendar" action="/LoveDiary/sche/insert"
				method="post">
				<div>
					<div id="categoryName">
						<span>스케쥴</span>
					</div>
				</div>
				<div id="inputBox">
					<div>
						<input type="text" id="title" name="scheTitle" placeholder="제목 :">
					</div>
					<div>
						<textarea id="content" name="scheContent" placeholder="내용 :"></textarea>
					</div>
					<div>
						<input type="date" id="date" name="scheDate" placeholder="날짜">
					</div>
					<input type="submit" id="submitBtn">
				</div>
			</form>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="todoBoard" class="todoBoard">
			<form action="/LoveDiary/todo/insert" method="post"
				id="insertCalendar">
				<div>
					<div id="categoryName">
						<span>TODO</span>
					</div>
				</div>
				<div id="inputBox">
					<div>
						<input type="text" id="title" name="todoTitle" placeholder="제목 :">
					</div>
					<div>
						<textarea id="content" name="todoContent" placeholder="내용 :"></textarea>
					</div>
					<div>
						<input type="date" id="date" name="todoCheckDate" placeholder="날짜">
					</div>
					<input type="submit" name="todoSubmitBtn" id="submitBtn">
				</div>
			</form>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="diaryBoard" class="diaryBoard">
			<form id="insertCalendar">
				<div>
					<div id="categoryName">
						<span>일기</span>
					</div>
				</div>
				<div id="inputBox">
					<div>
						<input type="text" id="title" placeholder="제목 :">
					</div>
					<div>
						<textarea id="content" placeholder="내용 :"></textarea>
					</div>
					<div>
						<input type="date" id="date" placeholder="날짜">
					</div>
					<input type="submit" id="submitBtn">
				</div>
			</form>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="accountBoard" class="accountBoard">
			<form id="insertCalendar">
				<div>
					<div id="categoryName">
						<span>가계부</span>
					</div>
				</div>
				<div id="inputBox">
					<div>
						<input type="text" id="title" placeholder="제목 :">
					</div>
					<div>
						<textarea id="content" placeholder="내용 :"></textarea>
					</div>
					<div>
						<input type="date" id="date" placeholder="날짜">
					</div>
					<input type="submit" id="submitBtn">
				</div>
			</form>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>
		</div>
		<div id="tableView" class="tableView" style="display: none;">
			<div>
				<div id="categoryName">
					<span id="tableViewSpan"></span>
				</div>
			</div>
			<div id="inputBox">
				<div id="tableViewTitle">
					<div id="title">
						<span id="tableViewSpanId"></span>
					</div>
				</div>
				<div id="tableViewContent">
					<div id="content">
						<span id="tableViewSpanContent"></span>
					</div>
				</div>
				<div id="tableViewDate">
					<div id="date">
						<span id="tableViewSpanDate"></span>
					</div>
				</div>
			</div>
			<div id="tableViewBtnBox">
				<button id="tableViewEdit" class="closeDivBtn">수정</button>
				<button id="tableViewDelete" class="closeDivBtn">삭제</button>
			</div>
			<button id="closeInsertCalendarBtn" class="closeDivBtn">닫기</button>

		</div>
		<section id="section">
			<div class="calendar" id="calendar">
				<div class="day"></div>
			</div>
		</section>
		<%-- 		<footer id="footer">
			<h1>footer</h1>
		</footer>  --%>

	</div>
	<aside id="sidebar">
		<ul>
			<li><a href="../index.html">홈페이지</a></li>
			<li><a href="./html/mainFrame.html">달력</a></li>
			<li><a href="./html/todoList.html"
				onclick="loadPage('./html/todoList.html'); return false;">todoList</a></li>
			<li><a href="./html/diaryList.html"
				onclick="loadPage('./html/diaryList.html'); return false;">diaryList</a></li>
			<li><a href="./html/chat.html"
				onclick="loadPage('./html/chat.html'); return false;">채팅</a></li>
		</ul>
		<button onclick="location.href='/LoveDiary/member/edit'">회원정보수정</button>
		<button onclick="location.href='/LoveDiary/member/logout'">로그아웃</button>
	</aside>
</body>
</html>