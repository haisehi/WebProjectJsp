<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Demo.BookPartyDAO"%>
<%@ page import="Model.bookParty"%>
<%@ page import="java.util.List"%>
<%
// Kiểm tra nếu người dùng chưa đăng nhập, thì chuyển hướng về trang đăng nhập
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}

// Lấy danh sách các bữa tiệc từ CSDL
BookPartyDAO bookPartyDAO = new BookPartyDAO();
List<bookParty> parties = bookPartyDAO.getAllBookParties();
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
			<div class="body">
				<div class="content">
					<div class="content-right">
						<table border="1">
							<thead>
								<tr>
									<th>id_party</th>
									<th>fullname</th>
									<th>phone</th>
									<th>email</th>
									<th>date</th>
									<th>time</th>
									<th>quantity</th>
									<th>address</th>
									<th>content</th>
								</tr>
							</thead>
							<tbody>
								<!-- Iterate through the list of parties and display each row -->
								
								<%
								for (bookParty party : parties) {
								%>
								<tr>
									<td><%=party.getId_party()%></td>
									<td><%=party.getFullname()%></td>
									<td><%=party.getPhone()%></td>
									<td><%=party.getEmail()%></td>
									<td><%=party.getDate()%></td>
									<td><%=party.getTime()%></td>
									<td><%=party.getQuantity()%></td>
									<td><%=party.getAddress()%></td>
									<td><%=party.getContent()%></td>
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
