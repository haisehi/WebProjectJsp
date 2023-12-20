<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Demo.CategoryFoodDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CategoryFood"%>
<%@ page import="Demo.FoodDAO"%>
<%@ page import="Model.Food"%>
<%@ page import="Model.Customer"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession userSession = request.getSession(false);
String email = (String) userSession.getAttribute("email");
%>
<%
// Sau khi thêm danh mục mới, lấy danh sách danh mục và hiển thị
CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
List<CategoryFood> categories = categoryFoodDAO.getAllCategories();
FoodDAO foodDAO = new FoodDAO();
%>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./asset/css/header.css">
<link rel="stylesheet" href="./asset/css/footer.css">
<link rel="stylesheet" href="./asset/css/menu.css">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Header -->
<jsp:include page="header/header.jsp" />

<!-- content -->
<div class="menu">
	<ul class="menu_nav">
		<%
		for (CategoryFood category : categories) {
			int categoryId = category.getId_categories(); // Get the category ID dynamically
		%>
		<li class="menu_nav-itemt"><a href="#<%=categoryId%>"><%=category.getName_categories()%></a>
		</li>
		<%
		}
		%>
	</ul>
</div>
<div class="wrapper_content">
	<div class="content_home">
		<%
		for (CategoryFood category : categories) {
			int categoryId = category.getId_categories(); // Get the category ID dynamically
			List<Food> foods = foodDAO.getAllFoodsCategory(categoryId);
		%>
		<section class="food" id="<%=categoryId%>">
			<h2 class="heading"><%=category.getName_categories()%></h2>
			<!-- movies conatiner -->
			<div class="food-container">
				<%
				for (Food food : foods) {
				%>

				<div class="box">
					<div class="box-img">
						<img
							src="${pageContext.request.contextPath}/View/img/<%=food.getImage_food()%>"
							alt="<%=food.getImage_food()%>">
					</div>
					<div class="box_price_title">
						<h3 class="title_product"><%=food.getName_food()%></h3>
						<h3 class="price_product"><%=food.getPrice()%></h3>
					</div>
					<span class="content_product"><%=food.getName_food()%></span>
					
					<%
					// Kiểm tra xem có phiên đăng nhập không
					if (email == null) {
					%>
					<button class="food-button_product_empty" type="submit">Add</button>
					<%
					} else {
					// Nếu có phiên đăng nhập, chuyển hướng đến trang chitiettk.jsp
					%>
					<form action="${pageContext.request.contextPath}/AddToCartServlet"
						method="post">
						<input type="hidden" name="id_food" value="<%=food.getId_food()%>">
						<input type="hidden" name="action" value="add">
						<button class="food-button_product" type="submit">Add</button>
					</form>
					<%
					}
					%>
					
				</div>
				<%
				}
				%>
			</div>
		</section>
		<%
		}
		%>
	</div>
</div>

<!-- footer -->
<jsp:include page="footer/footer.jsp" />
