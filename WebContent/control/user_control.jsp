<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cDto" class="ezenMall.customers.CustomersDTO" />
<jsp:setProperty name="cDto" property="*" />
<jsp:useBean id="cDao" class="ezenMall.customers.CustomersDAO" />
<%

	String action = request.getParameter("action");
	switch (action) {
	
	case "new":
		if (cDao.addCustomers(cDto)) {
			String cId = cDao.getCustomersId();
			request.setAttribute("message", "정상적으로 등록 되었습니다. 사용할 ID는 "+cId+" 입니다.");
			request.setAttribute("url", "../view/index.jsp");
			pageContext.forward("../common/alert.jsp");
		} else {
			out.println("<script>alert('같은 아이디가 존재 합니다.');history.go(-1);</script>");
		}
		break;
	case "login": 
		if (cDao.login(Integer.parseInt(cDto.getcId()), cDto.getcPassword())) {
			session.setAttribute("cId", cDto.getcId());
			session.setAttribute("cName", cDao.getCustomersName(Integer.parseInt(cDto.getcId())));
			request.setAttribute("message", "정상적으로 로그인 되었습니다.");
			request.setAttribute("url", "../view/index.jsp");
			pageContext.forward("../common/alert.jsp");
		}
		else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.');history.go(-1);</script>");
		}
		break;
	case "logout":
		session.removeAttribute("cId");
		session.removeAttribute("cName");
		session.removeAttribute("sessionCart");
		response.sendRedirect("../view/index.jsp");
		break;
	}
%>
