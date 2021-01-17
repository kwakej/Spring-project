<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="join_form">
		<form action="/" method="post">
			<div class="join_box">
				<h2>Business</h2>
				<div class="form_group">
					<input type="text" class="form_control" id="m_id" name="m_id"
						placeholder="아이디">
					<div class="check_font" id="id_check"></div>
				</div>
				<div class="form_group">
					<input type="text" class="form_control" id="m_name" name="m_name"
						placeholder="이름">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form_group">
					<input type="password" class="form_control" id="m_pw" name="m_pw"
						placeholder="비밀번호">
					<div class="check_font" id="pw_check"></div>
				</div>
				<div class="form_group">
					<input type="password" class="form_control" id="m_pw2" name="m_pw2"
						placeholder="비밀번호 확인">
					<div class="check_font" id="pw2_check"></div>
				</div>

				<div class="form_group">
					<input type="tel" class="form_control" id="m_birth" name="m_birth"
						placeholder="생년월일">
					<div class="check_font" id="birth_check"></div>
				</div>
				<div class="form_group">
					<input type="tel" class="form_control" id="m_phone" name="m_phone"
						placeholder="휴대폰 번호">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="form_group">
					<input type="email" class="form_control" id="m_email"
						name="m_email" placeholder="E-mail">
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="form_group">
					<input type="text" class="form_control" id="m_intro" name="m_intro"
						placeholder="회사 소개">
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
					<input class="form_control" style="top: 5px;" placeholder="도로명 주소"
						name="m_addr2" id="m_addr2" type="text" readonly="readonly" />
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
</body>
</html>