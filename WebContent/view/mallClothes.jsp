<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="ezenMall.products.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>Ezen Shopping Mall</title>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
<script>
	function addList() {
		alert("장바구니에 담기완료!");
	}
</script>
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
						</li>
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
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			<li data-target="#carousel-example-generic" data-slide-to="4"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="../img/fshMain1.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/fshMain2.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/fshMain3.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/fshMain4.jpg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../img/fshMain5.jpg">
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
	<div class="container">
		<div class="row" style="margin-top: 70px">
			<div class="col-md-offset-1 col-md-11"></div>
			<div class="col-md-12"></div>
			<div class="col-md-1"></div>
			<c:set var="clothesImg" value="${requestScope.clothesImg}" />
			<c:forEach var="pDto" items="${clothesImg}">
				<div class="col-md-2">
					<div class="thumbnail">
						<a data-target="#modal${pDto.pId}" data-toggle="modal"><img
							src="${pDto.pImgName}" alt="${pDto.pName}"></a>
						<div class="caption" style="text-align: center;">
							<h5>
								<b>${pDto.pName}</b>
							</h5>
							<p>가격:${pDto.pUnitPrice}원
							<p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="container">
				<div class="row">
					<div class="col-md-offset-1 col-md-12"></div>
					<div class="col-md-12"></div>
					<div class="col-md-1"></div>
					<c:set var="pantsImg" value="${requestScope.pantsImg}" />
					<c:forEach var="pDto" items="${pantsImg}">
						<div class="col-md-2">
							<div class="thumbnail">
								<a data-target="#modal${pDto.pId}" data-toggle="modal"><img
									src="${pDto.pImgName}" alt="${pDto.pName}"></a>
								<div class="caption" style="text-align: center;">
									<h5>
										<b>${pDto.pName}</b>
									</h5>
									<p>가격:${pDto.pUnitPrice}원
									<p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<c:set var="clothesImg" value="${requestScope.clothesImg}" />
	<c:forEach var="pDto" items="${clothesImg}">
		<div class="row">
			<div class="modal fade" id="modal${pDto.pId}" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<font size="5pt">${pDto.pName}</font>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<form action="../control/cart_control.jsp?action=add"
							method="post">
							<div class="modal-body">
								<table align="center">
									<tr>
										<td rowspan="2" align="center"><img
											src="${pDto.pImgName}"></td>
										<td rowspan="2" align="center"><font size="4pt">${pDto.pName}</font><br>
											<br> 주문수량 :&nbsp;&nbsp;<input type="number"
											name="quantity" min="1" value="1"
											style="width: 50px; height: 18px;"><br> <br>
											가격: ${pDto.pUnitPrice}원<br> <br> <input
											type="hidden" name="pId" value="${pDto.pId}"> <input
											type="hidden" name="pName" value="${pDto.pName}"> <input
											type="hidden" name="unitPrice" value="${pDto.pUnitPrice}">
											<input type="hidden" name="imgName" value="${pDto.pImgName}">
											<input type="submit" value="장바구니 담기" onClick="addList()">
										</td>
									<tr>
									</tr>
									<tr>
									<tr>
										<td><br></td>
									</tr>
									<tr>
										<td colspan="2">${pDto.pDescription}</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<c:set var="pantsImg" value="${requestScope.pantsImg}" />
	<c:forEach var="pDto" items="${pantsImg}">
		<div class="row">
			<div class="modal fade" id="modal${pDto.pId}" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<font size="5pt">${pDto.pName}</font>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<form action="../control/cart_control.jsp?action=add"
							method="post">
							<div class="modal-body">
								<table align="center">
									<tr>
										<td rowspan="2" align="center"><img
											src="${pDto.pImgName}"></td>
										<td rowspan="2" align="center"><font size="4pt">${pDto.pName}</font><br>
											<br> 주문수량 :&nbsp;&nbsp;<input type="number"
											name="quantity" min="1" value="1"
											style="width: 50px; height: 18px;"><br> <br>
											가격: ${pDto.pUnitPrice}원<br> <br> <input
											type="hidden" name="pId" value="${pDto.pId}"> <input
											type="hidden" name="pName" value="${pDto.pName}"> <input
											type="hidden" name="unitPrice" value="${pDto.pUnitPrice}">
											<input type="hidden" name="imgName" value="${pDto.pImgName}">
											<input type="hidden" name="description"
											value="${pDto.pDescription}"> <input type="submit"
											value="장바구니 담기" onClick="addList()"></td>
									<tr>
									</tr>
									<tr>
									<tr>
										<td><br></td>
									</tr>
									<tr>
										<td colspan="2">${pDto.pDescription}</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

</body>
</html>