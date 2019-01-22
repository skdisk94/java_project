<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="ezenMall.orders.CartDTO"%>
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
<script>
	/* function delcheck() {
	 result = confirm("이 상품을 삭제할까요?");
	 document.location.href = "../view/cart_control.jsp?action=del";
	 if (result != true) 
	 return; */

	function delcheck(pId) {
		result = confirm("이 상품을 삭제할까요?");

		if (result == true) {
			document.location.href = "../control/cart_control.jsp?action=del&cartId="+pId;
			//document.form1.submit();
		} else
			return;
	}

	function edit(number) {
		result = confirm("수정 할까요?");

		if (result == true) {
			//document.location.href = "../control/cart_control.jsp?action=edit&cartId="+pId+"&cartQuantity="+quantity;
			document.form1.action = "../control/cart_control.jsp?action=edit&number="+number;
			document.form1.method="POST";
			document.form1.submit();
		} else
			return;
	}

	function buy() {
		result = confirm("구매 하시겠습니까?");

		if (result == true) {
			document.form1.action = "../control/buy_control.jsp?action=buy";
			document.form1.method = "post";
			document.form1.submit();
		} else
			return;
	}

	function pre() {
		history.go(-1);
	}
</script>
<style>
	.navbar-brand{
	font-family : "Delicious-Roman";
	}
	.dropdown{
	font-family : "iropkeBatangM";
	}
	.table{
	font-family : "Delicious-Roman";
	}
	p{
	font-family : "iropkeBatangM";
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="../view/index.jsp"><img src="../img/EzenLogo2.png" width="160" height="60"></a>
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
						<!--</li>있었는데 지움  -->
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
							href="../control/user_control.jsp?action=logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							} else {
						%>
						<a href="../view/loginForm.jsp">로그인</a>&nbsp;&nbsp; <a
							href="..view/registerForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							}
						%>
					</p>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<br><br><br>
	<div class="row" style="margin-top: 90px">
		<div class="col-md-1"></div>
		<div class="col-md-10">
				<form name="form1">
					<table class="table">
						<thead>
							<th class="col-md-2 text-center">IMAGE</th>
							<th class="col-md-2 text-center">INFO</th>
							<th class="col-md-2 text-center">PRICE</th>
							<th class="col-md-2 text-center">QTY</th>
							<th class="col-md-1 text-center">TOTAL</th>
							<th class="col-md-1 text-center">BUTTON</th>
						</thead>
						<%
							int number = 1;
						%>
						<c:set var="cartList" value="${sessionScope.sessionCart}" />
						<c:forEach var="cDto" items="${cartList}">

							<tr>
								<td align="center"><img src="${cDto.imgName}" width="50px"
									height="50px"></td>
								<td align="center">${cDto.pName}</td>
								<td align="center">단가 : ${cDto.unitPrice }</td>
								<td align="center">수량 : <input type="number"
									name="quantity<%=number%>" min="1"
									style="WIDTH: 50px; HEIGHT: 18px" value="${cDto.quantity}"></td>
								<td align="center">합계 : ${cDto.sum }</td>
								<td align="center"><img src="../img/fix.png" width="20"
									height="20" onClick="edit(<%=number%>)"> <img
									src="../img/delete.png" width="20" height="20"
									onClick="delcheck(${cDto.pId})"> <input type="hidden"
									name="cartId<%=number%>" value="${cDto.pId}"> <input
									type="hidden" name="cartUnitPrice<%=number%>"
									value="${cDto.unitPrice}"></td>
							</tr>
							<%
								number++;
							%>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td align="center"><input type="submit" value="구매"
								onClick="buy()"> <input type="button" value="이전페이지로"
								onClick="pre()"></td>
							<td align="center"></td>
							<td align="center">합계 : ${sessionScope.total }</td>
							<td></td>
						</tr>
					</table>
				</form>
				<!-- </form> -->
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>