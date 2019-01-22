<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="ezenMall.admins.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="aDto" class="ezenMall.admins.AdminDTO" />
<jsp:setProperty name="aDto" property="*" />
<jsp:useBean id="aDao" class="ezenMall.admins.AdminDAO" />
<jsp:useBean id="oDto" class="ezenMall.admins.AdminForOrdersDTO" />
<jsp:setProperty property="*" name="oDto" />
<%
	String action = request.getParameter("action");
	switch (action) {

	case "adminnew":
		if (aDao.addAdmin(aDto)) {
			request.setAttribute("message", "정상적으로 등록 되었습니다.");
			request.setAttribute("url", "../admin/admin.jsp");
			pageContext.forward("../common/alert.jsp");
		} else {
			out.println("<script>alert('같은 아이디가 존재 합니다.');history.go(-1);</script>");
		}
		break;
	case "adminlogin":
		if (aDao.adminLogin(Integer.parseInt(aDto.getaId()), aDto.getaPassword())) {
			session.setAttribute("aId", aDto.getaId());
			session.setAttribute("aName", aDao.getAdminsName(Integer.parseInt(aDto.getaId())));
			request.setAttribute("message", "정상적으로 로그인 되었습니다.");
			request.setAttribute("url", "../admin/admin.jsp");
			pageContext.forward("../common/alert.jsp");
		} else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.');history.go(-1);</script>");
		}
		break;
	case "adminlogout":
		session.removeAttribute("aId");
		session.removeAttribute("aName");
		response.sendRedirect("../admin/admin.jsp");
		break;
	case "showUserList":
		int totalPage = aDao.getTotalPage();
		ArrayList<String> pageArray = new ArrayList<String>();
		for (int i = 1; i <= totalPage; i++) {
			pageArray.add(Integer.toString(i));
		}

		String currentPage = request.getParameter("page");
		List<AdminForCustomersDTO> showUser = aDao.userList(Integer.parseInt(currentPage));
		request.setAttribute("pageArray", pageArray);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("showUser", showUser);
		pageContext.forward("../admin/userList.jsp");
		break;

	case "viewDaily":
		int totalPageByOrders = aDao.getTotalPageSalesList();
		ArrayList<String> pageArrayByDaily = new ArrayList<String>();
		for (int i = 1; i <= totalPageByOrders; i++) {
			pageArrayByDaily.add(Integer.toString(i));
		}

		currentPage = request.getParameter("page");
		List<AdminForOrdersDTO> orderByDaily = aDao.orderByDailyList();
		List<DailyListDTO> detailList = aDao.detailedListByDaily(Integer.parseInt(currentPage));
		request.setAttribute("pageArrayByDaily", pageArrayByDaily);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("orderByDaily", orderByDaily);
		request.setAttribute("detailList", detailList);
		pageContext.forward("../admin/dailyList.jsp");
		break;
	case "viewCustomer":
		int totalPageByCustomer = aDao.getTotalPageSalesList();
		ArrayList<String> pageArrayByCustomer = new ArrayList<String>();
		for (int i = 1; i <= totalPageByCustomer; i++) {
			pageArrayByCustomer.add(Integer.toString(i));
		}

		currentPage = request.getParameter("page");
		List<AdminForOrdersDTO> orderByCustomer = aDao.orderByCustomerList();
		detailList = aDao.detailedListByCustomer(Integer.parseInt(currentPage));
		request.setAttribute("pageArrayByCustomer", pageArrayByCustomer);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("orderByCustomer", orderByCustomer);
		request.setAttribute("detailList", detailList);
		pageContext.forward("../admin/customerList.jsp");
		break;
	case "viewProduct":
		int totalPageByProduct = aDao.getTotalPageByProduct();
		ArrayList<String> pageArrayByProduct = new ArrayList<String>();
		for (int i = 1; i <= totalPageByProduct; i++) {
			pageArrayByProduct.add(Integer.toString(i));
		}

		currentPage = request.getParameter("page");
		orderByDaily = aDao.orderByDailyList();
		List<DailyListDTO> productList = aDao.productSaleList(Integer.parseInt(currentPage));
		request.setAttribute("pageArrayByProduct", pageArrayByProduct);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("orderByDaily", orderByDaily);
		request.setAttribute("productList", productList);
		pageContext.forward("../admin/productSaleList.jsp");
		break;
	}
%>