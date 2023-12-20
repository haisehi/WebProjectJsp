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
                case "update":
                    updateUserInfo(request, response);
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
                session.setAttribute("id_customer", customer.getId_customer());
                session.setAttribute("email", email);
                // Truy vấn tên từ CSDL (giả sử bạn có một phương thức trong DAO để lấy tên)
                int customerId = customerDAO.getCustomerId(email);
                // Lưu tên vào phiên
                session.setAttribute("id_customer", customerId);
                // Store all customer information in the session
                session.setAttribute("customer", customer);
                
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
    
    private void updateUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id_customer = (int) request.getSession().getAttribute("id_customer");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        int phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
        String gender = request.getParameter("gender");
        Date date = Date.valueOf(request.getParameter("date"));

        Customer updatedCustomer = new Customer();
        updatedCustomer.setId_customer(id_customer);
        updatedCustomer.setFirstname(firstname);
        updatedCustomer.setLastname(lastname);
        updatedCustomer.setPhonenumber(phonenumber);
        updatedCustomer.setGender(gender);
        updatedCustomer.setDate(date);

        try {
            int result = customerDAO.updateCustomer(updatedCustomer);
            if (result > 0) {
                // Update successful
                HttpSession session = request.getSession(false); // Lấy phiên làm việc hiện tại hoặc null nếu không có phiên
                if (session != null) {
                    session.invalidate(); // Xoá phiên làm việc
                }
                response.sendRedirect("View/User/login.jsp"); // Chuyển hướng đến trang đăng nhập của admin
            } else {
                // Update failed, handle accordingly
                response.sendRedirect("View/User/chitiettk.jsp?error=update_failed");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("error :" + e.getMessage());
        }
    }

}
