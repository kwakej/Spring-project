<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
	font-weight: 800;
}

body {
	font-family: Arial;
}

svg {
	display: block;
	font: 10.5em 'Montserrat';
	width: 960px;
	height: 300px;
	margin: 0 auto;
}

.text-copy {
	fill: none;
	stroke: white;
	stroke-dasharray: 6% 29%;
	stroke-width: 3px;
	stroke-dashoffset: 0%;
	animation: stroke-offset 5.5s infinite linear;
}

.text-copy:nth-child(1){
	stroke: #dd5d20;
	animation-delay: -1;
}

.text-copy:nth-child(2){
	stroke: #144d2a;
	animation-delay: -2s;
}

.text-copy:nth-child(3){
	stroke: #df871b;
	animation-delay: -3s;
}

.text-copy:nth-child(4){
	stroke: #da3931;
	animation-delay: -4s;
}

.text-copy:nth-child(5){
	stroke: #3291b6;
	animation-delay: -5s;
}
@keyframes stroke-offset { 
100% {
	stroke-dashoffset: -30%;
}

}
.login_box {
	width: 400px;
	height: 450px;
	padding: 80px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%)
}

.lofin_msg {
	font-size: 25px;
	color: #144d2af8;
	text-align: center;
	margin-bottom: 60px;
}

.form_group {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 30px 0;
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
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	border-radius: 10px;
	background-size: 200%;
	border-color: white;
	color: #fff;
	outline: none;
	transition: .5s;
	border-radius: 10px;
	background-color: #144d2af8;
}

.btn-primary:hover {
	background-position: right;
}

.find_link {
	margin-top: 30px;
	text-align: center;
}

.find_link a {
	text-decoration: none;
	color: #df871b;
}
</style>
</head>
<body>
	<svg viewBox="0 0 960 300">
        <symbol id="s-text">
            <text text-anchor="middle" x="50%" y="80%">Tain</text>
        </symbol>
    
        <g class="g-ants">
            <use xlink:href="#s-text" class="text-copy"></use>
            <use xlink:href="#s-text" class="text-copy"></use>
            <use xlink:href="#s-text" class="text-copy"></use>
            <use xlink:href="#s-text" class="text-copy"></use>
            <use xlink:href="#s-text" class="text-copy"></use>
        </g>
    </svg>
	<div class="login_box">
		<div class="login_box_body">
			<div class="lofin_msg">
				<p>Login</p>
			</div>
			<form action="${pageContext.request.contextPath}/member/login.do"
				method="post">
				<div class="form_group">
					<input type="text" name="m_id" class="form_control"
						placeholder="아이디">
				</div>
				<div class="form_group">
					<input type="password" name="m_pw" class="form_control"
						placeholder="비밀번호">
				</div>
				<div class="row">
					<div class="login">
						<button type="submit" class="btn btn-primary ">LOGIN</button>
					</div>
				</div>
			</form>
			<div class="find_link">
				<a href="${pageContext.request.contextPath}/member/memberFindId.do">아이디/비밀번호를
					잊으셨나요?</a>
			</div>
			<div class="find_link">
				계정이 없으신가요?<a
					href="${pageContext.request.contextPath}/member/joinPage">가입하기</a>
			</div>
		</div>
	</div>
</body>
</html>