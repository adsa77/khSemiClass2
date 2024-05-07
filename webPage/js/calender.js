// 오늘 날짜 가져오기
let today = new Date();
let currentMonth = today.getMonth();
let todayDate = today.getDate();
let currentYear = today.getFullYear();

// 달력 생성
function generateCalendar(year, month) {
    // 요일 배열
    const weekdays = ['일', '월', '화', '수', '목', '금', '토'];

    let calendar = document.getElementById('calendar');
    calendar.innerHTML = '';

    // 오늘 연원일 표시
    let todayDiv = document.getElementById('today');
    todayDiv.textContent = today.getFullYear() + '년 ' + (today.getMonth() + 1) + '월 ' + today.getDate() + '일';

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

        // 날짜 클릭 이벤트 리스너 추가
        dayElement.addEventListener('click', function () {
            console.log(this.id);
        });

        calendar.appendChild(dayElement);
    }
}

generateCalendar(currentYear, currentMonth);
