package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Demo.AdminDAO;
import Demo.customerDAO;

@WebServlet("/Admin")
public class AdminController extends HttpServlet {
    private AdminDAO adminDAO;

    public void init() {
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            loginAdmin(request, response);
        } else if ("logout".equals(action)) {
            logoutAdmin(request, response);
        }
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("username") == null) {
            // Nếu người dùng chưa đăng nhập, thực hiện kiểm tra đăng nhập
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                if (adminDAO.validate(username, password)) {
                    // Đăng nhập thành công, tạo phiên để lưu trạng thái đăng nhập
                    session.setAttribute("username", username);
                    // Truy vấn tên từ CSDL (giả sử bạn có một phương thức trong DAO để lấy tên)
                    String usernameAdmin = adminDAO.getAdminName(username);
                    // Lưu tên vào phiên
                    session.setAttribute("username", usernameAdmin);
                    response.sendRedirect("View/Admin/Add-Category-food.jsp"); // Chuyển hướng đến trang chào mừng
                    return; // Dừng xử lý Servlet sau khi đã đăng nhập
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println("error :" + e.getMessage());
            }
        }

        // Nếu không thỏa mãn điều kiện ở trên hoặc đăng nhập thất bại, quay lại trang đăng nhập hoặc hiển thị thông báo lỗi
        response.sendRedirect("View/Admin/Admin.jsp"); // Trang đăng nhập
    }

    private void logoutAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Lấy phiên làm việc hiện tại hoặc null nếu không có phiên
        if (session != null) {
            session.invalidate(); // Xoá phiên làm việc
        }
        response.sendRedirect("View/Admin/Admin.jsp"); // Chuyển hướng đến trang đăng nhập của admin
    }
}
