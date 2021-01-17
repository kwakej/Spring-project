<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link href="${pageContext.request.contextPath}/resources/css/join.css"
	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
<
style>* {
	margin: 0;
	padding: 0;
}

body {
	background: white;
	font-family: 'PT Sans';
}

button:hover {
	cursor: pointer;
}

.login-hide {
	padding: 0px 30px 0px;
	display: none;
}

.wrapper {
	background: rgba(0, 0, 0, 0.6);
	background-color: #0d3a1f;
	position: relative;
	width: 1000px;
	height: 750px;
	margin: 0 auto;
	margin-top: 100px;
	position: relative;
}

.left, .right {
	width: 50%;
}

.left {
	float: left;
}

.right {
	float: right
}

.back-header, .back-p {
	margin: 50px;
	color: #fafafa;
	letter-spacing: 1px;
	color: #fafafa;
}

.back-header {
	font-family: 'Ubuntu';
	font-size: 50px;
	font-weight: 500;
}

.back-p {
	font-family: 'PT Sans';
	letter-spacing: 1px;
	font-size: 20px;
	line-height: 30px;
	margin-right: 60px;
}

.background button {
	position: absolute;
	left: 0;
	bottom: 100px;
}

.background .left button {
	left: 150px;
}

.background .right button {
	left: 700px;
}

.form-container {
	position: absolute;
	width: 500px;
	height: 800px;
	background-color: white;
	top: -25px;
	left: 10px;
	box-shadow: 9px 13px 16px 0px rgba(0, 0, 0, 0.75);
}

.sign-up, .login {
	margin: 40px;
}

.back-btn {
	width: 120px;
	height: 50px;
	font-size: 15px;
	border: 0;
	border-radius: 13px;
	background: transparent;
	border: 1px solid white;
	color: #fafafa;
	transition: .3s all;
}

.back-btn:hover {
	background-color: #685fb494;
	border: 1px solid #0d1631;
}
</style>
<style type="text/css">
.join_box {
	width: 400px;
	height: 800px;
	padding: 40px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%)
}

.join_box h2 {
	letter-spacing: 2px;
	text-align: center;
	font-size: 50px;
	margin-bottom: 30px;
	color: black;
}

.form_group {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 10px 0;
}

.form_group input {
	font-size: 15px;
	color: #333;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
}

.btn-primary {
	font-size: 20px;
	display: block;
	width: 100%;
	height: 60px;
	border: none;
	background-color: #082330;;
	border-radius: 50px;
	background-size: 200%;
	border-color: white;
	color: #fff;
	outline: none;
	cusor: pointer;
	transition: .5s;
}

.btn-primary : hover {
	background-position: right;
}

.bottom-text {
	margin-top: 30px;
	text-align: center;
	text-decoration: none;
}

.bottom-text a {
	color: black;
}
</style>
<script>
	$(document).ready(function() {
		var signUp = $('.signup-but');
		var logIn = $('.login-but');

		signUp.on('click', function() {
			$('.login-hide').fadeOut('slow').css('display', 'none');
			$('.sign-up').fadeIn('slow');

			$('.form-container').animate({
				left : '10px'
			}, 'slow');
		});

		logIn.on('click', function() {
			$('.login-hide').fadeIn('slow');
			$('.sign-up').fadeOut('slow').css('display', 'none');

			$('.form-container').animate({
				left : '400px'
			}, 'slow');
		});
	});
</script>
<script type="text/javascript">
            //모든 공백 체크 정규식 
            var empJ = /\s/g;
            //아이디 정규식 
            var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
            // 비밀번호 정규식 
            var pwJ = /^[A-Za-z0-9]{4,12}$/;
            // 이름 정규식 
            var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
            // 이메일 검사 정규식 
            var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            // 휴대폰 번호 정규식
            var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
            //^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/ 
            var birthJ = false;
            var address = $('#m_addr3');

            $(document).ready(function() {
                var address = $('#m_addr3');
                //아이디 중복확인 
                $("#m_id").blur(function() {
                    if ($('#m_id').val() == '') {
                        $('#id_check').text('아이디를 입력하세요.');
                        $('#id_check').css('color', 'red');
                    } else if (idJ.test($('#m_id').val()) != true) {
                        $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                        $('#id_check').css('color', 'red');
                    } else if ($('#m_id').val() != '') {
                        var m_id = $('#m_id').val();
                        $.ajax({
                            async: true,
                            type: 'POST',
                            data: {
                                m_id: m_id
                            },
                            url: '${pageContext.request.contextPath}/idCheck',
                            dateType: 'json',
                            contentType: "application/json; charset=UTF-8",
                            success: function(data) {
                                if (data > 0) {
                                    $('#id_check').text('중복된 아이디 입니다.');
                                    $('#id_check').css('color', 'red');
                                    $("#usercheck").attr("disabled", true);
                                } else {
                                    if (idJ.test(m_id)) {
                                        $('#id_check').text('사용가능한 아이디 입니다.');
                                        $('#id_check').css('color', 'blue');
                                        $("#usercheck").attr("disabled", false);
                                    } else if (m_id == '') {
                                        $('#id_check').text('아이디를 입력해주세요.');
                                        $('#id_check').css('color', 'red');
                                        $("#usercheck").attr("disabled", true);
                                    } else {
                                        $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                                        $('#id_check').css('color', 'red');
                                        $("#usercheck").attr("disabled", true);
                                    }
                                }
                            }
                        });
                    }
                });
                $('form').on('submit', function() {
                    var inval_Arr = new Array(6).fill(false);
                    if (idJ.test($('#m_id').val())) {
                        inval_Arr[0] = true;
                    } else {
                        inval_Arr[0] = false;
                        alert('아이디를 확인하세요.');
                        return false;
                    }
                    // 비밀번호가 같은 경우 && 비밀번호 정규식
                    if (($('#m_pw').val() == ($('#m_pw2').val()))
                    		&& pwJ.test($('m_pw').val())){
                        inval_Arr[1] = true;
                    } else {
                        inval_Arr[1] = false;
                        alert('비밀번호를 확인하세요.');
                        return false;
                    }
                    // 이름 정규식 
                    if (nameJ.test($('#m_name').val())) {
                        inval_Arr[2] = true;
                    } else {
                        inval_Arr[2] = false;
                        alert('이름을 확인하세요.');
                        return false;
                    }
                    // 생년월일 정규식 
                    if (birthJ) {
                        console.log(birthJ);
                        inval_Arr[3] = true;
                    } else {
                        inval_Arr[3] = false;
                        alert('생년월일을 확인하세요.');
                        return false;
                    }
                    // 이메일 정규식
                    if (mailJ.test($('#m_email').val())) {
                        console.log(mailJ.test($('#m_email').val()));
                        inval_Arr[4] = true;
                    } else {
                        inval_Arr[4] = false;
                        alert('이메일을 확인하세요.');
                        return false;
                    }
                    // 휴대폰번호 정규식
                    if (phoneJ.test($('#m_phone').val())) {
                        console.log(phoneJ.test($('#m_phone').val()));
                        inval_Arr[5] = true;
                    } else {
                        inval_Arr[5] = false;
                        alert('휴대폰 번호를 확인하세요.');
                        return false;
                    }
                    //주소확인 
                    if (address.val() == '') {
                        inval_Arr[6] = false;
                        alert('주소를 확인하세요.');
                        return false;
                    } else inval_Arr[6] = true;
                    //전체 유효성 검사
                    var validAll = true;
                    for (var i = 0; i < inval_Arr.length; i++) {
                        if (inval_Arr[i] == false) {
                            alert('오류몇번째' + i);
                            validAll = false;
                        }
                    }
                    if (validAll == true) { // 유효성 모두 통과 
                        alert('TAIN 회원가입을 완료하였습니다.');
                    } else {
                        alert('정보를 다시 확인하세요.')
                    }
                });
                $('#m_id').blur(function() {
                    if (idJ.test($('#m_id').val())) {
                        console.log('true');
                        $('#id_check').text('');
                    } else {
                        console.log('false');
                        $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
                        $('#id_check').css('color', 'red');
                    }
                });
                $('#m_pw').blur(function() {
                    if (pwJ.test($('#m_pw').val())) {
                        console.log('true');
                        $('#pw_check').text('');
                    } else {
                        console.log('false');
                        $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
                        $('#pw_check').css('color', 'red');
                    }
                });
              //1~2 패스워드 일치 확인
              $('#m_pw2').blur(function() { 
            	  if ($('#m_pw').val() != $(this).val()) { 
            		  $('#pw2_check').text('비밀번호가 일치하지 않습니다.'); 
            		  $('#pw2_check').css('color', 'red'); 
            		  } else {
            			  $('#pw2_check').text(''); 
            			  } 
            	  });

                //이름에 특수문자 들어가지 않도록 설정
                $("#m_name").blur(function() {
                    if (nameJ.test($(this).val())) {
                        console.log(nameJ.test($(this).val()));
                        $("#name_check").text('');
                    } else {
                        $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
                        $('#name_check').css('color', 'red');
                    }
                });
                $("#m_email").blur(function() {
                    if (mailJ.test($(this).val())) {
                        $("#email_check").text('');
                    } else {
                        $('#email_check').text('이메일 양식을 확인해주세요.');
                        $('#email_check').css('color', 'red');
                    }
                });
                // 생일 유효성 검사 
                var birthJ = false;
                // 생년월일 birthJ 유효성 검사 
                $('#m_birth').blur(function() {
                    var dateStr = $(this).val();
                    var year = Number(dateStr.substr(0, 4)); // 입력한 값의 0~4자리까지 (연) 
                    var month = Number(dateStr.substr(4, 2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월) 
                    var day = Number(dateStr.substr(6, 2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
                    var today = new Date(); // 날짜 변수 선언 
                    var yearNow = today.getFullYear(); // 올해 연도 가져옴 
                    if (dateStr.length <= 8) { // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환 
                        if (year > yearNow || year < 1900) {
                            $('#birth_check').text('생년월일을 확인해주세요');
                            $('#birth_check').css('color', 'red');
                        } else if (month < 1 || month > 12) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if (day < 1 || day > 31) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
                            $('#birth_check').text('생년월일을 확인해주세요 ');
                            $('#birth_check').css('color', 'red');
                        } else if (month == 2) {
                            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                            if (day > 29 || (day == 29 && !isleap)) {
                                $('#birth_check').text('생년월일을 확인해주세요 ');
                                $('#birth_check').css('color', 'red');
                            } else {
                                $('#birth_check').text('');
                                birthJ = true;
                            }
                        } else {
                            $('#birth_check').text('');
                            birthJ = true;
                        } //end of if 
                    } else {
                        //1.입력된 생년월일이 8자 초과할때 : auth:false 
                        $('#birth_check').text('생년월일을 확인해주세요 ');
                        $('#birth_check').css('color', 'red');
                    }
                });
                // 휴대전화
                $('#m_phone').blur(function() {
                    if (phoneJ.test($(this).val())) {
                        console.log(phoneJ.test($(this).val()));
                        $("#phone_check").text('');
                    } else {
                        $('#phone_check').text('휴대폰번호를 확인해주세요 ');
                        $('#phone_check').css('color', 'red');
                    }
                });
            });
            //우편번호 찾기 버튼 클릭시 발생 이벤트
            function execPostCode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
                        // 도로명 주소의 노출 규칙에 따라 주소를 조합
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 
                        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수 
                        var extraRoadAddr = ''; // 도로명 조합형 주소 변수 
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외) 
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다. 
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
                        if (fullRoadAddr !== '') {
                            fullRoadAddr += extraRoadAddr;
                        }
                        // 우편번호와 주소 정보를 해당 필드에 넣는다. 
                        console.log(data.zonecode);
                        console.log(fullRoadAddr);
                        /* var a = console.log(data.zonecode); 
                        var b = console.log(fullRoadAddr); 
                        if(a == null || b = null){ alert("주소를 확인하세요."); 
                        return false; } */
                        $("[name=m_addr1]").val(data.zonecode);
                        $("[name=m_addr2]").val(fullRoadAddr);
                        document.getElementById('m_addr1').value = data.zonecode; //5자리 새우편번호 사용 
                        document.getElementById('m_addr2').value = fullRoadAddr;
                        //document.getElementById('mem_detailaddress').value = data.jibunAddress; 
                    }
                }).open();
            }
        </script>

</head>

<body>
	<div class="wrapper">
		<div class="background">
			<div class="left">
				<h2 class="back-header">Tain</h2>
				<p class="back-p">..</p>
				<button class="back-btn signup-but">일반 회원</button>
			</div>
			<div class="right">
				<h2 class="back-header">Business</h2>
				<p class="back-p">shop</p>
				<button class="back-btn login-but">비지니스 회원</button>
			</div>
		</div>
		<div class="form-container">
			<div class="sign-up">
				<div class="join_form">
					<form action="${pageContext.request.contextPath}/member/join.do"
						method="post">
						<div class="join_box">
							<h2>Join</h2>
							<div class="form_group">
								<input type="text" class="form_control" id="m_id" name="m_id"
									placeholder="아이디">
								<div class="check_font" id="id_check"></div>
							</div>
							<div class="form_group">
								<input type="text" class="form_control" id="m_name"
									name="m_name" placeholder="이름">
								<div class="check_font" id="name_check"></div>
							</div>
							<div class="form_group">
								<input type="password" class="form_control" id="m_pw"
									name="m_pw" placeholder="비밀번호">
								<div class="check_font" id="pw_check"></div>
							</div>
							<div class="form_group">
								<input type="password" class="form_control" id="m_pw2"
									name="m_pw2" placeholder="비밀번호 확인">
								<div class="check_font" id="pw2_check"></div>
							</div>

							<div class="form_group">
								<input type="tel" class="form_control" id="m_birth"
									name="m_birth" placeholder="생년월일">
								<div class="check_font" id="birth_check"></div>
							</div>
							<div class="form_group">
								<input type="tel" class="form_control" id="m_phone"
									name="m_phone" placeholder="휴대폰 번호">
								<div class="check_font" id="phone_check"></div>
							</div>
							<div class="form_group">
								<input type="email" class="form_control" id="m_email"
									name="m_email" placeholder="E-mail">
								<div class="check_font" id="email_check"></div>
							</div>
							<div class="form_group">
								<input class="form_control" style="width: 40%; display: inline;"
									placeholder="우편번호" name="m_addr1" id="m_addr1" type="text"
									readonly="readonly">
								<button type="button" class="btn btn-default"
									onclick="execPostCode();">
									<i class="fa fa-search"></i> 우편번호 찾기
								</button>
							</div>
							<div class="form_group">
								<input class="form_control" style="top: 5px;"
									placeholder="도로명 주소" name="m_addr2" id="m_addr2" type="text"
									readonly="readonly" />
							</div>
							<div class="form_group">
								<input class="form_control" placeholder="상세주소" name="m_addr3"
									id="m_addr3" type="text" />
							</div>
							<div class="text_center">
								<button type="submit" class="btn btn-primary">회원가입</button>
								<div class="bottom-text">
									<a href="${pageContext.request.contextPath}/member/loginPage">
										로그인으로 돌아가기</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="login-hide">
				<%@ include file="/WEB-INF/views/member/businessjoin.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>