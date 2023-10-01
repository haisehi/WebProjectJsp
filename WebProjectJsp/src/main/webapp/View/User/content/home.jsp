<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./asset/css/content.css" rel="stylesheet">
<link href="./asset/css/style.css" rel="stylesheet">
<link href="./asset/css/header.css" rel="stylesheet">
<link href="./asset/css/footer.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Header -->
	<jsp:include page="../header/header.jsp"/>
      <!-- swiper css link  -->
      <link rel="stylesheet"
         href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
      


      
      <section class="home">
         <div class="swiper home-slider">

            <div class="swiper-wrapper">
               <div class="swiper-slide slide"
                  style="background:url(./asset/img/slide-1.jpg) no-repeat">
               </div>

               <div class="swiper-slide slide"
                  style="background:url(./asset/img/slide-2.jpg) no-repeat" >
               </div>

               <div class="swiper-slide slide"
                  style="background:url(./asset/img/slide-3.jpg) no-repeat">
               </div>

            </div>

            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>

         </div>

      </section>

      <!-- home section ends -->

     


      <!-- home packages section starts  -->

      <section class="home-packages">

         <h1 class="heading-title" > Danh mục món ăn </h1>

         <div class="box-container">

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-1.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Ưu Đãi</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
               </div>
            </div> 

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-2.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Món mới</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-3.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Combo 1 người</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-4.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Combo nhóm</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>

                 
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-5.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Gà rán - gà quay</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>

                 
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-6.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Burger - cơm - mì ý</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
                  
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-7.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Thức ăn nhẹ</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
                  
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-menu-8.jpg" alt>
               </div>
               <div class="content">
                  <a href="">
                     <h1>Thức uống và tráng miệng</h1>
                     <i class="fa-solid fa-chevron-right icon-home" ></i>
                  </a>
               </div>
            </div>
         </div>

      
         <h1 class="heading-title" style="margin-top: 20px;"> có thể bạn sẽ thích món này  </h1>

         <div class="box-container">

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-combo-1.jpg" alt>
               </div>
               <div class="content">
                  <h2>Combo nhóm 1</h2>

                  <p style="text-align: left;">
                     3 Miếng Gà + 1 Burger Zinger/Burger Tôm/Burger Phi-lê Gà Quay + 2 Lon pepsi
                  </p>
                  <a href="#" class="btn">Thêm</a>

               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-combo-2.jpg" alt>
               </div>
               <div class="content">
                  <h2>Combo nhóm 2</h2>
                  <p style="text-align: left;">
                     3 Miếng Gà + 1 Burger Zinger/Burger Tôm/Burger Phi-lê Gà Quay + 2 Lon pepsi
                  </p>
                  <a href="#" class="btn">Thêm</a>
               </div>
            </div>

            <div class="box">
               <div class="image">
                  <img style="cursor: pointer;" src="./asset/img/home-combo-3.jpg" alt>
               </div>
               <div class="content">
                  <h2>Combo nhóm 3</h2>
                  <p style="text-align: left;"> 
                     3 Miếng Gà + 1 Burger Zinger/Burger Tôm/Burger Phi-lê Gà Quay + 2 Lon pepsi
                  </p>
                  <a href="#" class="btn">Thêm</a>

               </div>
            </div>

         </div>

      </section>

      <!-- home packages section ends -->

      <!-- home offer section starts  -->

      <section class="home-about">
        
      </section>

      <!-- home offer section ends -->

      <section class="footer"></section>

      <!-- swiper js link  -->
      <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
      <!-- custom js file link  -->
      <script src="./asset/js/script.js"></script>
<!-- footer -->
<jsp:include page="../footer/footer.jsp"/>