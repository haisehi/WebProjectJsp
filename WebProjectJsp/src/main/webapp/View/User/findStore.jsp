<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./asset/css/content.css" rel="stylesheet">
<link href="./asset/css/findStore.css" rel="stylesheet">
<link href="./asset/css/header.css" rel="stylesheet">
<link href="./asset/css/footer.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Header -->
	<jsp:include page="header/header.jsp"/>
<div class="wrapper">
	<div id="map" class="map">
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49768.54632730844!2d108.20375057611707!3d16.01087928721813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421994b9527933%3A0xc2ed1cd1bda8154a!2zS0ZDIExvdHRlIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1694446470296!5m2!1svi!2s"
	aria-selected="true" 
	allowfullscreen="" 
	loading="lazy" 
	referrerpolicy="no-referrer-when-downgrade"
	width="100%"
	height="950px"
	>
	</iframe>
	
</div>
<div class="wrapper_FindStore">
<form method="POST" class="form_FindStore">
			<label class="label-form_FindStore">Contact Us</label>
			<div class="wp-form_FindStore">
				<input type="text" id="" class="input-form_FindStore" name="" required/>
				<label id="" for="" class="label_input">Name:</label>
			</div>
			<div class="wp-form_FindStore">
				<input type="number" id="" class="input-form_FindStore"  name="" required/>
				<label id="" for="" class="label_input">Phone Number:</label>
			</div>
			<div class="wp-form_FindStore">
				<input type="text" id="" class="input-form_FindStore"  name="" required/>
				<label id="" for="" class="label_input">Address:</label>
			</div>
			<button type="submit" class="button_form_FindStore" name="">Order</button>
		</form>
<img src="./asset/img/KFC-5.jpg" alt="KFC" class="img_FindStore"/>
</div>
</div>
<!-- footer -->
	<jsp:include page="footer/footer.jsp"/>