package Controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Demo.FoodDAO;
import Demo.ShoppingCartDAO;
import Model.Food;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch food ID and quantity from the request
        int foodId = Integer.parseInt(request.getParameter("id_food"));
        String quantityParam = request.getParameter("quantity");
        int quantity = (quantityParam != null && !quantityParam.isEmpty()) ? Integer.parseInt(quantityParam) : 1;

        // Fetch customer ID from the session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("customerId") != null) {
            int customerId = (int) session.getAttribute("customerId");

            // Instantiate ShoppingCartDAO
            ShoppingCartDAO cartDAO = new ShoppingCartDAO();
            try {
                // Check if the item is already in the cart
                if (cartDAO.isItemInCart(foodId, customerId)) {
                    // If the item is in the cart, update the quantity
                    cartDAO.updateCartItem(foodId, quantity, customerId);
                } else {
                    // If the item is not in the cart, add it
                    FoodDAO foodDAO = new FoodDAO();
                    Food food = foodDAO.getFoodById(foodId);
                    cartDAO.addToCart(food, quantity, customerId);
                }
                System.out.println("Thêm sản phẩm vào giỏ hàng thành công");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle the exception (redirect to an error page, log, etc.)
            }

            // Redirect back to the menu or any desired page
            response.sendRedirect("View/User/cart.jsp");
        } else {
            // Handle the case where the customer ID is not available in the session
            System.out.println("Customer ID not found in the session.");
            // Optionally, you can redirect to an error page or handle this case as needed
        }
    }
}
