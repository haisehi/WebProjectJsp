<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href=".asset/css/header.css">
        <link rel="stylesheet" href="asset/css/footer.css">
        <link rel="stylesheet" href="asset/css/home.css">
        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        
<!-- Header -->
	<jsp:include page="header/header.jsp"/>

<!-- content -->
        <div class="wrapper_content">
            <div class="content_swiper">
                <!-- Swiper -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide" style="background-color: red;"><img
                                src="https://static.kfcvietnam.com.vn/images/content/home/carousel/lg/GaQueKem.webp?v=k4Bd83"
                                alt=""></div>
                        <div class="swiper-slide" style="background-color: yellow;">Slide 2</div>
                        <div class="swiper-slide" style="background-color: green;">Slide 3</div>
                    </div>
                    <div class="swiper-button-next customBtn"></div>
                    <div class="swiper-button-prev customBtn"></div>
                </div>
                <!-- Swiper JS -->
                <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
            </div>
            <div class="content_home">
                <section class="food" id="hotdeals">
                    <h2 class="heading">BROWSE CATEGORIES</h2>
                    <!-- movies conatiner -->
                    <div class="food-container">
                        <!-- box 1 -->
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>

                        </div>
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>
                        </div>
                        <!-- box 1 -->
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>

                        </div>
                </section>
                <section class="food" id="hotdeals">
                    <h2 class="heading">WE THINK YOU’LL LOVE THESE</h2>
                    <!-- movies conatiner -->
                    <div class="food-container">
                        <!-- box 1 -->
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>

                        </div>
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>
                        </div>
                        <div class="box">
                            <div class="box-img">
                                <img src="./asset/img/home-menu-1.jpg" alt="">
                            </div>
                            <div class="box_price_title">
                                <h3 class="title_product">Combo Happy</h3>
                            </div>
                        </div>
                </section>
            </div>
        </div>
<!-- footer -->
	<jsp:include page="footer/footer.jsp"/>
	
	<script>
        var swiper = new Swiper(".mySwiper", {
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>