// 이름 유효성 검사

//이름입력창 가져오기
let elInputUsername = document.querySelector('#username'); // input#userid

// 실패 메시지 정보 가져오기 (특수문자,숫자 x)
let elnameerror = document.querySelector('.nameerror-message'); // div.nameerror-message.hide


function onlynamekr(str) {
  return /^[가-힣]*$/.test(str);
}

//이름체크
elInputUsername.onkeyup = function () {

  
  // 값을 입력한 경우
  if (elInputUsername.value.length !== 0) {
    if(onlynamekr(elInputUsername.value)) {
      elnameerror.classList.add('hide'); // 실패 메시지가 가려져야 함
    }
    else {
      elnameerror.classList.remove('hide'); // 실패 메시지가 보여야 함
    }
  }
  // 값을 입력하지 않은 경우 (지웠을 때)
  // 모든 메시지를 가린다.
  else {
    elnameerror.classList.add('hide');
  }
};



//생년월일 입력창 가져오기
let elInputbith = document.querySelector('#bith');

// 실패 메시지 정보 가져오기 (생년월일 양식)
let elbitherror = document.querySelector('.bitherror-massage');

//생년월일 양식체크
function onlybith(str) {
  const regex = new RegExp(`^(19\\d{2}|20[0-1][0-9]|202[0-3])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$`);
  return regex.test(str);
}


elInputbith.onkeyup = function () {
  // 값을 입력한 경우
  if (elInputbith.value.length !== 0) {
    if (onlybith(elInputbith.value)) {
      elbitherror.classList.add('hide'); // 실패 메시지가 가려져야 함
    } else {
      elbitherror.classList.remove('hide'); // 실패 메시지가 보여야 함
    }
  }
  // 값을 입력하지 않은 경우 (지웠을 때)
  else {
    elbitherror.classList.add('hide'); // 모든 메시지를 가림
  }
};

//휴대폰 번호 유효성 검사
let elInputphone = document.querySelector('#phone');

let elphoneerr = document.querySelector('.phoneerr-massage');

function onlyphone(str){
	return /^\d{3}-\d{3,4}-\d{4}$/.test(str);
}

elInputphone.onkeyup = function () {
  // 값을 입력한 경우
  if (elInputphone.value.length !== 0) {
    if (onlyphone(elInputphone.value)) {
      elphoneerr.classList.add('hide'); // 실패 메시지가 가려져야 함
    } else {
      elphoneerr.classList.remove('hide'); // 실패 메시지가 보여야 함
    }
  }
  // 값을 입력하지 않은 경우 (지웠을 때)
  else {
    elphoneerr.classList.add('hide'); // 모든 메시지를 가림
  }
};

let elInputemail = document.querySelector('#email');

let elemailerr = document.querySelector('.emailerr-massage')

function onlyemail(str){
	return /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(str);
}

elInputemail.onkeyup = function () {
	if(elInputemail.value.length !== 0){
		if(onlyemail(elInputemail.value)){
			elemailerr.classList.add('hide') //실패메세지 가려지게
		}else{
			elemailerr.classList.remove('hide'); //실패메세지가 보여야함
		}
	
	}
	else{
		elemailerr.classList.add('hide'); //모든 메세지가 가려지게
	}
};
