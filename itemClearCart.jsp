<%@page import="jspWebApp.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//카트A를 불러온다
session = request.getSession();
Cart cart = (Cart)session.getAttribute("cart");

//카트가 존재하지 않는다면 잘못된 접근임으로 상품 페이지로 이동
if(cart == null){
	response.sendRedirect(request.getContextPath()+"/itemViewList.jsp");
}else{
	//세션을 지울필요는 없을듯..?
	//session.removeAttribute("cart");
	cart.clearCart();
	response.sendRedirect(request.getContextPath()+"/itemViewCart.jsp");
}
%>