<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Your Account</title>
    <link href="./asset/css/content.css" rel="stylesheet">
    <link href="./asset/css/login.css" rel="stylesheet">
    <link href="./asset/css/header.css" rel="stylesheet">
    <link href="./asset/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <!-- Header -->
    <jsp:include page="header/header.jsp"/>
    <div class="wrapper_loginOrSignUp">
        <img src="./asset/img/signin.jpg" alt="signUp" class="img_login"/>
        <div class="form">
            <form method="POST" class="form_account" action="${pageContext.request.contextPath}/signup">
                <label class="label_account">CREATE YOUR ACCOUNT</label>
                <div class="label-form_account">
                    <input type="text" id="firstName" class="input-form_account" name="firstname" required/>
                    <label id="firstNameLabel" for="firstName" class="label_input">First Name:</label>
                </div>
                <div class="label-form_account">
                    <input type="text" id="lastName" class="input-form_account" name="lastname" required/>
                    <label id="lastNameLabel" for="lastName" class="label_input">Last Name:</label>
                </div>
                <div class="label-form_account">
                    <input type="text" id="phoneNumber" class="input-form_account" name="phonenumber" required/>
                    <label id="phoneNumberLabel" for="phoneNumber" class="label_input">Phone Number:</label>
                </div>
                <div class="label-form_account">
                    <input type="text" id="email" class="input-form_account" name="email" required/>
                    <label id="emailLabel" for="email" class="label_input">Email:</label>
                </div>
               	<div class="label-form_account">
                    <input type="text" id="gender" class="input-form_account" name="gender" required/>
                    <label id="phoneNumberLabel" for="phoneNumber" class="label_input">gender</label>
                </div>
                <div class="label-form_account">
                    <input type="text" id="date" class="input-form_account" name="date" required/>
                    <label id="emailLabel" for="email" class="label_input">date</label>
                </div>
                <div class="label-form_account">
                    <input type="password" id="password" class="input-form_account" name="password" required/>
                    <label id="passwordLabel" for="password" class="label_input">Password:</label>
                </div>
                <p class="font-form_account">
                    <input type="checkbox" id="acceptPolicy" name="acceptPolicy"/>I have read and accepted with Operation Policy and Policy on Information Confidentiality
                </p>
                <input type="submit" class="button_account_signup" name="submit" value="Create My Account">
                <p class="font-form_account font-signin">Already have an account? <a href="index.jsp?quanly=login" class="">Sign In</a></p>
            </form>
        </div>
    </div>
    <!-- Footer -->
    <jsp:include page="footer/footer.jsp"/>
</body>
</html>
