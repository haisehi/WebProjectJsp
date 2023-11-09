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
		<h2>XIN CHÀO !!! ${sessionScope.username}</h2>
		<h3>
			<u><form method="post"
					action="${pageContext.request.contextPath}/userController">
					<input type="hidden" name="action" value="logout">
					<button type="submit"
						style="color: #fff; background-color: transparent; border: none; text-decoration: underline; cursor: pointer;">Đăng
						xuất</button>
				</form></u>
		</h3>
		<h4>
			<a href="">Đơn hàng đã đặt</a>
		</h4>
		<h4>
			<a href="">Đơn hàng yêu thích</a>
		</h4>
		<h4>
			<a href="">Địa chỉ của bạn</a>
		</h4>
		<h4>
			<a href="">Chi tiết tài khoản</a>
		</h4>
		<h4>
			<a style="color: #fff;">Đặt lại mật khẩu</a>
		</h4>
		<h4>
			<a href="">Xóa tài khoản</a>
		</h4>
	</div>

	<div class="content-right">
		<h2>CHI TIẾT TÀI KHOẢN</h2>
		<form action="#">
			<div class="form-group">
				<label for="họ và tên">Họ và tên</label><br> <input type="text"
					id="ho-ten" required value=`${sessionScope.username}`>
			</div>

			<div class="form-group">
				<label for="số điện thoại">Số điện thoại</label><br> <input
					type="number" id="sdt" required value=`${sessionScope.username}`>
			</div>

			<div class="form-group">
				<label for="Email">Email</label><br> <input type="text"
					id="Email" required value=`${sessionScope.username}`>
			</div>
			<div class="form-group">
				<span>Giới tính</span><br> <select>
					<option value="male">Nam</option>
					<option value="female">Nữ</option>
				</select>
			</div>

			<div class="form-group">
				<label for="ngày">Ngày sinh</label><br> <input type="date"
					id="ngày" required value=`${sessionScope.username}`>
			</div>

			<div style="padding-top: 30px;">
				<center>
					<button class="btn-datngay" id="datngay">Cập nhật tài
						khoản</button>
				</center>
			</div>
		</form>
	</div>
</section>


