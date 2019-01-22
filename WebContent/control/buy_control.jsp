<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenMall.orders.*, java.util.*" %>
<jsp:useBean id="oDao" class="ezenMall.orders.OrdersDAO" />
<jsp:useBean id="oDto" class="ezenMall.orders.OrdersDTO" />
<jsp:setProperty property="*" name="oDto"/>
<jsp:useBean id="spDto" class="ezenMall.orders.SoldPDTO" />
<jsp:setProperty property="*" name="spDto"/>
<jsp:useBean id="cDto" class="ezenMall.orders.CartDTO" />
<jsp:setProperty name="cDto" property="*" />
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String action = request.getParameter("action");
	
	switch (action) {
	
	case "home":
		response.sendRedirect("../view/index.jsp");
		break;
		
	case "buy":
		
		List<CartDTO> orderList = (List<CartDTO>)session.getAttribute("sessionCart");
		String customerId = session.getAttribute("cId").toString();
		String total = session.getAttribute("total").toString();
		oDto.setoCustomerId(customerId);
		oDto.setoPrice(total);
		oDao.addOrders(oDto);
		int orderId = oDao.orderIdSelect(Integer.parseInt(customerId));//주문번호 가져오기
		spDto.setsOrderId(Integer.toString(orderId));
		for(CartDTO cart : orderList){
			spDto.setsProductId(cart.getpId());
			spDto.setsQuantity(cart.getQuantity());
			oDao.addSolp(spDto);
		}
		session.removeAttribute("sessionCart");
		response.sendRedirect("../control/buy_control.jsp?action=home");
		break;
		
	case "viewBuyList":
		customerId = session.getAttribute("cId").toString();
		
		int totalPage = oDao.getTotalPageOrder(Integer.parseInt(customerId));
		ArrayList<String> pageArray = new ArrayList<String>();
		for (int i = 1; i <= totalPage; i++) {
			pageArray.add(Integer.toString(i));
		}

		String currentPage = request.getParameter("page");
		//List<AdmincustomersDTO> showUser = aDao.userList(Integer.parseInt(currentPage));
		
		System.out.println(totalPage+"/"+currentPage);
		List<OrdersDTO> orderHistory = oDao.orderHistory(Integer.parseInt(customerId),Integer.parseInt(currentPage));
		List<DetailOrdersDTO> detailList = oDao.detailOrders();
		request.setAttribute("pageArray", pageArray);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("detailList", detailList);
		request.setAttribute("orderHistory", orderHistory);
		pageContext.forward("../view/buyList.jsp");
		break;
	}
%>