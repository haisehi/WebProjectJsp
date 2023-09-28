var swiper = new Swiper(".home-slider", {
    loop:true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    autoplay: {
       delay: 3000, // Đặt khoảng thời gian 3 giây giữa các lần chuyển đổi
     },
 });