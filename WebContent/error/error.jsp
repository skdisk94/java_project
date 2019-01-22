<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link href="../css/bootstrap.min1.css" rel="stylesheet">
<body>
	<script>
		function pre() {
			history.go(-1);
		}
	</script>
	<div align="center">
		<H2>에러 입니다.</H2>
		<HR>
		<table cellpadding=5 width=400>
			<tr align="center">
				<td>
				<h3>예상치 못한 오류 입니다.</h3>
				<br> <br> <br> <br> <br>
				<i class="glyphicon glyphicon-chevron-left" onClick="pre()">
						이전페이지로</i></td>
			</tr>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</HTML>