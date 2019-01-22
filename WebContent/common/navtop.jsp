<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

carousel-inner.item {
	height: 100%;
	max-width: auto;
}
</style>
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
									href="../control/product_control.jsp?action=viewFuniture">가구</a></li>
							</ul></li>
						<%
							if (session.getAttribute("cId") != null) {
						%>
						<li><a href="../control/cart_control.jsp?action=home">장바구니&nbsp;<i
								class="glyphicon glyphicon-shopping-cart"></i></a></li>
						<li><a href="../control/buy_control.jsp?action=viewBuyList">주문내역&nbsp;<i
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
		<!-- /.container-fluid -->
	</nav>