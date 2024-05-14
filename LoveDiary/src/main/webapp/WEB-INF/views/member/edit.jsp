<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
// 이 JavaScript 파일은 제이쿼리를 사용하여 AJAX 요청을 수행합니다.
$(document).ready(function() {
    function fetchItems(pageNum) {
        $.ajax({
            url: "/item/list", // 서버의 /item/list 엔드포인트에 요청
            method: "GET", // GET 요청 방식
            data: { pageNum: pageNum }, // 페이지 번호를 요청과 함께 전송
            success: function(response) {
                if (response === "ok") {
                    alert("데이터 잘 받음");
                } else {
                    alert("데이터 못 받음");
                }
            },
            error: function() {
                alert("통신 실패...");
            }
        });
    }

    // 예시 페이지 번호로 함수 호출, 실제 구현에서는 동적으로 결정할 수 있습니다.
    fetchItems(1); // 페이지 번호 1을 사용하여 요청
});
</body>
</html>