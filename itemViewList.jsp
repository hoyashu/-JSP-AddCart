<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	String addCartUrl = request.getContextPath()+"/itemAddCart.jsp";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
</head>

<body>
    <form action="<%=addCartUrl %>" method="GET">
        <table>
            <tr>
                <td>상품번호</td>
                <td><input type="hidden" name="no" value="1">1</td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input type="hidden" name="title" value="냉장고">냉장고</td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="hidden" name="price" value="5000000">5,000,000원</td>
            </tr>
            <tr>
                <td>수량</td>
                <td><input type="number" name="quantity" class="quantity" value="1">개</td>
            </tr>
            <tr>
                <td>수량</td>
                <td colspan="2"><button type="submit" class="submitBtn">장바구니 담기</button></td>
            </tr>
        </table>
    </form>

    <form action="<%=addCartUrl %>" method="GET">
        <table>
            <tr>

                <td>상품번호</td>
                <td><input type="hidden" name="no" value="2">2</td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input type="hidden" name="title" value="세탁기">세탁기</td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="hidden" name="price" value="3000000">3,000,000원</td>
            </tr>
            <tr>
                <td>수량</td>
                <td><input type="number" name="quantity" class="quantity" value="1">개</td>
            </tr>
            <tr>
                <td>수량</td>
                <td colspan="2"><button type="submit" class="submitBtn">장바구니 담기</button></td>
            </tr>
        </table>
    </form>
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
    </script>
</body>

</html>