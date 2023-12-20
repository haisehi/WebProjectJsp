<%@page import="Demo.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.FoodDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Food"%>
<%@ page import="Demo.CategoryFoodDAO"%>

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
<link rel="stylesheet" href="Add-Food.css">
<title>ADD FOOD</title>
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
					<div class="content-left">
						<p>Select the image:</p>
						<p>Enter the name of food:</p>
						<p>Enter the price:</p>
						<p>Enter Category:</p>

					</div>

					<div class="content-right">
						<form method="post"
							action="${pageContext.request.contextPath}/foodController">
							<div>
								<p>
									<input type="file" name="image_food" id="file-input">
								</p>
								<p>
									<input type="text" name="name_food" placeholder="name of food">
								</p>
								<p>
									<input type="number" step="0.01" name="price"
										placeholder="price">
								</p>
								<p>
									<!-- Add this part for the category dropdown -->
									<label for="category"></label> <select id="category"
										name="id_categories">
										<%
										CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
										List<CategoryFood> categories = categoryFoodDAO.getAllCategories();
										for (CategoryFood category : categories) {
										%>
										<option value="<%=category.getId_categories()%>"><%=category.getName_categories()%></option>
										<%
										}
										%>
									</select>
								</p>
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
									<th>price</th>
									<th>Name_Category</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								FoodDAO foodDAO = new FoodDAO();
								List<Food> foods = foodDAO.getAllFoods();

								for (Food food : foods) {
								%>
								<tr>
									<td><%=food.getId_food()%></td>
									<td><%=food.getName_food()%></td>
									<td><img
										src="${pageContext.request.contextPath}/View/img/<%=food.getImage_food()%>"
										alt="<%=food.getImage_food()%>"
										style="max-width: 100px; max-height: 100px;"></td>
									<td><%=food.getPrice()%></td>
									<td><%=food.getId_categories()%></td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/foodController">
											<input type="hidden" name="id_food"
												value="<%=food.getId_food()%>"> <input type="hidden"
												name="action" value="edit">
											<button class="change-btn" type="submit">EDIT</button>
										</form>
										<form method="post"
											action="${pageContext.request.contextPath}/foodController">
											<input type="hidden" name="id_food"
												value="<%=food.getId_food()%>"> <input type="hidden"
												name="action" value="delete">
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
		</div>
	</div>
</body>
</html>
