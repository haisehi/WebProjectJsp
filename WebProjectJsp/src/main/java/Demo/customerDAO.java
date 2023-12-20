package Demo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Customer;

public class customerDAO {


    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (firstname, lastname, phonenumber, email, gender, date, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String VALIDATE_CUSTOMER_SQL = "SELECT email FROM customer WHERE email = ? AND password = ?";
    
    public int registerCustomer(Customer  customer) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
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
    

    public boolean validate(String email, String password) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DatabaseConnection.getConnection();
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
    
 // Thêm phương thức này để lấy id của khách hàng từ CSDL thay vì tên
    public int getCustomerId(String email) throws ClassNotFoundException {
        int customerId = -1; // Return -1 if no customer found

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id_customer FROM customer WHERE email = ?")) {
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customerId = resultSet.getInt("id_customer");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerId;
    }

    
    public Customer getCustomerByEmail(String email) throws ClassNotFoundException {
        Customer customer = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customer WHERE email = ?")) {
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customer = new Customer();
                customer.setId_customer(resultSet.getInt("id_customer"));
                customer.setFirstname(resultSet.getString("firstname"));
                customer.setLastname(resultSet.getString("lastname"));
                customer.setPhonenumber(resultSet.getInt("phonenumber"));
                customer.setEmail(resultSet.getString("email"));
                customer.setGender(resultSet.getString("gender"));
                customer.setDate(resultSet.getDate("date"));
                customer.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
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
    
    public int updateCustomer(Customer customer) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE customer SET firstname=?, lastname=?, phonenumber=?, gender=?, date=? WHERE id_customer=?")) {
            preparedStatement.setString(1, customer.getFirstname());
            preparedStatement.setString(2, customer.getLastname());
            preparedStatement.setInt(3, customer.getPhonenumber());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setDate(5, customer.getDate());
            preparedStatement.setInt(6, customer.getId_customer());

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


}
