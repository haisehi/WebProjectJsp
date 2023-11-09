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
<link rel="stylesheet" href="Order-management-party.css">
<title>Party management</title>
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
			<div class=" header">
				<img src="img/logo.png" alt="" style="width: 100px;">
			</div>
			<divclass "body">
                <div class="content">
                    <div class="content-right">
                        <form method="post" action="your_server_script.jsp">
                        	<p>Name of the person:</p>
                            <p><input type="text" name="name" placeholder="name"></p>
                            <p>Phone number:</p>
                            <p><input type="number" name="phone-number" placeholder="phone number"></p>
                            <p>Email:</p>
                            <p><input type="text" name="email" placeholder="email"></p>
                            <p>Organization address:</p>
                            <p><input type="text" name="address" placeholder="address"></p>
                            <p>Banquet date:</p> 
                            <p><input type="date" name="date" placeholder="date"></p>
                            <p>Feast type:</p> 
                            <p><input type="text" name="type" placeholder="type"></p>
                            <p>Number of participants:</p>  
                            <p><input type="number" name="number-of-participants" placeholder="number of participants"></p>
                            <p><button type="submit" class="Add-bnt">Update</button></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
