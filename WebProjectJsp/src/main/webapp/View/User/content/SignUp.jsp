<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./asset/css/content.css" rel="stylesheet">
<link href="./asset/css/login.css" rel="stylesheet">
<link href="./asset/css/header.css" rel="stylesheet">
<link href="./asset/css/footer.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Header -->
	<jsp:include page="../header/header.jsp"/>
<div class="wrapper_loginOrSignUp">
	<img src="./asset/img/signin.jpg" alt="signUp" class="img_login"/>
	<div class="form">
		<form method="POST" class="form_account">
			<label class="label_account">CREATE YOUR ACCOUNT</label>
			<div class="label-form_account">
				<input type="text" id="" class="input-form_account"  name="" required/>
				<label id="" for="" class="label_input">First Name:</label>
			</div>
			<div class="label-form_account">
				<input type="text" id="" class="input-form_account"  name="" required/>
				<label id="" for="" class="label_input">Last Name:</label>
			</div>
			<div class="label-form_account">
				<input type="text" id="" class="input-form_account" name="" required/>
				<label id="" for="" class="label_input">Phone Number:</label>
			</div>
			<div class="label-form_account">
				<input type="text" id="" class="input-form_account" name="" required/>
				<label id="" for="" class="label_input">Email:</label>
			</div>
			<div class="label-form_account">
				<input type="password" id="" class="input-form_account" name="" required/>
				<label id="" for="" class="label_input">Password:</label>
			</div>
			<p class=" font-form_account"><input type="checkbox"/>I have read and accepted with Operation Policy and Policy on Information Confidentiality</p>
			<button type="submit" class="button_account_signup" name="">Create My Account</button>
			<p class="font-form_account font-signin">Already have an account? <a href="index.jsp?quanly=login" class="">Sign In</a></p>
		</form>
	</div>
</div>
<!-- footer -->
	<jsp:include page="../footer/footer.jsp"/>