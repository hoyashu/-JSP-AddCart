<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jspWebApp.Cart" %>
<%@ page import="jspWebApp.Item" %>

<%
int no = Integer.parseInt(request.getParameter("no"));

//item class가 저장되었을 cart class를 특정하기 위해 세션에 저장해둔 정보를 찾는다
session = request.getSession();
Cart cart = (Cart)session.getAttribute("cart");

//카트가 존재하지 않는다면 잘못된 접근임으로 상품 페이지로 이동
if(cart == null){
	response.sendRedirect(request.getContextPath()+"/itemViewList.jsp");
}else{
	//장바구니A에 해당 item class의 수정된 수량값을 보낸다.
	cart.removeCart(no);
	//장바구니 페이지로 이동
	response.sendRedirect(request.getContextPath()+"/itemViewCart.jsp");
}
%>
