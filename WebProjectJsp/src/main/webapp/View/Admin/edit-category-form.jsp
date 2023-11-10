<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.CategoryFood"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #45a049;
}
</style>
<title>Update Category</title>
</head>
<body>
	<form method="post"
		action="${pageContext.request.contextPath}/categoryFoodController">
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="id_categories" value="${category.id_categories}">

		<label for="name_categories">Category:</label> <select
			id="name_categories" name="name_categories">
			<option value="HOT DEALS"
				${category.name_categories eq 'HOT DEALS' ? 'selected' : ''}>HOT
				DEALS</option>
			<option value="NEW PRODUCTS"
				${category.name_categories eq 'NEW PRODUCTS' ? 'selected' : ''}>NEW
				PRODUCTS</option>
			<option value="SNACK"
				${category.name_categories eq 'SNACK' ? 'selected' : ''}>SNACK</option>
			<option value="DESSERT & DRINKS"
				${category.name_categories eq 'DESSERT & DRINKS' ? 'selected' : ''}>DESSERT
				& DRINKS</option>
			<option value="FRIED & ROASTED"
				${category.name_categories eq 'FRIED & ROASTED' ? 'selected' : ''}>FRIED
				& ROASTED</option>
			<option value="CHICKEN"
				${category.name_categories eq 'CHICKEN' ? 'selected' : ''}>CHICKEN</option>
		</select> <label for="image_categories">Image:</label> <input type="file"
			id="image_categories" name="image_categories"
			value="${category.image_categories}">

		<button class="Add-bnt" type="submit">UPDATE</button>
	</form>
</body>
</html>
