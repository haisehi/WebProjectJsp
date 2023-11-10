package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
        case "edit":
            showEditForm(request, response);
            break;
        case "delete":
            deleteCategoryFood(request, response);
            break;
        // Add more cases for other actions (view, etc.) if needed
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
		int id = Integer.parseInt(request.getParameter("id_categories"));
        String nameCategories = request.getParameter("name_categories");
        String imageCategories = request.getParameter("image_categories");

        CategoryFood updatedCategoryFood = new CategoryFood();
        updatedCategoryFood.setId_categories(id);
        updatedCategoryFood.setName_categories(nameCategories);
        updatedCategoryFood.setImage_categories(imageCategories);

        try {
            int result = categoryFoodDAO.updateCategoryFood(updatedCategoryFood);

            if (result > 0) {
                // Success: forward to the result page with a success message
                request.setAttribute("message", "Category updated successfully!");
            } else {
                // Error: forward to the result page with an error message
                request.setAttribute("message", "Failed to update category. Please try again.");
            }

            System.out.println("update successful");

        } catch (Exception e) {
            // Exception: forward to the result page with an error message
            System.out.println("update failed: " + e.getMessage());
        }
        response.sendRedirect("View/Admin/Add-Category-food.jsp");
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_categories"));
        CategoryFood category;
		try {
			category = categoryFoodDAO.getCategoryById(id);
			request.setAttribute("category", category);	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/edit-category-form.jsp");
        dispatcher.forward(request, response);
    }
	
	private void deleteCategoryFood(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException {
	    int id = Integer.parseInt(request.getParameter("id_categories"));

	    try {
	        int result = categoryFoodDAO.deleteCategoryFood(id);

	        if (result > 0) {
	            // Success: forward to the result page with a success message
	            request.setAttribute("message", "Category deleted successfully!");
	        } else {
	            // Error: forward to the result page with an error message
	            request.setAttribute("message", "Failed to delete category. Please try again.");
	        }

	        System.out.println("delete successful");

	    } catch (Exception e) {
	        // Exception: forward to the result page with an error message
	        System.out.println("delete failed: " + e.getMessage());
	    }
	    response.sendRedirect("View/Admin/Add-Category-food.jsp");
	}
}
