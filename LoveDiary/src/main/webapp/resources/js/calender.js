const holidays = {
	"2024-01-01": "신정",
	"2024-02-09": "설날",
	"2024-02-10": "설날",
	"2024-02-11": "설날",
	"2024-02-12": "대체공휴일", // 설날 대체공휴일
	"2024-03-01": "삼일절",
	"2024-05-05": "어린이날",
	"2024-05-06": "대체공휴일", // 어린이날 대체공휴일
	"2024-05-15": "석가탄신일",
	"2024-06-06": "현충일",
	"2024-08-15": "광복절",
	"2024-09-14": "추석",
	"2024-09-15": "추석",
	"2024-09-16": "추석",
	"2024-09-17": "대체공휴일", // 추석 대체공휴일
	"2024-10-03": "개천절",
	"2024-10-09": "한글날",
	"2024-12-25": "성탄절",

	"2025-01-01": "신정",
	"2025-01-28": "설날",
	"2025-01-29": "설날",
	"2025-01-30": "설날",
	"2025-03-01": "삼일절",
	"2025-05-05": "어린이날",
	"2025-05-06": "대체공휴일", // 어린이날 대체공휴일
	"2025-05-14": "석가탄신일",
	"2025-06-06": "현충일",
	"2025-08-15": "광복절",
	"2025-10-03": "개천절",
	"2025-10-06": "추석",
	"2025-10-07": "추석",
	"2025-10-08": "추석",
	"2025-10-09": "한글날",
	"2025-12-25": "성탄절",
};

// 오늘 날짜 가져오기
let today = new Date();
let thisMonth = today.getMonth();
let thisMonthInput = today.getMonth() + 1; // 0부터 시작하기 때문에 1을 더해줌
thisMonthInput = thisMonthInput < 10 ? '0' + thisMonthInput : thisMonthInput; // 년월 형식에 맞게 0을 붙여줍니다.
let todayDate = today.getDate();
let thisYear = today.getFullYear();

// 현재 년월을 input에 설정
document.getElementById('currentMonth').value = `${thisYear}-${thisMonthInput}`;

// 달력 생성 함수 수정
function generateCalendar(year, month) {
	// 요일 배열
	const weekdays = ['일', '월', '화', '수', '목', '금', '토'];

	// calendar 요소가 이미 있다면 내용을 지움
	let calendar = document.getElementById('calendar');
	calendar.innerHTML = '';

	// 오늘 연원일 표시
	let todayDiv = document.getElementById('today');
	let todayYearMonth = today.getFullYear() + '.' + (today.getMonth() + 1).toString().padStart(2, '0');
	todayDiv.textContent = todayYearMonth;

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
		let dayElement = document.createElement('div');
		let date;
		let dateId;

		if (i < startingDay) {
			// 이전 달 날짜 표시
			date = lastDateOfLastMonth - startingDay + i + 1;
			let prevMonth = month === 0 ? 11 : month - 1; // 이전 달
			let prevMonthYear = month === 0 ? year - 1 : year;
			dateId = `${prevMonthYear}-${(prevMonth + 1 < 10 ? '0' + (prevMonth + 1) : (prevMonth + 1))}-${(date < 10 ? '0' + date : date)}`;
			dayElement.textContent = date;
			dayElement.classList.add('day', 'disabled');
			dayElement.id = dateId;
		} else if (i >= startingDay + lastDate) {
			// 다음 달 날짜 표시
			date = i - startingDay - lastDate + 1;
			let nextMonth = month === 11 ? 0 : month + 1; // 다음 달
			let nextMonthYear = month === 11 ? year + 1 : year;
			dateId = `${nextMonthYear}-${(nextMonth + 1 < 10 ? '0' + (nextMonth + 1) : (nextMonth + 1))}-${(date < 10 ? '0' + date : date)}`;
			dayElement.textContent = date;
			dayElement.classList.add('day', 'disabled');
			dayElement.id = dateId;
		} else {
			// 현재 월 날짜 표시
			date = i - startingDay + 1;
			dayElement.textContent = date;
			dayElement.classList.add('day');
			let currentDate = new Date(year, month, date); // 현재 날짜 객체 생성
			if (currentDate.toDateString() === today.toDateString()) { // 현재 날짜와 같은지 비교
				dayElement.classList.add('today');
			}
			// 현재 월의 날짜인 경우 아이디 설정
			dateId = `${year}-${(month + 1 < 10 ? '0' + (month + 1) : (month + 1))}-${(date < 10 ? '0' + date : date)}`;
			dayElement.id = dateId;

			// 휴일 표시
			if (holidays[dateId]) {
				let holidayLabel = document.createElement('div');
				holidayLabel.textContent = holidays[dateId];
				holidayLabel.classList.add('holiday');
				dayElement.appendChild(holidayLabel);
				dayElement.classList.add('holiday-day');
			}

			// 일정 표시
			console.log("voList :" + voList);
			voList.forEach(event => {
				if (event.date === dateId) {
					let scheduleLabel = document.createElement('div');
					scheduleLabel.textContent = event.title;
					scheduleLabel.classList.add(event.category.toLowerCase()); // 카테고리 이름을 클래스로 추가
					dayElement.appendChild(scheduleLabel);
					dayElement.classList.add('schedule-day');
				}
			}

			);
		}

		calendar.appendChild(dayElement);

		// 클릭 이벤트 리스너 추가
		dayElement.addEventListener('click', function() {
			// sidebar 요소의 클래스를 확인합니다.
			let sidebar = document.getElementById('sidebar');
			if (!sidebar.classList.contains('active')) {
				// 팝업 요소를 가져와서 보이도록 설정합니다.
				let popUp = document.getElementById('popUp');
				popUp.style.display = "block";

				// 클릭된 날짜를 가져옵니다.
				let clickedDate = this.id;

				// 날짜를 연, 월, 일로 분리합니다.
				let [clickedYear, clickedMonth, clickedDay] = clickedDate.split('-');

				// 클릭된 날짜의 요일을 가져옵니다.
				let clickedDayOfWeek = new Date(clickedYear, clickedMonth - 1, clickedDay).getDay();
				let weekdays = ['일', '월', '화', '수', '목', '금', '토'];
				let dayOfWeek = weekdays[clickedDayOfWeek];

				// 팝업의 날짜와 요일에 클릭된 날짜를 적용합니다.
				let popUpDate = document.getElementById('popUpDate');
				popUpDate.textContent = `${clickedYear}년 ${clickedMonth}월 ${clickedDay}일 (${dayOfWeek})`;

				// 팝업 내용을 초기화합니다.
				let eventList = document.getElementById('eventList');
				eventList.innerHTML = ''; // 기존의 내용을 비웁니다.

				// 클릭된 날짜와 일치하는 일정을 가져와서 리스트에 추가합니다.
				voList.forEach(event => {
					if (event.date === clickedDate) {
						let li = document.createElement('li');
						li.textContent = event.title;
						eventList.appendChild(li);
					}
				});
			}
		});
	}

}

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

// 달력 다시 생성 함수 정의
function regenerateCalendar(year, month) {
	// 달력 다시 생성
	generateCalendar(year, month);
	// 연 월 업데이트
	let todayDiv = document.getElementById('today');
	if (todayDiv) {
		todayDiv.textContent = year + '. ' + (month + 1);
	}
}

// 이전 월 버튼 이벤트 설정
document.getElementById('lastMonthBtn').addEventListener('click', function() {
	// 이전 월 계산
	thisMonth--;
	if (thisMonth < 0) {
		thisMonth = 11;
		thisYear--;
	}
	// 달력 다시 생성 및 연 월 업데이트
	regenerateCalendar(thisYear, thisMonth);
	// input type="month"의 연월 업데이트
	document.getElementById('currentMonth').value = `${thisYear}-${(thisMonth + 1).toString().padStart(2, '0')}`;
});

// 다음 월 버튼 이벤트 설정
document.getElementById('nextMonthBtn').addEventListener('click', function() {
	// 다음 월 계산
	thisMonth++;
	if (thisMonth > 11) {
		thisMonth = 0;
		thisYear++;
	}
	// 달력 다시 생성 및 연 월 업데이트
	regenerateCalendar(thisYear, thisMonth);
	// input type="month"의 연월 업데이트
	document.getElementById('currentMonth').value = `${thisYear}-${(thisMonth + 1).toString().padStart(2, '0')}`;
});

// input type="month"에서 선택된 연월 변경 시 이벤트 설정
document.getElementById('currentMonth').addEventListener('change', function() {
	// 선택된 연월 값 가져오기
	let [selectedYear, selectedMonth] = this.value.split('-');
	selectedYear = parseInt(selectedYear, 10);
	selectedMonth = parseInt(selectedMonth, 10) - 1;
	// 달력 다시 생성 및 연 월 업데이트
	regenerateCalendar(selectedYear, selectedMonth);
});

// 페이지 로드 시 현재 연월의 달력 생성
generateCalendar(thisYear, thisMonth);
