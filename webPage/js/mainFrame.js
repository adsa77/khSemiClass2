function loadPage(url) {
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('페이지를 로드하는 중 오류가 발생했습니다.');
            }
            return response.text();
        })
        .then(html => {
            document.getElementById('content1').innerHTML = html;
            loadCalendarResources(); // 달력 리소스 로드
        })
        .catch(error => console.error(error.message));
}

function loadCalendarResources() {
    const head = document.querySelector('head');
    
    // 달력 CSS 파일 추가
    const calendarCSS = document.createElement('link');
    calendarCSS.rel = 'stylesheet';
    calendarCSS.href = '../calender/calender.css';
    head.appendChild(calendarCSS);
    
    // 달력 JavaScript 파일 추가
    const calendarScript = document.createElement('script');
    calendarScript.src = '../calender/calender.js';
    calendarScript.defer = true;
    head.appendChild(calendarScript);
}
