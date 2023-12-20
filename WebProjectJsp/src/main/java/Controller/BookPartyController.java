package Controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Demo.BookPartyDAO;
import Model.bookParty;

@WebServlet("/bookPartyController")
public class BookPartyController extends HttpServlet {
    private BookPartyDAO bookPartyDAO;

    public void init() {
        bookPartyDAO = new BookPartyDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "bookParty":
                    bookParty(request, response);
                    break;
                // Add more cases for other actions if needed
            }
        }
    }

    private void bookParty(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fullname = request.getParameter("fullname");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        Date date = Date.valueOf(request.getParameter("date"));
        String time = request.getParameter("time");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String address = request.getParameter("address");
        String content = request.getParameter("content");

        bookParty newParty = new bookParty();
        newParty.setFullname(fullname);
        newParty.setPhone(phone);
        newParty.setEmail(email);
        newParty.setDate(date);
        newParty.setTime(time);
        newParty.setQuantity(quantity);
        newParty.setAddress(address);
        newParty.setContent(content);

        try {
            bookPartyDAO.bookParty(newParty);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("View/User/home.jsp"); // Provide the path to the success page
    }

    // You can add more methods for other actions if needed
}
