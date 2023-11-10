package Controller;

import Demo.FoodDAO;
import Model.Food;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/foodController")
public class FoodController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FoodDAO foodDAO;

    public void init() {
        foodDAO = new FoodDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Action: " + action);
        if (action != null) {
        switch (action) {
            case "add":
                addFood(request, response);
                break;
            case "update":
                updateFood(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteFood(request, response);
                break;
        }
        } else {
            // Handle the case where "action" is null (optional, depending on your logic)
        	System.out.println("lỗi action");
        }
    }

    private void addFood(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String nameFood = request.getParameter("name_food");
        String imageFood = request.getParameter("image_food");
        double price = Double.parseDouble(request.getParameter("price"));
        int idCategories = Integer.parseInt(request.getParameter("id_categories"));

        Food newFood = new Food(0, nameFood, imageFood, price, idCategories);

        try {
            int result = foodDAO.addFood(newFood);

            if (result > 0) {
                request.setAttribute("message", "Food added successfully!");
            } else {
                request.setAttribute("message", "Failed to add food. Please try again.");
            }

            System.out.println("Add successful");

        } catch (Exception e) {
            System.out.println("Add failed: " + e.getMessage());
        }
        response.sendRedirect("View/Admin/Add-Food.jsp");
    }

    private void updateFood(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id_food"));
        String nameFood = request.getParameter("name_food");
        String imageFood = request.getParameter("image_food");
        double price = Double.parseDouble(request.getParameter("price"));
        int idCategories = Integer.parseInt(request.getParameter("id_categories"));

        Food updatedFood = new Food(id, nameFood, imageFood, price, idCategories);

        try {
            int result = foodDAO.updateFood(updatedFood);

            if (result > 0) {
                request.setAttribute("message", "Food updated successfully!");
            } else {
                request.setAttribute("message", "Failed to update food. Please try again.");
            }

            System.out.println("Update successful");

        } catch (Exception e) {
            System.out.println("Update failed: " + e.getMessage());
        }
        response.sendRedirect("View/Admin/Add-Food.jsp");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_food"));
        Food food;
        try {
            food = foodDAO.getFoodById(id);
            request.setAttribute("food", food);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/edit-food-form.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id_food"));

        try {
            int result = foodDAO.deleteFood(id);

            if (result > 0) {
                request.setAttribute("message", "Food deleted successfully!");
            } else {
                request.setAttribute("message", "Failed to delete food. Please try again.");
            }

            System.out.println("Delete successful");

        } catch (Exception e) {
            System.out.println("Delete failed: " + e.getMessage());
        }
        response.sendRedirect("View/Admin/Add-Food.jsp");
    }
}
