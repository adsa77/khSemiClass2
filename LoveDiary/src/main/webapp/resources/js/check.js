function initCode() {
  $.ajax({
    type: 'post',
    url: '/LoveDiary/code/check',
    data: { no: $('#hiddenNo').val() },
    success: function(response) {
      $('#reText').text(response); // 응답 값을 텍스트 요소에 설정
      $('#codecheckBtn').hide(); // 버튼 숨기기
    },
    error: function(xhr, status, error) {
      alert('AJAX 요청 실패: ' + error);
    }
  });
}


document.addEventListener("DOMContentLoaded", () => {
  const codeForm = document.querySelector("#codeForm2");

  codeForm.addEventListener("submit", e => {
    e.preventDefault(); // 기본 폼 제출 동작 방지
    const codejoinInput = document.querySelector("#codejoin").value;
    if (!codejoinInput) {
      alert("코드를 입력하셔야합니다.");
      return;
    }

    // AJAX 요청을 통해 서버에 코드 제출
    $.ajax({
      type: 'post',
      url: '/LoveDiary/code/check',
      data: { code: codejoinInput },
      success: function(response) {
        if (response.includes("코드 생성 성공") || response.includes("성공적으로 접속했습니다")) {
          window.location.href = '/LoveDiary/calender/main';
        } else {
          $('#reText').text(response);
        }
      },
      error: function(error) {
        alert('AJAX 요청 실패: ' + error);
      }
    });
  });
});
