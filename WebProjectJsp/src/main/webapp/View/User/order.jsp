<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Payment" %>
<%@ page import="Demo.PaymentDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
// Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
if (session.getAttribute("email") == null) {
	response.sendRedirect("login.jsp");
}
//Lấy id_customer từ session
int customerId = (int) session.getAttribute("id_customer");

//Gọi phương thức getPaymentsByCustomerId để lấy danh sách đơn hàng của khách hàng
PaymentDAO paymentDAO = new PaymentDAO();
List<Payment> payments = new ArrayList<>();
try {
 payments = paymentDAO.getPaymentsByCustomerId(customerId);
} catch (ClassNotFoundException e) {
 e.printStackTrace();
}
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href=".asset/css/header.css">
<link rel="stylesheet" href="asset/css/footer.css">
<link rel="stylesheet" href="asset/css/order.css">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<!-- Header -->
<jsp:include page="header/header.jsp" />

<section class="wrapper_cttk">
	<div class="content-left">
		<img class="img_user" src="img/logo.png" alt="">
		<h2>XIN CHÀO !!! ${sessionScope.username}</h2>
		<h3>
			<u><form method="post"
					action="${pageContext.request.contextPath}/userController">
					<input type="hidden" name="action" value="logout">
					<button type="submit"
						style="color: #fff; background-color: transparent; border: none; text-decoration: underline; cursor: pointer;">
						Đăng xuất</button>
				</form></u>
		</h3>
		<h4>
			<a href="order.jsp">Đơn hàng đã đặt</a>
		</h4>
		<h4>
			<a href="">Địa chỉ của bạn</a>
		</h4>
		<h4>
			<a href="chitiettk.jsp">Chi tiết tài khoản</a>
		</h4>
	</div>

	<div class="content-right">
		<h2>Đơn hàng đã đặt</h2>
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
        <% for (Payment payment : payments) { %>
            <tr>
                <td><%= payment.getId_payment() %></td>
                <td><%= payment.getName_food() %></td>
                <td><%= payment.getPrice() %></td>
                <td><%= payment.getTotal() %></td>
                <td><%= payment.getQuantity() %></td>
                <td><%= payment.getFullName() %></td>
                <td><%= payment.getEmail() %></td>
                <td><%= payment.getAddress() %></td>
                <td><%= payment.getId_customer() %></td>
            </tr>
        <% } %>
    </table>
	</div>
</section>


