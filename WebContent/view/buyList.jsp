<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.navbar-brand {
	font-family: "Delicious-Roman";
}

.dropdown {
	font-family: "iropkeBatangM";
}

.table {
	font-family: "Delicious-Roman";
}

p {
	font-family: "iropkeBatangM";
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
							data-toggle="dropdown" role="button" aria-expanded="false">상품매장&nbsp;<i
								class="glyphicon glyphicon-qrcode"></i>&nbsp;&nbsp;<span
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
		<!-- /.container-fluid -->
	</nav>

	<div class="row" style="margin-top: 90px">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<!-- 
			<div class="panel panel-primary" align="center">
				<div class="panel-heading">주문 내역</div> -->
			<table class="table">
				<thead>
					<th class="col-md-2 text-center">주문번호</th>
					<th class="col-md-5 text-center">주문날짜</th>
					<th class="col-md-5 text-center">주문가격</th>
				</thead>
				<c:set var="orderHistory" value="${requestScope.orderHistory}" />
				<c:forEach var="oDto" items="${orderHistory}">

					<tr data-target="#modal${oDto.oId}" data-toggle="modal">
						<td align="center">${oDto.oId}</td>
						<td align="center">${oDto.oDate}</td>
						<td align="center">${oDto.oPrice}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<c:set var="pageArray" value="${requestScope.pageArray}" />
								<c:forEach var="pageNum" items="${pageArray}">
									<c:choose>
										<c:when test="${currentPage==pageNum }">
											<li class="active"><a href="#">${pageNum}</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="../control/admin_control.jsp?action=showUserList&page=${pageNum}">${pageNum}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>

	<c:set var="orderHistory" value="${requestScope.orderHistory}" />
	<c:forEach var="oDto" items="${orderHistory}">
		<div class="row">
			<div class="modal fade" id="modal${oDto.oId}" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							주문 번호 : ${oDto.oId}
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" style="text-align: center;">
							<c:set var="detailList" value="${requestScope.detailList}" />
							<c:forEach var="dODto" items="${detailList}">
								<c:choose>
									<c:when test="${oDto.oId.equals(dODto.oId)}">
										<div style="display: inline-block;">
											<img src="${dODto.imgName}"
												style="width: 100px; height: 100px;"><br>
											${dODto.pName}<br> 가격: ${dODto.unitPrice}원<br> 주문수량
											:&nbsp;&nbsp;${dODto.quantity}<br> 가격 : ${dODto.price} 원
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
						<div align="center">총액 : ${oDto.oPrice}</div>
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