package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Demo.CategoryFoodDAO;
import Model.CategoryFood;

/**
 * Servlet implementation class CategoryFoodController
 */
@WebServlet("/categoryFoodController")
public class CategoryFoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryFoodDAO categoryFoodDAO;

	public void init() {
		categoryFoodDAO = new CategoryFoodDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "add":
			addCategoryFood(request, response);
			break;
		case "update":
			updateCategoryFood(request, response);
			break;
		// Add more cases for other actions (delete, view, etc.) if needed
		}
	}

	private void addCategoryFood(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String nameCategories = request.getParameter("name_categories");
		String imageCategories = request.getParameter("image_categories");

		CategoryFood newCategoryFood = new CategoryFood();
		newCategoryFood.setName_categories(nameCategories);
		newCategoryFood.setImage_categories(imageCategories);

		try {
			int result = categoryFoodDAO.addCategoryFood(newCategoryFood);

			if (result > 0) {
				// Success: forward to the result page with a success message
				request.setAttribute("message", "Category added successfully!");
			} else {
				// Error: forward to the result page with an error message
				request.setAttribute("message", "Failed to add category. Please try again.");
			}

			System.out.println("add successful");

		} catch (Exception e) {
			// Exception: forward to the result page with an error message
			System.out.println("add failed: " + e.getMessage());
		}
		response.sendRedirect("View/Admin/Add-Category-food.jsp");
	}

	private void updateCategoryFood(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

	}
}
