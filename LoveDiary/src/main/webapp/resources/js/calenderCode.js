    // 카테고리별로 일정을 보여주기 위한 객체
    var eventsByCategory = {};
    // voList를 카테고리별로 분류
    voList.forEach(event => {
        if (!eventsByCategory[event.category]) {
            eventsByCategory[event.category] = [];
        }
        eventsByCategory[event.category].push(event);
    });
    
    $(document).ready(function() {
        $('.day').on('click', 'div.schedule-day', function() {
            var clickedDate = $(this).text();
            var eventsForDate = [];
            Object.keys(eventsByCategory).forEach(function(category) {
                eventsForDate = eventsForDate.concat(eventsByCategory[category].filter(event => event.date === clickedDate));
            });
            updatePopup(eventsForDate);
        });

        $('#popUp').on('click', 'div.schedule-day div', function() {
            var text = $(this).text();
            var li = $('<li>').text(text);
            $('#eventList').append(li);
        });
    });

    function updatePopup(events) {
        var list = $('#eventList');
        list.empty(); // 기존 목록 비우기

        events.forEach(event => {
            var li = $('<li>').text(event.title);
            list.append(li);
        });

        $('#popUpDate').text(events.length > 0 ? events[0].date : '일정이 없습니다');
    }