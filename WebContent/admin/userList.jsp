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
<title>Ezen Shopping Mall(Admin)</title>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
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
								<li><a href="../control/admin_control.jsp?action=viewDaily&page=1">일단위 고객 매출액</a></li>
								<li><a href="../control/admin_control.jsp?action=viewCustomer&page=1">고객별 매출액</a></li>
								<li><a href="../control/admin_control.jsp?action=viewProduct&page=1">일단위 상품별 판매 내역</a></li>
							</ul></li>

						<li><a href="../control/admin_control.jsp?action=showUserList&page=1">사용자 목록&nbsp;<i
								class="glyphicon glyphicon-user"></i></a></li>
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

	<div class="row" style="margin-top: 90px">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="panel panel-primary" align="center">
				<div class="panel-heading">사용자 목록</div>
				<!-- <form action="order 와 sold_product에 인서트를 하기위한 컨트롤로" method="post"> -->
				<table class="table">
					<thead>
						<th class="col-md-2 text-center">사용자Id</th>
						<th class="col-md-2 text-center">사용자이름</th>
						<th class="col-md-2 text-center">이메일</th>
						<th class="col-md-2 text-center">전화번호</th>
					</thead>
					<c:set var="userList" value="${requestScope.showUser}" />
					<c:forEach var="uList" items="${userList}">

						<tr>
							<td align="center">${uList.cId}</td>
							<td align="center">${uList.cName}</td>
							<td align="center">${uList.cEmail}</td>
							<td align="center">${uList.cTel}</td>
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
									<li><a href="../control/admin_control.jsp?action=showUserList&page=${pageNum}" >${pageNum}</a></li>
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
				<!-- </form> -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<!-- ==================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>