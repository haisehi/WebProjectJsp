package Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Demo.*;
import Model.*;

/**
 * Servlet implementation class customerController
 */
@WebServlet("/signup")
public class customerControllerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private customerDAO customerDAO;

    public void init() {
        customerDAO = new customerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        registerCustomer(request, response);
    }

    private void registerCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
}
