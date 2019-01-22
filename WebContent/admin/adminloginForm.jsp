<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>Ezen Shopping Mall</title>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
<script type="text/javascript">
	// Input 항목 유효성 검사
	function isValidLogin() {
		var cId = document.getElementById("cId");
		var cPwd = document.getElementById("cPassword");
		/* var rgx_c_id = /^[a-z]+[a-z0-9_]{5,11}$/; 	// 아이디 정규 표현식
		var rgx_pwd = /^[a-zA-Z0-9!@#$%^*+=-_]{8,20}$/;	// 패스워드 정규 표현식
		var rgx_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;	// 엄격한 패스워드 정규 표현식 */

		if (rgx_cId.test(cId.value) != true) {
			alert('[ID 입력 오류] 유효한 ID를 입력해 주십시요.');
			cId.focus();
			return false;
		}
		if (rgx_cPwd.test(cPwd.value) != true) {
			alert('[PWD 입력 오류] 유효한 패스워드를 입력해 주십시요.');
			cPwd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<style>
body {
	background-color: #eee;
}

navbar-brand {
	font-family: "Delicious-Roman";
}

dropdown {
	font-family: "iropkeBatangM";
}

h2 {
	font-family: "Times New Roman";
}

h5 {
	font-family: "iropkeBatangM";
}
</style>
</head>
<body>
	<style type="text/css">

/* 로그인 박스 테두리 선 */
.panel-login {
	background-color: #eee;
	border-color: #eee;
	/* border-color: #ccc; */
	/* -webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2); */
}

.panel-login>.panel-heading {
	color: #fff;
	border-color: #fff;
	text-align: center;
}

/* 로그인 회원가입 상단버튼 기본 */
.panel-login>.panel-heading a {
	text-decoration: none;
	color: #747474;
	/* font-weight: bold; */
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

/* 로그인 회원가입 상단버튼 색상 조절 */
.panel-login>.panel-heading a.active {
	color: #4C5845;
	font-size: 20px;
	font-weight: bold;
}

.panel-login>.panel-heading hr {
	margin-top: 0px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 0px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

/* 아이디 비밀번호 입력창 */
.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #C3C3C3;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

/* 아이디 비밀번호 입력창 호버 */
.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #444942;
}

/* 로그인 회원가입 하단버튼 조절 */
.btn-login {
	background-color: #4C5845;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #4C5845;
}

/* 마우스 클릭 시 로그인 회원가입 글씨 뚜렷 */
.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #394035;
	border-color: #394035;
}

.forgot-password {
	text-decoration: underline;
	color: #929292;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #565656;
}

.btn-register {
	background-color: #4C5845;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #4C5845;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #394035;
	border-color: #394035;
}
</style>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="../admin/admin.jsp"><img src="../img/EzenLogo2.png" width="160" height="60"></a>
					</a>
				</div>
				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<%-- <%
							if (session.getAttribute("aId") != null) {
						%>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							매출액 확인&nbsp;<i class="glyphicon glyphicon-qrcode"></i>&nbsp;&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">일단위 고객 매출액</a></li>
								<li><a href="#">고객별 매출액</a></li>
								<li><a href="#">일단위 상품별 판매 내역</a></li>
							</ul>
						</li>
						
						<li><a href="../control/admin_control.jsp?action=showUserList">사용자 목록&nbsp;<i class="glyphicon glyphicon-user"></i></a></li>
						<%
							}
						%> --%>
					</ul>
				</div>
				<div class="col-md-4">
					<p class="navbar-text navbar-right">
						<%
							if (session.getAttribute("aId") != null) {
						%>
						${sessionScope.aName} 관리자님 환영합니다.&nbsp;&nbsp; <a
							href="../control/admin_control.jsp?action=adminlogout"
							style="color: black; text-decoration: none;">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							} else {
						%>
						<a href="../admin/adminloginForm.jsp"
							style="color: black; text-decoration: none;">로그인</a>&nbsp;&nbsp;
						<a href="../admin/adminregisterForm.jsp"
							style="color: black; text-decoration: none;">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							}
						%>
					</p>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">
		<div class="row" style="margin-top: 100px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="jumbotron">
					<p>
					<h2>LOGIN</h2>
					</p>
					<p>
					<h5>If you have an account with us, log in using your ID and
						PASSWORD.</h5>
					</p>
				</div>
				<br> <br> <br> <br>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">회원가입</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form"
									action="../control/admin_control.jsp?action=adminlogin"
									method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="aId" id="username" tabindex="1"
											class="form-control" placeholder="관리자Id" value="">
									</div>
									<div class="form-group">
										<input type="password" name="aPassword" id="password"
											tabindex="2" class="form-control" placeholder="패스워드">
									</div>
									<!-- <div class="form-group text-center">
											<input type="checkbox" tabindex="3" class="" name="remember"
												id="remember"> <label for="remember">
												Remember Me</label>
										</div> -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit"
													tabindex="4" class="form-control btn btn-login" value="로그인">
											</div>
										</div>
									</div>
									<!-- <div class="form-group">
											<div class="row">
												<div class="col-lg-12">
													<div class="text-center">
														<a href="https://phpoll.com/recover" tabindex="5"
															class="forgot-password">Forgot Password?</a>
													</div>
												</div>
											</div>
										</div> -->
								</form>
								<form id="register-form"
									action="../control/admin_control.jsp?action=adminnew"
									method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="aName" id="username" tabindex="1"
											class="form-control" placeholder="이름" value="">
									</div>
									<div class="form-group">
										<input type="password" name="aPassword" id="password"
											tabindex="1" class="form-control" placeholder="패스워드">
									</div>
									<div class="form-group">
										<input type="text" name="aDept" id="dept" tabindex="2"
											class="form-control" placeholder="부서명" value="">
									</div>
									<div class="form-group">
										<input type="text" name="aTel" id="tel" tabindex="2"
											class="form-control" placeholder="전화번호">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit"
													id="register-submit" tabindex="4"
													class="form-control btn btn-register" value="등록">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
				$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
				$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
	</script>
</body>


</html>