<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.PosterDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.poster"%>
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
			<div class="header">
				<img src="img/logo.png" alt="" style="width: 100px;">
			</div>
			<form method="post"
				action="${pageContext.request.contextPath}/PosterController">
				<div class="body">
					<div class="content">
						<div class="content-left">
							<p>Select the image to add:</p>
							<input type="text" name="name_image" placeholder="name of food">
							<p>Photo position:</p>
						</div>
						<div class="content-right">
							<p>
								<input type="file" name="image">
							</p>
						</div>
					</div>
					<div class="bnt">
						<center>
							<button class="Add-bnt" type="submit" name="action" value="add">ADD</button>
						</center>
					</div>
				</div>
			</form>
			<div id="Result">
				<table border="1">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						PosterDAO posterDAO = new PosterDAO();
						List<poster> posters = posterDAO.getAllPosters();

						for (poster posterss : posters) {
						%>
						<tr>
							<td><%=posterss.getId_image()%></td>
							<td><%=posterss.getName_image()%></td>
							<td><img
								src="${pageContext.request.contextPath}/View/img/<%=posterss.getImage()%>"
								alt="<%=posterss.getImage()%>"
								style="max-width: 100px; max-height: 100px;"></td>
							<td>
								<form method="post"
									action="${pageContext.request.contextPath}/PosterController">
									<input type="hidden" name="id_image"
										value="<%=posterss.getId_image()%>"> <input
										type="hidden" name="action" value="delete">
									<button class="change-btn" type="submit">DELETE</button>
								</form>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
