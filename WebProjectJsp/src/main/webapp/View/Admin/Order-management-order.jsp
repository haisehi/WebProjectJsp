<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}
%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Payment"%>
<%@ page import="Demo.PaymentDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Order-management-order.css">
<title>Order management</title>
</head>
<body>
	<div class="container">
		<!-- body -->
				<div class="body-left">
			<h2>ADMIN PANEL</h2>
			<ul>
				<form method="post"
					action="${pageContext.request.contextPath}/Admin">
					<input type="hidden" name="action" value="logout">
					<button type="submit"
						style="color: #fff; background-color: transparent; border: none; text-decoration: underline; cursor: pointer;">
						<img src="img/plus.png" alt="" style="width: 10px; color: black;">
						Logout
					</button>
				</form>

				<a href="Add-poster.jsp"><li><img src="img/plus.png" alt=""
						style="width: 10px; color: black;"> Add Poster</li></a>
				<a href="Add-Category-food.jsp"><li><img src="img/plus.png"
						alt="" style="width: 10px;"> Add Category Food</li></a>
				<a href="Add-Food.jsp"><li><img src="img/plus.png" alt=""
						style="width: 10px;"> Add Food</li></a>
				<li id="order"><img src="img/manager-icon.png" alt=""
					style="width: 10px;"> <a href="">Order management</a>
					<ul class="menu-dacap">
						<li><img src="img/manager-icon.png" alt=""
							style="width: 10px;"><a href="Order-management-party.jsp">Party</a></li>
						<li><img src="img/manager-icon.png" alt=""
							style="width: 10px;"><a href="Order-management-order.jsp">Order</a></li>
					</ul></li>

			</ul>
		</div>
		<div class="body-right">
			<div class=" header">
				<img src="img/logo.png" alt="" style="width: 100px;">
			</div>
			<div class="body">
				<div class="content">
					<div class="content-right">
						<h3>Payment Records</h3>
						<table border="1">
							<tr>
								<th>ID</th>
								<th>Name Food</th>
								<th>Price</th>
								<th>Total</th>
								<th>Quantity</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Address</th>
								<th>Customer ID</th>
							</tr>

							<%
							PaymentDAO paymentDAO = new PaymentDAO();
							List<Payment> payments = paymentDAO.getAllPayments();

							for (Payment payment : payments) {
							%>
							<tr>
								<td><%=payment.getId_payment()%></td>
								<td><%=payment.getName_food()%></td>
								<td><%=payment.getPrice()%></td>
								<td><%=payment.getTotal()%></td>
								<td><%=payment.getQuantity()%></td>
								<td><%=payment.getFullName()%></td>
								<td><%=payment.getEmail()%></td>
								<td><%=payment.getAddress()%></td>
								<td><%=payment.getId_customer()%></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
