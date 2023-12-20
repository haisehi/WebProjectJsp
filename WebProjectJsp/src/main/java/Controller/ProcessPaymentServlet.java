package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Demo.PaymentDAO;
import Demo.ShoppingCart;
import Model.CartItem;
import Model.Food;
import Model.Payment;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form thanh toán
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Lấy id_customer từ phiên làm việc
        HttpSession session = request.getSession(false);
        int id_customer = (int) session.getAttribute("id_customer");

        try {
            // Lấy danh sách món hàng từ giỏ hàng
            List<CartItem> cartItems = ShoppingCart.getCartItems();

            // Tính toán giá trị cho trường name_food
            StringBuilder nameFoodBuilder = new StringBuilder();
            double totalPrice = 0; // Initialize total price
            int totalQuantity = 0; // Initialize total quantity
            
            for (CartItem item : cartItems) {
                Food food = item.getFood();
                int quantity = item.getQuantity();
                double price = food.getPrice();
                
                // Update total price and quantity
                totalPrice = price;
                totalQuantity += quantity;
                
                nameFoodBuilder.append(food.getName_food()).append(", ");
            }

            // Xóa dấu phẩy cuối cùng nếu có
            String nameFood = nameFoodBuilder.toString().replaceAll(", $", "");

            // Lấy giá trị grandTotal từ giỏ hàng
            double grandTotal = ShoppingCart.getGrandTotal();

            // Tạo đối tượng Payment
            Payment payment = new Payment(0, nameFood, totalPrice, grandTotal, totalQuantity, fullName, email, address, id_customer);

            // Lưu đối tượng Payment vào cơ sở dữ liệu (sử dụng PaymentDAO)
            PaymentDAO paymentDAO = new PaymentDAO();
            paymentDAO.savePayment(payment);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Xóa giỏ hàng sau khi thanh toán
        ShoppingCart.clearCart();

        // Chuyển hướng về trang cảm ơn hoặc trang chủ
        response.sendRedirect("View/User/cart.jsp");
    }
}

