<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession userSession = request.getSession(false);
String email = (String) userSession.getAttribute("email");
%>
<link href="./asset/css/header.css" rel="stylesheet">


<header class="wrapper_header">
	<div class="header_section">
		<!--navbar-->
		<nav class="navbar_headerLeft">
			<ul class="navbar_wrp_item">
				<!-- logo -->
				<a href="home.jsp"><img class="logo" alt="logo"
					src="./asset/img/logo.jpg" /></a>
				<a href="menu.jsp">
					<li class="navbar_item">MENU</li>
				</a>
				<a href="bookAParty.jsp">
					<li class="navbar_item">BOOK A PARTY</li>
				</a>
				<a href="news.jsp">
					<li class="navbar_item">SERVICE</li>
				</a>
				<a href="findStore.jsp">
					<li class="navbar_item">FIND STORE</li>
				</a>
			</ul>
		</nav>
		<!-- button -->
		<div class="navbar_headerRight">
			<%
			// Kiểm tra xem có phiên đăng nhập không
			if (email == null) {
			%>
			<a href="login.jsp"> <i
				class="fa-regular fa-circle-user icon_navbarHeaderRight"></i>
			</a>
			<%
			} else {
			// Nếu có phiên đăng nhập, chuyển hướng đến trang chitiettk.jsp
			%>
			<a href="chitiettk.jsp"> <i
				class="fa-regular fa-circle-user icon_navbarHeaderRight"></i>

			<%
			}
			%>
			</a> <a href="cart.jsp"> <i
				class="fa-solid fa-cart-shopping icon_navbarHeaderRight"></i>
			</a>
			<button class="icon_header_taskbar">
				<i class="fa-solid fa-bars icon_navbarHeaderRight"></i>
			</button>
		</div>
	</div>
</header>

