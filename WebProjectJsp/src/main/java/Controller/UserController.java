package Controller;

import java.io.IOException;
import java.sql.Date;

import Demo.*;
import Model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/userController")
public class UserController extends HttpServlet {
    private customerDAO customerDAO;

    public void init() {
        customerDAO = new customerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "login":
                    loginUser(request, response);
                    break;
                case "signup":
                    registerUser(request, response);
                    break;
                case "logout":
                    logoutUser(request, response);
                    break;
                // Add more cases for other actions if needed
            }
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Customer customer = customerDAO.getCustomerByEmail(email);

            if (customer != null && customerDAO.validate(email, password)) {
                // Đăng nhập thành công, tạo phiên để lưu trạng thái đăng nhập
                HttpSession session = request.getSession();
                session.setAttribute("customerId", customer.getId_customer());
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
            e.printStackTrace();
            System.out.println("error :" + e.getMessage());
        }
    }


    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        int phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        Date date = Date.valueOf(request.getParameter("date"));
        String password = request.getParameter("password");

        Customer newCustomer = new Customer();
        newCustomer.setFirstname(firstname);
        newCustomer.setLastname(lastname);
        newCustomer.setPhonenumber(phonenumber);
        newCustomer.setEmail(email);
        newCustomer.setGender(gender);
        newCustomer.setDate(date);
        newCustomer.setPassword(password);

        try {
            customerDAO.registerCustomer(newCustomer);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("View/User/login.jsp");
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false); // Lấy phiên làm việc hiện tại hoặc null nếu không có phiên
        if (session != null) {
            session.invalidate(); // Xoá phiên làm việc
        }
        response.sendRedirect("View/User/login.jsp"); // Chuyển hướng đến trang đăng nhập của admin
    }
}
