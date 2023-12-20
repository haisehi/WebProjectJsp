package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Demo.FoodDAO;
import Demo.ShoppingCart;

import Model.Food;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addProduct(request, response);
                break;
            case "delete":
                removeProduct(request, response);
                break;
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int foodId = Integer.parseInt(request.getParameter("id_food"));

        // Lấy thông tin sản phẩm từ ID
        FoodDAO foodDAO = new FoodDAO();
        Food food;
        try {
            food = foodDAO.getFoodById(foodId);

            // Thêm sản phẩm vào giỏ hàng (có thể kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa)
            ShoppingCart.addToCart(food);

        } catch (ClassNotFoundException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }

        // Chuyển hướng về trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/View/User/cart.jsp");
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy ID của sản phẩm cần xoá khỏi giỏ hàng
        int foodId = Integer.parseInt(request.getParameter("id_food"));
        try {
            // Xoá sản phẩm khỏi giỏ hàng
            ShoppingCart.removeFromCart(foodId);
            System.out.println("delete ok");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}


        // Chuyển hướng về trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/View/User/cart.jsp");
    }
}
