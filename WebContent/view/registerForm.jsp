<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>Ezen Shopping Mall</title>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
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
.panel-login {
	background-color: #eee;
	border-color: #eee;
	/*-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2); */
}

.panel-login>.panel-heading {
	color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #747474;
	
	/* font-weight: bold; */	
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

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

.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #C3C3C3;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #444942;
}

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
					<a href="../view/index.jsp"><img src="../img/EzenLogo2.png" width="160" height="60"></a>
				</div>
				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<%-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">
								상품 매장&nbsp;<i class="glyphicon glyphicon-qrcode"></i>&nbsp;&nbsp;<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="../control/product_control.jsp?action=viewClothes">패션의류</a></li>
								<li><a href="#">휴대폰</a></li>
								<li><a href="#">가구</a></li>
							</ul></li>
						<%
							if (session.getAttribute("cId") != null) {
						%>
						<li><a href="../control/cart_control.jsp?action=home">장바구니&nbsp;<i class="glyphicon glyphicon-shopping-cart"></i></a></li>
						<li><a href="#">주문내역&nbsp;<i class="glyphicon glyphicon-list-alt"></i></a></li>
						<%
							}
						%> --%>
					</ul>
				</div>
				<div class="col-md-4">
					<p class="navbar-text navbar-right">
						<%
							if (session.getAttribute("cId") != null) {
						%>
						${sessionScope.cName} 고객님 환영합니다.&nbsp;&nbsp; <a
							href="../control/user_control.jsp?action=logout"
							style="color: black; text-decoration: none;">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							} else {
						%>
						<a href="../view/loginForm.jsp"
							style="color: black; text-decoration: none;"><b>로그인</b></a>&nbsp;&nbsp;
						<a href="../view/registerForm.jsp"
							style="color: black; text-decoration: none;"><b>회원가입</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					<h2>CREATE AN ACCOUNT</h2>
					</p>
					<p>
					<h5>By creating an account with our store, you will be able to move through the checkout process faster, <br>store multiple shipping addresses, view and track your orders in your account and more.</h5>
					</p>
				</div>
				<br>
				<br>
				<br>
				<br>
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
								<a href="#" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" class="active" id="register-form-link">회원가입</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="../control/user_control.jsp?action=login"
									method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="cId" id="username" tabindex="1"
											class="form-control" placeholder="UserId" value="">
									</div>
									<div class="form-group">
										<input type="password" name="cPassword" id="password"
											tabindex="2" class="form-control" placeholder="Password">
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
								<form id="register-form" action="../control/user_control.jsp?action=new"
									method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="cName" id="username" tabindex="1"
											class="form-control" placeholder="이름" value="">
									</div>
									<div class="form-group">
										<input type="password" name="cPassword" id="passwd"
											tabindex="1" class="form-control" placeholder="패스워드" value="">
									</div>
									<div class="form-group">
										<input type="email" name="cEmail" id="email" tabindex="2"
											class="form-control" placeholder="이메일">
									</div>
									<div class="form-group">
										<input type="text" name="cTel" id="tel" tabindex="2"
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