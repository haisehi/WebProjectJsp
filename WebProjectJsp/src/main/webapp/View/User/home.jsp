<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.CategoryFoodDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.CategoryFood"%>
<%@ page import="Demo.PosterDAO"%>
<%@ page import="Model.poster"%>
<%@ page import="Demo.FoodDAO"%>
<%@ page import="Model.Food"%>
<%
CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
List<CategoryFood> categories = categoryFoodDAO.getAllCategories();
FoodDAO foodDAO = new FoodDAO();
List<Food> foods = foodDAO.getLimitedFoods(8);
PosterDAO posterDAO = new PosterDAO();
List<poster> posters = posterDAO.getAllPosters();
%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href=".asset/css/header.css">
<link rel="stylesheet" href="asset/css/footer.css">
<link rel="stylesheet" href="asset/css/home.css">
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

<!-- content -->
<div class="wrapper_content">
	<div class="content_swiper">
		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<%
				for (poster posterss : posters) {
				%>
				<div class="swiper-slide" style="background-color: red;">
					<img
						src="${pageContext.request.contextPath}/View/img/<%=posterss.getImage()%>"
						alt="<%=posterss.getImage()%>">
				</div>
				<%
				}
				%>
			</div>
			<div class="swiper-button-next customBtn"></div>
			<div class="swiper-button-prev customBtn"></div>
		</div>
		<!-- Swiper JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	</div>
	<div class="content_home">
		<section class="food" id="hotdeals">
			<h2 class="heading">BROWSE CATEGORIES</h2>
			<!-- movies conatiner -->
			<div class="food-container">
				<!-- box 1 -->
				<%
				for (CategoryFood category : categories) {
				%>
				<a
					href="<%=String.format("menu.jsp?id=#%s", category.getId_categories())%>">
					<div class="box">
						<div class="box-img">
							<img
								src="${pageContext.request.contextPath}/View/img/<%=category.getImage_categories()%>"
								alt="<%=category.getImage_categories()%>">
						</div>
						<div class="box_price_title">
							<h3 class="title_product"><%=category.getName_categories()%></h3>
						</div>
					</div>
				</a>
				<%
				}
				%>
			</div>
		</section>
		<section class="food" id="hotdeals">
			<h2 class="heading">WE THINK YOU’LL LOVE THESE</h2>
			<!-- movies conatiner -->
			<div class="food-container">
				<!-- box 1 -->
				<%
				for (Food food : foods) {
				%>
				<div class="box">
					<div class="box-img">
						<img
							src="${pageContext.request.contextPath}/View/img/<%=food.getImage_food()%>"
							alt="">
					</div>
					<div class="box_price_title">
						<h3 class="title_product"><%=food.getName_food()%></h3>
					</div>

				</div>
				<%
				}
				%>

			</div>
		</section>
	</div>
</div>
<!-- footer -->
<jsp:include page="footer/footer.jsp" />

<script>
	var swiper = new Swiper(".mySwiper", {
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});
</script>