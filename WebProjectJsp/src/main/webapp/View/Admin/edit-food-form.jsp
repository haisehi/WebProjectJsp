<%@page import="Demo.FoodDAO"%>
<%@page import="Demo.CategoryFoodDAO"%>
<%@page import="Model.Food"%>
<%@ page import="java.util.List"%>
<%@page import="Model.CategoryFood"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    // Lấy ID thức ăn từ request
    int foodId = Integer.parseInt(request.getParameter("id_food"));
    FoodDAO foodDAO = new FoodDAO();
    Food food = foodDAO.getFoodById(foodId);

    // Lấy danh sách các danh mục thức ăn
    CategoryFoodDAO categoryFoodDAO = new CategoryFoodDAO();
    List<CategoryFood> categories = categoryFoodDAO.getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Food</title>
    <style>
    /* Edit-Food.css */

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    width: 100%;
}


.body-left h2 {
    margin-bottom: 20px;
}

.body-left ul {
    list-style: none;
    padding: 0;
}

.body-left ul li {
    padding: 10px;
    border-bottom: 1px solid #555;
}

.body-left ul li a {
    color: #fff;
    text-decoration: none;
}

.body-left ul li a:hover {
    color: #ffcc00;
}

.body-right {
    flex: 1;
    padding: 20px;
}

.header {
    text-align: center;
    margin-bottom: 20px;
}

.header img {
    max-width: 100%;
}

.content {
    max-width: 600px;
    margin: 0 auto;
}

form {
    margin-top: 20px;
}

form p {
    margin-bottom: 15px;
}

form label {
    display: block;
    margin-bottom: 5px;
}

form input, form select {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

form button {
    background-color: #4caf50;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

form button:hover {
    background-color: #45a049;
}
    
    </style>
</head>
<body>
    <div class="container">
        <div class="body-right">
            <div class="header">
                <img src="img/logo.png" alt="" style="width: 100px;">
            </div>
            <div class="body">
                <div class="content">
                    <form method="post" action="${pageContext.request.contextPath}/foodController">
                        <input type="hidden" name="id_food" value="<%=food.getId_food()%>">
                        <p>
                            <input type="file" name="image_food" id="file-input">
                        </p>
                        <p>
                            <input type="text" name="name_food" placeholder="Name of Food" value="<%=food.getName_food()%>">
                        </p>
                        <p>
                            <input type="number" step="0.01" name="price" placeholder="Price" value="<%=food.getPrice()%>">
                        </p>
                        <p>
                            <label for="category">Select Category:</label>
                            <select id="category" name="id_categories">
                                <% for (CategoryFood category : categories) { %>
                                    <option value="<%=category.getId_categories()%>" <%= (category.getId_categories() == food.getId_categories()) ? "selected" : "" %>><%=category.getName_categories()%></option>
                                <% } %>
                            </select>
                        </p>
                        <p>
                            <button class="Add-bnt" type="submit" name="action" value=update>SAVE CHANGES</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
