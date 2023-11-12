<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CartItem"%>
<%@ page import="Model.Food"%>
<%@ page import="Demo.ShoppingCartDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession userSession = request.getSession(false);
String email = (String) userSession.getAttribute("email");
int customerId = (int) userSession.getAttribute("customerId"); // Assuming customerId is an integer
%>

<%
List<CartItem> cartItems = null;
if (customerId != 0) {
	cartItems = new ShoppingCartDAO().getCartItemsCustomer(customerId);
}
%>

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
	// Kiểm tra xem có phiên đăng nhập không
	if (email == null) {
	%>
	<p>Login to buy a product.</p>
	<%
	} else {
	// Nếu có phiên đăng nhập, chuyển hướng đến trang chitiettk.jsp
	%>

	<%
	if (cartItems == null || cartItems.isEmpty()) {
	%>
	<p>Your cart is empty.</p>
	<%
	} else {
	// Map to store aggregated quantities for each product ID
	java.util.Map<Integer, Integer> aggregatedQuantities = new java.util.HashMap<>();

	// Iterate through cart items and aggregate quantities
	for (CartItem item : cartItems) {
		int foodId = item.getFood().getId_food();
		int quantity = item.getQuantity();

		// Update the aggregated quantity for the product ID
		aggregatedQuantities.put(foodId, aggregatedQuantities.getOrDefault(foodId, 0) + quantity);
	}
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
		</tr>

		<%
		double grandTotal = 0;
		for (CartItem item : cartItems) {
			Food food = item.getFood();
			int foodId = food.getId_food();
			int quantity = aggregatedQuantities.get(foodId);
			double total = food.getPrice() * quantity;
			grandTotal += total;
		%>

		<tr>
			<td><%=foodId%></td>
			<td><%=food.getName_food()%></td>
			<td><%=food.getPrice()%></td>
			<td><%=quantity%></td>
			<td><%=total%></td>
		</tr>

		<%
		}
		%>

		<tr>
			<td colspan="4">Grand Total</td>
			<td><%=grandTotal%></td>
		</tr>
	</table>
	<%
	}
	%>

	<%
	}
	%>
</div>
<!-- Add your other HTML content or links here -->
<!-- footer -->
<jsp:include page="footer/footer.jsp" />