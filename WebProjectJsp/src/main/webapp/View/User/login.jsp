<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="./asset/css/content.css" rel="stylesheet">
<link href="./asset/css/login.css" rel="stylesheet">
<link href="./asset/css/header.css" rel="stylesheet">
<link href="./asset/css/footer.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Header -->
<jsp:include page="header/header.jsp" />
<div class="wrapper_loginOrSignUp">
	<img src="./asset/img/signin.jpg" alt="signIn" class="img_login">
	<div class="form">
		<form method="POST" class="form_account"
			action="${pageContext.request.contextPath}/userController">
			<label class="label_account">login</label>
			<div class="label-form_account">
				<input type="text" id="" class="input-form_account" name="email"
					required /> <label id="" for="" class="label_input">Email:</label>
			</div>
			<div class="label-form_account">
				<input type="password" id="" class="input-form_account"
					name="password" required /> <label id="" for="" class="label_input">Password:</label>
			</div>
			<p class="forgot_pwd font-form_account js-forgot-pass">
				<a href="#">Forgot Your Password?</a>
			</p>
			<input type="submit" class="button_account" name="action"
				value="login" />
			<p class="font-form_account font-signin">
				Have'nt got an account? <a href="SignUp.jsp" class="">Sign Up</a>
			</p>
		</form>
	</div>
</div>
<!-- footer -->
<jsp:include page="footer/footer.jsp" />
<!-- modal -->
<div class="modal js-modal">
	<div class="modal-container js-modal-container">
		<div class="modal-close js-modal-close">
			<i class="fa-brands fa-x-twitter"></i>
		</div>
		<header class="modal-header"> Forgot your password, huh? It
			happens.Let's reset it and get you back in the game. </header>
		<div class="modal-body">
			<div class="label-form_account form-fgPw">
				<input type="text" id="" class="input-form_account" name="" required />
				<label id="" for="" class="label_input">Email:</label>
			</div>
			<button id="forgot-pass" class="button_account_signup">Send
				Password Reset Email</button>
		</div>
	</div>
</div>
<!-- script of modal -->
<script>
            const buyBtns = document.querySelectorAll('.js-forgot-pass')
            const modal = document.querySelector('.js-modal')
            const modalclose = document.querySelector('.js-modal-close')
            const modalContainer = document.querySelector(".js-modal-container")

            //hÃ m hiá»n thá» from mua vÃ©
            function showBuyTickets() {
                modal.classList.add('openModal')
            }
            //hÃ m gá»¡ bá» class openModal
            function hideBuyTickets() {
                modal.classList.remove('openModal')
            }
            //hÃ m láº·p láº¯ng nghe sá»± kiá»n click 
            for (const buyBtn of buyBtns) {
                buyBtn.addEventListener('click', showBuyTickets)
            }
            //hÃ m láº·p láº¯ng nghe sá»± kiá»n click
            modalclose.addEventListener('click', hideBuyTickets)
            modal.addEventListener('click', hideBuyTickets)
            modalContainer.addEventListener('click', function (event) {
                event.stopPropagation()
            })  
        </script>