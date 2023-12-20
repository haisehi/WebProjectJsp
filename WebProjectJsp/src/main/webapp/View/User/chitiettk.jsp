<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
if (session.getAttribute("email") == null) {
	response.sendRedirect("login.jsp");
}
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href=".asset/css/header.css">
<link rel="stylesheet" href="asset/css/footer.css">
<link rel="stylesheet" href="asset/css/chitiettk.css">
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
		<h2>XIN CHÀO ${sessionScope.customer.firstname}</h2>
		<h3>
			<u>
				<form method="post"
					action="${pageContext.request.contextPath}/userController">
					<input type="hidden" name="action" value="logout">
					<button type="submit"
						style="color: #fff; background-color: transparent; border: none; text-decoration: underline; cursor: pointer;">Đăng
						xuất</button>
				</form>
			</u>
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
		<h2>CHI TIẾT TÀI KHOẢN</h2>
		<form action="${pageContext.request.contextPath}/userController"
			method="post">
			<div class="form-group">
				<label for="họ và tên">Họ</label><br> 
				<input type="text" name="firstname" required value="${sessionScope.customer.firstname}">
			</div>
			<div class="form-group">
				<label for="họ và tên">Tên</label><br> 
				<input type="text" name="lastname" required value="${sessionScope.customer.lastname}">
			</div>
			<div class="form-group">
				<label for="số điện thoại">Số điện thoại</label><br> 
				<input type="number" name="phonenumber" required value="${sessionScope.customer.phonenumber}">
			</div>

			<div class="form-group">
				<label for="Email">Email</label><br> 
				<input type="text" name="email" required value="${sessionScope.customer.email}">
			</div>
			<div class="form-group">
				<span>Giới tính</span><br> 
				<select name="gender">
					<option value="male"
						${sessionScope.customer.gender eq 'male' ? 'selected' : ''}>Nam</option>
					<option value="female"
						${sessionScope.customer.gender eq 'female' ? 'selected' : ''}>Nữ</option>
				</select>
			</div>

			<div class="form-group">
				<label for="ngày">Ngày sinh</label><br> 
				<input type="date" name="date" required value="${sessionScope.customer.date}">
			</div>

			<input type="hidden" name="action" value="update">
			<div style="padding-top: 30px;">
				<center>
					<button class="btn-datngay">Cập nhật tài
						khoản</button>
				</center>
			</div>
		</form>
	</div>
</section>
