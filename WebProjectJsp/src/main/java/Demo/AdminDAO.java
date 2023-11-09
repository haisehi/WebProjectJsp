package Demo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Admin;

public class AdminDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/databasejsp";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String VALIDATE_CUSTOMER_SQL = "SELECT username FROM admin WHERE username = ? AND password = ?";

    public boolean validate(String username, String password) throws ClassNotFoundException {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_CUSTOMER_SQL)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println("successfully");
            return resultSet.next(); // Nếu resultSet có dữ liệu, username và mật khẩu hợp lệ
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error"+e.getMessage());
            return false;
        }
    }
 // Thêm phương thức này để lấy tên của khách hàng từ CSDL
    public String getAdminName(String username) throws ClassNotFoundException {
        String AdminName = null;


        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT username FROM admin WHERE username = ?")) {
            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
            	AdminName = resultSet.getString("username");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return AdminName;
    }
}
