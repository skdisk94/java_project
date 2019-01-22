<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="ezenMall.orders.*, java.util.*"%>
<jsp:useBean id="cDto" class="ezenMall.orders.CartDTO" />
<jsp:setProperty name="cDto" property="*" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String action = request.getParameter("action");

	switch (action) {

	case "home":
		List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("sessionCart");
		if (cartList == null) { //빼면 에러 카트리스트를 못받는듯
			cartList = new ArrayList<CartDTO>();
		}
		int total = 0;
		for (CartDTO cDto1 : cartList) {
			total += cDto1.getSum();
		}
		session.setAttribute("total", total);
		response.sendRedirect("../view/cart.jsp");
		break;
	case "add":
		cartList = null;

		cartList = (List<CartDTO>) session.getAttribute("sessionCart");
		if (cartList == null) {
			cartList = new ArrayList<CartDTO>();
		}
		String number = request.getParameter("number");
		String pId = request.getParameter("pId");
		String name = request.getParameter("pName");
		String unitPrice = request.getParameter("unitPrice");
		String quantity = request.getParameter("quantity");
		String imgName = request.getParameter("imgName");
		String description = request.getParameter("description");
		int sum = Integer.parseInt(unitPrice) * Integer.parseInt(quantity);
		cDto = new CartDTO(pId, name, unitPrice, quantity, sum, imgName, description);
		boolean overlap = false;
		int originalQuantity=0;
		for (CartDTO cart : cartList) {
			if (cart.getpId().equals(pId)) {
				overlap = true;
				originalQuantity=Integer.parseInt(cart.getQuantity());
			}
		}
		if (overlap) {
			int changeQuantity = originalQuantity+Integer.parseInt(quantity);
			pageContext.forward("../control/cart_control.jsp?action=edit&cartId"+number+"="+pId+"&quantity"+number+"="+changeQuantity+"&cartUnitPrice"+number+"="+unitPrice+"&number="+number);
		} else {
			cartList.add(cDto);
			session.setAttribute("sessionCart", cartList);
			pageContext.forward("../control/cart_control.jsp?action=home");
		}
		break;

	case "del":
		cartList = (List<CartDTO>) session.getAttribute("sessionCart");

		pId = request.getParameter("cartId");

		try {
			for (CartDTO cart : cartList) {
				if (cart.getpId().equals(pId))
					cartList.remove(cart);
			}
		} catch (Exception e) {
		}

		session.setAttribute("sessionCart", cartList);
		pageContext.forward("../control/cart_control.jsp?action=home");

		break;

	case "edit":

		cartList = (List<CartDTO>) session.getAttribute("sessionCart");
		number = request.getParameter("number");
		String cartId = request.getParameter("cartId"+number);
		String cartQuantity = request.getParameter("quantity"+number);
		String cartUnitPrice = request.getParameter("cartUnitPrice"+number);
		for (CartDTO cart : cartList) {
			if (cart.getpId().equals(cartId)) {
				cart.setQuantity(cartQuantity);
				cart.setSum(Integer.parseInt(cartQuantity) * Integer.parseInt(cartUnitPrice));
			}
		}
		session.setAttribute("sessionCart", cartList);
		pageContext.forward("../control/cart_control.jsp?action=home");
		break;
	}
%>