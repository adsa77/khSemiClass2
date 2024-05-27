// 오늘 날짜 가져오기
let today = new Date();
let thisMonth = today.getMonth();
let todayDate = today.getDate();
let thisYear = today.getFullYear();

// 달력 생성
function generateCalendar(year, month) {
    // 요일 배열
    const weekdays = ['일', '월', '화', '수', '목', '금', '토'];

    let calendar = document.getElementById('calendar');
    // calendar 요소가 없다면 생성
    if (!calendar) {
        calendar = document.createElement('div');
        calendar.id = 'calendar';
        document.getElementById('section').appendChild(calendar);
    } else {
        calendar.innerHTML = ''; // calendar 요소가 이미 있다면 내용을 지움
    }

    // 오늘 연원일 표시
    let todayDiv = document.getElementById('today');
    if (!todayDiv) {
        todayDiv = document.createElement('div');
        todayDiv.id = 'today';
        document.getElementById('section').appendChild(todayDiv);
    }
    todayDiv.innerHTML = today.getFullYear() + '. ' + (today.getMonth() + 1);

    // 해당 월의 첫 번째 날의 요일 가져오기
    let firstDayOfMonth = new Date(year, month, 1);
    let startingDay = firstDayOfMonth.getDay();

    // 월의 마지막 날짜 가져오기
    let lastDayOfMonth = new Date(year, month + 1, 0);
    let lastDate = lastDayOfMonth.getDate();

    // 이전 달의 마지막 날짜 가져오기
    let lastDayOfLastMonth = new Date(year, month, 0);
    let lastDateOfLastMonth = lastDayOfLastMonth.getDate();

    // 달력에 날짜 추가
    let dayElement, date;
    for (let j = 0; j < 7; j++) {
        dayElement = document.createElement('div');
        dayElement.textContent = weekdays[j];
        dayElement.classList.add('day', 'header-day');
        calendar.appendChild(dayElement);
    }

    for (let i = 0; i < 42; i++) {
        dayElement = document.createElement('div');
        if (i < startingDay) {
            // 이전 달 날짜 표시
            date = lastDateOfLastMonth - startingDay + i + 1;
            dayElement.textContent = date;
            dayElement.classList.add('day', 'disabled');
        } else if (i >= startingDay + lastDate) {
            // 다음 달 날짜 표시
            date = i - startingDay - lastDate + 1;
            dayElement.textContent = date;
            dayElement.classList.add('day', 'disabled');
        } else {
            // 현재 월 날짜 표시
            date = i - startingDay + 1;
            dayElement.textContent = date;
            dayElement.classList.add('day');
            if (date === todayDate) {
                dayElement.classList.add('today');
            }
        }

        // id값으로 날짜 추가
        let dateId = year + '-' + ((month + 1 < 10) ? '0' + (month + 1) : (month + 1)) + '-' + (date < 10 ? '0' + date : date);
        dayElement.id = dateId;

        calendar.appendChild(dayElement);
    }
}

generateCalendar(thisYear, thisMonth);

// 클릭 이벤트 리스너를 추가합니다.
document.querySelectorAll('.day').forEach(day => {
    day.addEventListener('click', function () {
        // sidebar 요소의 클래스를 확인합니다.
        let sidebar = document.getElementById('sidebar');
        if (!sidebar.classList.contains('active')) {
            // 팝업 요소를 가져와서 보이도록 설정합니다.
            let popUp = document.getElementById('popUp');
            popUp.style.display = 'block';

            // 클릭된 날짜를 가져옵니다.
            let clickedDate = this.id;

            // 날짜를 연, 월, 일로 분리합니다.
            let [year, month, day] = clickedDate.split('-');

            // 클릭된 날짜의 요일을 가져옵니다.
            let clickedDay = new Date(year, month - 1, day).getDay();
            let weekdays = ['일', '월', '화', '수', '목', '금', '토'];
            let dayOfWeek = weekdays[clickedDay];

            // 팝업의 날짜와 요일에 클릭된 날짜를 적용합니다.
            let popUpDate = document.getElementById('popUpDate');
            popUpDate.textContent = year + '년 ' + month + '월 ' + day + '일 ' + '(' + dayOfWeek + ')';
        }
    });
});




// 팝업된 div 닫기 버튼
document.addEventListener("DOMContentLoaded", function() {
    // 모든 클래스가 "closeDivBtn"인 버튼에 대해 반복합니다.
    var closeBtns = document.querySelectorAll(".closeDivBtn");
    closeBtns.forEach(function(btn) {
      // 각 버튼에 클릭 이벤트 리스너를 추가합니다.
      btn.addEventListener("click", function() {
        // 클릭된 버튼의 부모 요소인 div를 숨깁니다.
        this.parentNode.style.display = "none";
      });
    });
  });


// 버튼 클릭 이벤트 설정
document.getElementById('anniversaryBoardBtn').addEventListener('click', toggleBoard);
document.getElementById('scheduleBoardBtn').addEventListener('click', toggleBoard);
document.getElementById('todoBoardBtn').addEventListener('click', toggleBoard);
document.getElementById('diaryBoardBtn').addEventListener('click', toggleBoard);
document.getElementById('accountBoardBtn').addEventListener('click', toggleBoard);

// div 토글 함수 정의
function toggleBoard() {
    // 모든 보드 숨기기
    hideAllBoards();
    
    // 클릭된 버튼에 해당하는 보드 보이기
    let boardId = this.id.replace("Btn", "");
    let board = document.getElementById(boardId);
    if (board) {
        board.style.display = 'block';
    } else {
        console.error('Board not found:', boardId);
    }
}

// 모든 보드 숨기는 함수 정의
function hideAllBoards() {
    let boards = document.querySelectorAll('.board');
    boards.forEach(board => {
        board.style.display = 'none';
    });
}
