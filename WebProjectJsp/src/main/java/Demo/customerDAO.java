package Demo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Customer;

public class customerDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/databasejsp";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (firstname, lastname, phonenumber, email, gender, date, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public int registerCustomer(Customer  customer) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {

            preparedStatement.setString(1, customer.getFirstname());
            preparedStatement.setString(2, customer.getLastname());
            preparedStatement.setInt(3, customer.getPhonenumber());
            preparedStatement.setString(4, customer.getEmail());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setDate(6, customer.getDate());
            preparedStatement.setString(7, customer.getPassword());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    private static final String VALIDATE_CUSTOMER_SQL = "SELECT email FROM customer WHERE email = ? AND password = ?";

    public boolean validate(String email, String password) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_CUSTOMER_SQL)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            return resultSet.next(); // Nếu resultSet có dữ liệu, email và mật khẩu hợp lệ
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error"+e.getMessage());
            return false;
        }
    }
    
    // Thêm phương thức này để lấy tên của khách hàng từ CSDL
    public String getCustomerName(String email) throws ClassNotFoundException {
        String customerName = null;


        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT firstname FROM customer WHERE email = ?")) {
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customerName = resultSet.getString("firstname");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerName;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}