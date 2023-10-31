package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Demo.*;

/**
 * Servlet implementation class customerControllerLogin
 */
@WebServlet("/login")
public class customerControllerLogin extends HttpServlet {
	private customerDAO customerDAO;

    public void init() {
        customerDAO = new customerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
			if (customerDAO.validate(email, password)) {
			    // Đăng nhập thành công, tạo phiên để lưu trạng thái đăng nhập
			    HttpSession session = request.getSession();
			    session.setAttribute("email", email);
			    // Truy vấn tên từ CSDL (giả sử bạn có một phương thức trong DAO để lấy tên)
			    String username = customerDAO.getCustomerName(email);
			    // Lưu tên vào phiên
			    session.setAttribute("username", username);
			    response.sendRedirect("View/User/chitiettk.jsp"); // Chuyển hướng đến trang chào mừng
			} else {
			    // Đăng nhập thất bại, quay lại trang đăng nhập hoặc hiển thị thông báo lỗi
			    response.sendRedirect("View/User/login.jsp"); // Trang đăng nhập
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error :"+e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error :"+e.getMessage());
		}
    }
}
