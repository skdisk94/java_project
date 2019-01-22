<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Ezen Shopping Mall(Admin)</title>
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

div {
	font-family: "Times New Roman";
}

h2 {
	font-family: "iropkeBatangM";
}

p {
	font-family: "iropkeBatangM";
}

div.carousel-caption {
	font-family: "iropkeBatangM";
}
/* .item{
	height : 80vh;
	max-width: auto;	
	} */
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="../admin/admin.jsp"><img src="../img/EzenLogo2.png" width="160" height="60"></a>
					</a>
				</div>
				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<%
							if (session.getAttribute("aId") != null) {
						%>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">
								매출액 확인&nbsp;<i class="glyphicon glyphicon-usd"></i>&nbsp;&nbsp;<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="../control/admin_control.jsp?action=viewDaily&page=1">일단위
										고객 매출액</a></li>
								<li><a
									href="../control/admin_control.jsp?action=viewCustomer&page=1">고객별
										매출액</a></li>
								<li><a
									href="../control/admin_control.jsp?action=viewProduct&page=1">일단위
										상품별 판매 내역</a></li>
							</ul></li>

						<li><a
							href="../control/admin_control.jsp?action=showUserList&page=1">사용자
								목록&nbsp;<i class="glyphicon glyphicon-user"></i>
						</a></li>
						<%
							}
						%>
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
	<br>
	<br>
	<br>
	<!-- carousel section -->

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="../img/mngMain1.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/mngMain2.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/mngMain3.jpg">
				<div class="carousel-caption"></div>
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<h2 align="center"> 관리자 모드</h2>
      	<p align="center"> 이젠몰 관리자용 사이트입니다.</p>
	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>