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
<title>Ezen Shopping Mall</title>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
<style>
body {
	height: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
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

p {
	font-family: "iropkeBatangM";
}

div.carousel-caption {
	font-family: "iropkeBatangM";
}

.item {
	height: 100vh;
	max-width: auto;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="../view/index.jsp"><img src="../img/EzenLogo2.png"
						width="160" height="60"></a>
				</div>
				<div class="col-md-4">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">
								상품 매장&nbsp;<i class="glyphicon glyphicon-qrcode"></i>&nbsp;&nbsp;<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="../control/product_control.jsp?action=viewClothes">패션의류</a></li>
								<li><a
									href="../control/product_control.jsp?action=viewBicycle">자전거</a></li>
								<li><a
									href="../control/product_control.jsp?action=viewFurniture">가구</a></li>
							</ul></li>
						<%
							if (session.getAttribute("cId") != null) {
						%>
						<li><a href="../control/cart_control.jsp?action=home">장바구니&nbsp;<i
								class="glyphicon glyphicon-shopping-cart"></i></a></li>
						<li><a href="../control/buy_control.jsp?action=viewBuyList&page=1">주문내역&nbsp;<i
								class="glyphicon glyphicon-list-alt"></i></a></li>
						<%
							}
						%>
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
	</nav>

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
				<img src="../img/main1.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/main2.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/main3.jpg">
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
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="../admin/admin.jsp"><img src="../img/EzenLogo2.png" width="140" height="40"></a>
				</div>
				<div class="col-md-4">
					<p class="navbar-text navbar-center">
						Copyright &copy; 2018, C조. All rights reserved.
					</p>
				</div>
				<div class="col-md-4">
					<p class="navbar-text navbar-right">
						자바기반 빅데이터 머신러닝 활용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</div>
			</div>
		</div>
	</nav>
	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>