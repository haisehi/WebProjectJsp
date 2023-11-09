<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Add-poster.css">
<title>ADD POSTER</title>
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
				<a href="Add-News.jsp"><li><img src="img/plus.png" alt=""
						style="width: 10px;"> Add News</li></a>
				<li id="order"><img src="img/manager-icon.png" alt=""
					style="width: 10px;"> <a href="">Order management</a>
					<ul class="menu-dacap">
						<li><img src="img/manager-icon.png" alt=""
							style="width: 10px;"><a href="Order-management-party.jsp">Party</a></li>
						<li><img src="img/manager-icon.png" alt=""
							style="width: 10px;"><a href="Order-management-order.jsp">Order</a></li>
					</ul></li>
				<a href="User-management.jsp"><li><img
						src="img/manager-icon.png" alt="" style="width: 10px;"> User
						management</li></a>
			</ul>
		</div>
		<div class="body-right">
			<div class="header">
				<img src="img/logo.png" alt="" style="width: 100px;">
			</div>
			<div class="body">
				<div class="content">
					<div class="content-left">
						<p>Select the image to add:</p>
						<p>Photo position:</p>
					</div>
					<div class="content-right">
						<p>
							<input type="file" id="file-input">
						</p>
						<p>
							<select>
								<option value="dau-tien">Đầu tiên</option>
								<option value="giua">Giữa</option>
								<option value="cuoi-cung">Cuối cùng</option>
							</select>
						</p>
					</div>
				</div>
				<div class="bnt">
					<center>
						<button class="Add-bnt">ADD</button>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
