<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jspWebApp.Cart" %>
<%@ page import="jspWebApp.Item" %>

<%
int no = Integer.parseInt(request.getParameter("no"));
String title = request.getParameter("title");
int price = Integer.parseInt(request.getParameter("price"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

Item item = new Item(no, title, price, quantity);


//item class가 저장되었을 cart class를 특정하기 위해 세션에 저장해둔 정보를 찾는다
session = request.getSession();
Cart cart = (Cart)session.getAttribute("cart");

//만약 세션에 cart class정보가 없다면 item class를 저장할 장바구니A를 만들어준다.(= 처음으로 장바구니에 상품을 담는 사람인 경우)
if(cart == null){
	cart = new Cart();
	session.setAttribute("cart", cart);
}

//장바구니A에 item class를 추가한다.
cart.addCart(item);

//장바구니 페이지로 이동(여부 물음)
//response.sendRedirect(request.getContextPath()+"/itemAddCartSuccess.jsp");

//장바구니 페이지로 이동
response.sendRedirect(request.getContextPath()+"/itemViewCart.jsp");
%>
