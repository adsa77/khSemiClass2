function initCode() {
  $.ajax({
    type: 'post',
    url: '/LoveDiary/code/check',
    data: { no: $('#hiddenNo').val() },
    success: function(response) {
      $('#resultText').text(response); // 응답 값을 텍스트 요소에 설정
      $('#codecheckBtn').hide(); // 버튼 숨기기
    },
    error: function(xhr, status, error) {
      alert('AJAX 요청 실패: ' + error);
    }
  });
}
