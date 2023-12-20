package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.Payment;

public class PaymentDAO {
    // ... (các phương thức hiện tại)

	private static final String INSERT_PAYMENT_SQL = "INSERT INTO payment (name_food, price, total, quantity, fullName, email, address, id_customer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_ALL_PAYMENTS = "SELECT * FROM payment";
	private static final String SELECT_PAYMENTS_BY_CUSTOMER_ID = "SELECT * FROM payment WHERE id_customer = ?";
	
	public void savePayment(Payment payment) throws ClassNotFoundException {
	    try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL, Statement.RETURN_GENERATED_KEYS)) {
	        preparedStatement.setString(1, payment.getName_food()); // Thiết lập giá trị cho trường name_food
	        preparedStatement.setDouble(2, payment.getPrice());
	        preparedStatement.setDouble(3, payment.getTotal());
	        preparedStatement.setInt(4, payment.getQuantity());
	        preparedStatement.setString(5, payment.getFullName());
	        preparedStatement.setString(6, payment.getEmail());
	        preparedStatement.setString(7, payment.getAddress());
	        preparedStatement.setInt(8, payment.getId_customer());
	        int affectedRows = preparedStatement.executeUpdate();
	        if (affectedRows == 0) {
	            throw new SQLException("Creating payment failed, no rows affected.");
	        }
	        try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                int id_payment = generatedKeys.getInt(1);
	                payment.setId_payment(id_payment);
	            } else {
	                throw new SQLException("Creating payment failed, no ID obtained.");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	 // Method to retrieve all payment records
    public List<Payment> getAllPayments() throws ClassNotFoundException {
        List<Payment> payments = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_PAYMENTS)) {

            while (resultSet.next()) {
                int id_payment = resultSet.getInt("id_payment");
                String name_food = resultSet.getString("name_food");
                double price = resultSet.getDouble("price");
                double total = resultSet.getDouble("total");
                int quantity = resultSet.getInt("quantity");
                String fullName = resultSet.getString("fullName");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int id_customer = resultSet.getInt("id_customer");

                Payment payment = new Payment(id_payment, name_food, price, total, quantity, fullName, email, address, id_customer);
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    public List<Payment> getPaymentsByCustomerId(int customerId) throws ClassNotFoundException {
        List<Payment> payments = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM payment WHERE id_customer = ?");
        ) {
            preparedStatement.setInt(1, customerId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int id_payment = resultSet.getInt("id_payment");
                    String name_food = resultSet.getString("name_food");
                    double price = resultSet.getDouble("price");
                    double total = resultSet.getDouble("total");
                    int quantity = resultSet.getInt("quantity");
                    String fullName = resultSet.getString("fullName");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    int id_customer = resultSet.getInt("id_customer");

                    Payment payment = new Payment(id_payment, name_food, price, total, quantity, fullName, email, address, id_customer);
                    payments.add(payment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payments;
    }

    
}
