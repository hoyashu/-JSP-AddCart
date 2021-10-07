<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jspWebApp.Cart"%>
<%@ page import="jspWebApp.Item"%>

<%
	session = request.getSession();
Cart cart = (Cart) session.getAttribute("cart");
ArrayList<Item> itemList = null;

boolean isItem = false;
//장바구니자체가 존재하지 않는 경우 - 
if (cart == null) {
	response.sendRedirect(request.getContextPath() + "/itemViewList.jsp");
} else {
	itemList = cart.viewCartList();
	if (itemList.isEmpty()) {
		//장바구니는 만들어져 있지만, 상품이 없는 경우
		isItem = false;
	} else {
		//장바구니는 만들어져 있지만, 상품이 있는 경우
		isItem = true;
	}
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니 목록</title>
</head>

<body>
	<form id="form">
		<table>
			<%
				if (isItem == false) {
			%>
			<tr>
				<td colspan="4">장바구니에 담긴 상품이 없습니다.</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>비고</td>
			</tr>
			<%
				for (Item item : itemList) {
			%>
			<tr>
				<td><input type="hidden" name="no" value="<%=item.getNo()%>"><%=item.getTitle()%></td>
				<td><%=item.getPrice()%></td>
				<td><input type="number" name="quantity"
					value="<%=item.getQuantity()%>" id="quantity_<%=item.getNo()%>"
					class="quantity"></td>
				<td><a href="javascript:updateCartItem(<%=item.getNo()%>)"
					class="updateBtn">수정</a><a
					href="javascript:removeCartItem(<%=item.getNo()%>)"
					class="removeBtn">삭제</a></td>
			</tr>
			<%
				}
			%>
			<%
				}
			%>
		</table>
	</form>
	<a href="<%=request.getContextPath() + "/itemViewList.jsp"%>"
		id="itemListBtn">상품 목록 바로가기</a>
	<a href="<%=request.getContextPath() + "/itemClearCart.jsp"%>"
		id="clearCartBtn">장바구니 비우기</a>

	<script>
	    const quantity = document.querySelectorAll(".quantity");
	    quantity.forEach(function (e) {
	        e.addEventListener("change", function () {
	            if (this.value <= 0) {
	                alert("최소 1개 이상의 상품을 선택하세요.");
	                this.value = 1;
	                this.focus();
	                return false;
	            };
	        });
	    });
	    
	    
        const form = document.getElementById("form");
        
        function updateCartItem(no) {

            const quantity = document.getElementById("quantity_" + no);

            if (quantity.value <= 0) {
                alert("최소 1개 이상의 상품을 선택하세요.");
                quantity.focus();
                return false;
            }
            form.no.value = no;
            form.quantity.value = quantity.value;
            form.action = "<%=request.getContextPath()%>/itemUpdateCart.jsp";
            form.mothod = "GET";
            form.submit();
        }
        
        function removeCartItem(no) {
            form.no.value = no;
            form.action = "<%=request.getContextPath()%>/itemRemoveCart.jsp";
			form.mothod = "GET";
			form.submit();
		}
	</script>
</body>

</html>