package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Demo.PosterDAO;
import Model.poster;

@WebServlet("/PosterController")
public class PosterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addPoster(request, response);
                break;
            case "view":
                viewAllPosters(request, response);
                break;
            case "delete":
                deletePoster(request, response);
                break;
        }
    }

    private void addPoster(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String name_image = request.getParameter("name_image");
        String image = request.getParameter("image");

        // Tạo đối tượng poster
        poster newPoster = new poster();
        newPoster.setName_image(name_image);
        newPoster.setImage(image);
        try {
            // Thêm poster vào cơ sở dữ liệu
            boolean success = PosterDAO.addPoster(newPoster);
            // Chuyển hướng về trang hiển thị kết quả
            if (success) {
            	request.setAttribute("message", "Poster added successfully!");
            } else {
            	request.setAttribute("message", "Failed to add poster. Please try again.");
            }
            System.out.println("Add successful");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Add failed: " + e.getMessage());
		}
        response.sendRedirect("View/Admin/Add-poster.jsp");

    }

    private void viewAllPosters(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy danh sách tất cả các poster
        List<poster> posters;
		try {
			posters = PosterDAO.getAllPosters();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("View failed: " + e.getMessage());
		}
		response.sendRedirect("View/Admin/Add-poster.jsp");
    }

    private void deletePoster(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy ID của poster cần xoá
        String posterIdStr = request.getParameter("id_image");

        // Kiểm tra xem posterIdStr có giá trị hay không
        if (posterIdStr != null && !posterIdStr.isEmpty()) {
            int posterId = Integer.parseInt(posterIdStr);

            // Xoá poster khỏi cơ sở dữ liệu
            boolean success;
            try {
                success = PosterDAO.deletePoster(posterId);
                if (success) {
                    request.setAttribute("message", "Poster deleted successfully!");
                } else {
                    request.setAttribute("message", "Failed to delete poster. Please try again.");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "An error occurred while deleting the poster.");
            }
        } else {
            request.setAttribute("message", "Invalid poster ID. Please try again.");
        }
        
        // Chuyển hướng về trang quản lý poster
        response.sendRedirect(request.getContextPath() + "/View/Admin/Add-poster.jsp");
    }

}
