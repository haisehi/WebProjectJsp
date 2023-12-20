<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CartItem"%>
<%@ page import="Model.Food"%>

<%@ page import="Demo.ShoppingCart"%>
<%@ page import="Demo.PaymentDAO"%>
<%@ page import="Model.Payment"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./asset/css/header.css">
<link rel="stylesheet" href="./asset/css/footer.css">
<link rel="stylesheet" href="./asset/css/cart.css">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="UTF-8">
<title>Shopping Cart</title>
</head>

<!-- Header -->
<jsp:include page="header/header.jsp" />
<div class="wrapper_cart">
	<h1>Shopping Cart</h1>

	<%
	List<CartItem> cartItems = ShoppingCart.getCartItems();

	if (cartItems.isEmpty()) {
	%>
	<p>Your cart is empty.</p>
	<%
	} else {
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
			<th>Action</th>
		</tr>

		<%
		double grandTotal = 0;
		for (CartItem item : cartItems) {
			Food food = item.getFood();
			int quantity = item.getQuantity();
			double total = food.getPrice() * quantity;
			grandTotal += total;
		%>

		<tr>
			<td><%=food.getId_food()%></td>
			<td><%=food.getName_food()%></td>
			<td><%=food.getPrice()%></td>
			<td><%=quantity%></td>
			<td><%=total%></td>
			<td>
				<form
					action="${pageContext.request.contextPath}/AddToCartServlet"
					method="post">
					<input type="hidden" name="action" value=delete>
					<input type="hidden" name="id_food" value="<%=food.getId_food()%>">
					<button class="food-button_product" type="submit">Remove</button>
				</form>
			</td>
		</tr>

		<%
		}
		%>

		<tr>
			<td colspan="5">Grand Total</td>
			<td><%=grandTotal%></td>
		</tr>
	</table>
	<!-- Payment form -->
	<form action="${pageContext.request.contextPath}/ProcessPaymentServlet"
		method="post">
		<label for="fullName">Full Name:</label> <input type="text"
			id="fullName" name="fullName" required><br> <label
			for="email">Email:</label> <input type="email" id="email"
			name="email" required><br> <label for="address">Address:</label>
		<textarea id="address" name="address" required></textarea>
		<br> <input type="hidden" name="grandTotal"
			value="<%=grandTotal%>">

		<button type="submit">Proceed to Payment</button>
	</form>
	<%
	}
	%>

</div>
<!-- Add your other HTML content or links here -->
<!-- footer -->
<jsp:include page="footer/footer.jsp" />