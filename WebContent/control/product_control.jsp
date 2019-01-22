<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="ezenMall.products.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pDao" class="ezenMall.products.ProductsDAO" />
<jsp:useBean id="pDto" class="ezenMall.products.ProductsDTO" />
<jsp:setProperty property="*" name="pDto" />
<%
	String action = request.getParameter("action");
	switch (action) {

	case "viewClothes":
		ArrayList<ProductsDTO> clothesImg = pDao.AllByProducts(0);
		ArrayList<ProductsDTO> clothesImgpants = pDao.AllByProducts(5);
		request.setAttribute("clothesImg", clothesImg);
		request.setAttribute("pantsImg", clothesImgpants);
		pageContext.forward("../view/mallClothes.jsp");
		break;
	case "viewBicycle":
		ArrayList<ProductsDTO> bicycleImgTop = pDao.AllByProducts(10);
		ArrayList<ProductsDTO> bicycleImgBottom = pDao.AllByProducts(15);
		request.setAttribute("bicycleImgTop", bicycleImgTop);
		request.setAttribute("bicycleImgBottom", bicycleImgBottom);
		pageContext.forward("../view/mallBicycle.jsp");
		break;
	case "viewFurniture":
		ArrayList<ProductsDTO> furnitureImgTop = pDao.AllByProducts(20);
		ArrayList<ProductsDTO> furnitureImgBottom = pDao.AllByProducts(25);
		request.setAttribute("furnitureImgTop", furnitureImgTop);
		request.setAttribute("furnitureImgBottom", furnitureImgBottom);
		pageContext.forward("../view/mallFurniture.jsp");
		break;
	}
%>