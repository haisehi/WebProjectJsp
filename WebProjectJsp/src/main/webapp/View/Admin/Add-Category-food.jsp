<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="Demo.CategoryFoodDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CategoryFood"%>

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
<link rel="stylesheet" href="Add-Category-food.css">
<title>ADD CATEGORY FOOD</title>
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
					<img src="img/plus.png" alt=""
						style="width: 10px; color: black;">
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
			<div class=" header">
				<img src="img/logo.png" alt="" style="width: 100px;">
			</div>
			<div class="body">
				<form method="post"
					action="${pageContext.request.contextPath}/categoryFoodController">
					<div class="content">
						<div class="content-left">
							<p>Select the image:</p>
							<p>Enter the name of the category:</p>
							<p>Show the extra lists:</p>
						</div>
						<div class="content-right">
							<p>
								<input type="file" id="name_categories" name="image_categories">
							</p>
							<p>
								<select id="image_categories" name="name_categories">
									<option value="HOT DEALS">HOT DEALS</option>
									<option value="NEW PRODUCTS">NEW PRODUCTS</option>
									<option value="SNACK">SNACK</option>
									<option value="DESSERT & DRINKS">DESSERT & DRINKS</option>
									<option value="FRIED & ROASTED">FRIED & ROASTED</option>
									<option value="CHICKEN">CHICKEN</option>
								</select>
							</p>
						</div>

					</div>
					<div class="bnt">
						<center>
							<button class="Add-bnt" type="submit" name="action" value="add">ADD</button>
						</center>
					</div>
				</form>

			</div>
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
						// Sau khi thêm danh mục mới, lấy danh sách danh mục và hiển thị
						CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
						List<CategoryFood> categories = categoryFoodDAO.getAllCategories();

						for (CategoryFood category : categories) {
						%>
						<tr>
							<td><%=category.getId_categories()%></td>
							<td><%=category.getName_categories()%></td>
							<td><img
								src="${pageContext.request.contextPath}/View/img/<%=category.getImage_categories()%>"
								alt="<%=category.getImage_categories()%>"
								style="max-width: 100px; max-height: 100px;"></td>
							<td>
								<form method="post"
									action="${pageContext.request.contextPath}/categoryFoodController">
									<input type="hidden" name="id_categories"
										value="<%=category.getId_categories()%>">
									<button class="Add-bnt" type="submit" name="action"
										value="update">UPDATE</button>
								</form>
								<form method="post"
									action="${pageContext.request.contextPath}/deleteCategoryFood">
									<input type="hidden" name="id_categories"
										value="<%=category.getId_categories()%>">
									<button class="Add-bnt" type="submit" name="submit"
										value="DELETE">DELETE</button>
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



