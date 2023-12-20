<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.FoodDAO"%>
<%@ page import="Model.Food"%>
<%@ page import="java.util.List"%>
<%
// Sau khi thêm danh mục mới, lấy danh sách danh mục và hiển thị

FoodDAO foodDAO = new FoodDAO();
List<Food> foods = foodDAO.getLimitedFoods(6);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./asset/css/bookAParty.css" rel="stylesheet">
<link href="./asset/css/header.css" rel="stylesheet">
<link href="./asset/css/footer.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Your Page Title</title>
</head>

<body>

	<!-- Header -->
	<jsp:include page="header/header.jsp" />

	<div class="wrapper_book">
		<section class="content">
			<div class="btn-box">
				<button id="btn-left" onclick="openTCT()">TỔ CHỨC TIỆC</button>
				<button id="btn-right" onclick="openDHL()">ĐƠN HÀNG LỚN &
					ĐẶT TIỆC TẬN NƠI</button>
			</div>
			<div class="content-all" id="content-left">
				<div style="padding-top: 30px;">
					<center>
						<b><p class="text-1" style="color: red; font-size: 18px;">BUỔI
								TIỆC KHÓ QUÊN CÙNG NHỮNG MÓN NGON TỪ ...</p></b>
					</center>
					<center>
						<p class="text-2" style="color: rgb(0, 0, 0); font-size: 17px;">Chúng
							tôi sẵn sàng phục vụ mọi bữa tiệc của bạn.</p>
					</center>
				</div>
				<div style="padding-top: 50px;">
					<center>
						<img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;">
					</center>
				</div>
				<div style="padding-top: 30px;">
					<center>
						<button class="btn-datngay" id="datngay">ĐẶT NGAY</button>
					</center>
				</div>
			</div>
			<div class="content-all" id="content-right">
				<div style="padding-top: 30px;">
					<center>
						<b><p class="text-1" style="color: red; font-size: 18px;">BUỔI
								TIỆC KHÓ QUÊN CÙNG NHỮNG MÓN NGON TỪ ...</p></b>
					</center>
					<center>
						<p class="text-2" style="color: rgb(0, 0, 0); font-size: 17px;">Chúng
							tôi sẵn sàng phục vụ mọi bữa tiệc của bạn.</p>
					</center>
				</div>
				<div style="padding-top: 50px;">
					<center>
						<img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;"> <img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/party1vn.png"
							alt="" style="width: 150px;">

					</center>
				</div>
				<div style="padding-top: 30px;">
					<center>
						<button class="btn-datngay" id="datngay1">ĐẶT NGAY</button>
					</center>
				</div>

			</div>

		</section>
		<section class="menu">
			<h2>Thực đơn tiệc</h2>
			<%
			for (Food food : foods) {
			%>
			<ul class="menu_list">
				<li class="menu_list-item"><a href="#"> <img
						class="menu_list-img"
						src="${pageContext.request.contextPath}/View/img/<%=food.getImage_food()%>"
						alt="<%=food.getImage_food()%>">
						<h3><%=food.getName_food()%></h3>
						<h3 style="color: red;"><%=food.getPrice()%></h3>
				</a></li>
			</ul>
			<%
			}
			%>

		</section>
		<section class="book_party">
			<h2>Đặt tiệc</h2>
			<form action="${pageContext.request.contextPath}/bookPartyController"
				method="post">
				<div>
					<div>
						<img
							src="https://kfcvn-static.cognizantorderserv.com/images/email/birthdaybanner.jpg"
							alt="" style="width: 100%;">
					</div>

					<div style="display: flex; width: 100%;">
						<div>
							<div class="form-group">
								<b><h3 style="color: red; border-bottom: 1px solid #000">Thông
										tin liên hệ</h3></b>
							</div>

							<div class="form-group">
								<label for="họ tên">Họ và tên</label> <input name="fullname"
									type="text" required>
							</div>
							<div class="form-group">
								<label for="số điện thoại">Số điện thoại</label> <input
									type="number" name="phone" required>
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									name="email" required>
							</div>


						</div>
						<div>
							<div class="form-group">
								<b><h3 style="color: red; border-bottom: 1px solid #000">Thông
										tin buổi tiệc</h3></b>
							</div>
							<div class="form-group">
								<label for="ngày">Ngày</label> <input type="date" name="date"
									required>
							</div>
							<div class="form-group">
								<label for="giờ">Giờ</label> <input type="time" name="time"
									required>
							</div>
							<div class="form-group">
								<Label for="số-lượng">Số lượng</Label><br> <select
									name="quantity" style="width: 104%;">
									<option>...</option>
									<option value="10">1-10</option>
									<option value="20">10-20</option>
									<option value="20+">20+</option>
								</select>
							</div>


							<div class="form-group">
								<label for="địa điểm">Địa điểm</label> <input type="text"
									name="address" required>
							</div>
							<div class="form-group">
								<label for="lời nhắn">Lời nhắn</label>
								<textarea name="content"></textarea>
							</div>
						</div>
					</div>
					<div>
						<center>
							<p>
								Tôi đã đọc và đồng ý với <u><a href="">chính sách bảo
										mật</a></u> & <u><a href="">chính sách bảo mật thông tin của
										...</a></u>
							</p>
						</center>
						<center>
							<button type="submit" class="btn" name="action" value="bookParty">XÁC
								NHẬN ĐẶT TIỆC</button>
						</center>
					</div>
				</div>
			</form>
		</section>
	</div>

	<!-- Footer -->
	<jsp:include page="footer/footer.jsp" />

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script>
		$("#datngay").click(function() {
			$('html, body').animate({
				scrollTop : 2000
			}, 800)
		});
	</script>
	<script>
		$("#datngay1").click(function() {
			$('html, body').animate({
				scrollTop : 2000
			}, 800)
		});
	</script>
	<script>
		var contentleft = document.getElementById("content-left");
		var contentright = document.getElementById("content-right");
		var btnleft = document.getElementById("btn-left");
		var btnright = document.getElementById("btn-right");

		function openTCT() {
			contentleft.style.transform = "translateX(50%)";
			contentright.style.transform = "translateX(400%)";
			btnleft.style.color = "#000";
			btnright.style.color = "#949494";
		}

		function openDHL() {
			contentleft.style.transform = "translateX(300%)";
			contentright.style.transform = "translateX(100%)";
			btnleft.style.color = "#949494";
			btnright.style.color = "#000";
		}
	</script>