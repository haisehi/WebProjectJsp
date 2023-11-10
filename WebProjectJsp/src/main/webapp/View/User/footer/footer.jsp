<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.CategoryFoodDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CategoryFood"%>
<%
// Sau khi thêm danh mục mới, lấy danh sách danh mục và hiển thị
CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
List<CategoryFood> categories = categoryFoodDAO.getAllCategories();
%>

<link href="./asset/css/footer.css" rel="stylesheet">
<div class="wrapper_footer">
	<a href="#"> <img class="logo" alt="logo"
		src="./asset/img/logo.jpg" />
	</a>
	<div class="wrapper_footer-item">
		<span>Our Food</span>
		<%
		for (CategoryFood category : categories) {
		%>
		<a class="footer_item"
			href="<%=String.format("menu.jsp?id=#%s", category.getId_categories())%>">
			<%=category.getName_categories()%>
		</a>
		<%
		}
		%>

	</div>
	<div class="wrapper_footer-item">
		<span>Contact</span> <a class="footer_item" href="">Order Tracker</a>
		<a class="footer_item" href="">Find a KFC</a> <a class="footer_item"
			href="">Contact Us</a>
	</div>
	<div class="wrapper_footer-item">
		<span>Policy</span> <a class="footer_item" href="">Operation
			Policy</a> <a class="footer_item" href="">Terms And Conditions</a>
	</div>
	<div class="wrapper_footer-item">
		<a class="footer_item" href="#"><i class='bx bxl-facebook'></i></a> <a
			class="footer_item" href="#"><i class='bx bxl-twitter'></i></a> <a
			class="footer_item" href="#"><i class='bx bxl-tiktok'></i></a> <a
			class="footer_item" href="#"><i class='bx bxl-instagram'></i></a>
	</div>
</div>
<!-- copyright -->
<div class="copyright">
	<p>&#169;Copyright © 2023 KFC Vietnam</p>
</div>
