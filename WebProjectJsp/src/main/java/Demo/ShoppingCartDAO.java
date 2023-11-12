package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.CartItem;
import Model.Food;
import Model.Customer;


public class ShoppingCartDAO {
	
	
    private static final String INSERT_CART_ITEM_SQL = "INSERT INTO cart (id_food, quantity, id_customer) VALUES (?, ?, ?)";
    private static final String UPDATE_CART_ITEM_SQL = "UPDATE cart SET quantity = quantity + ? WHERE id_food = ? AND id_customer = ?";
    private static final String SELECT_CART_ITEMS_SQL = "SELECT f.*, c.quantity, c.id_customer FROM cart c JOIN food f ON c.id_food = f.id_food";
    private static final String SELECT_CART_ITEMS_FOR_CUSTOMER_SQL ="SELECT f.*, c.quantity, c.id_customer FROM cart c JOIN food f ON c.id_food = f.id_food WHERE c.id_customer = ?";

    
    public void addToCart(Food food, int quantity, int customerId) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM_SQL)) {

            preparedStatement.setInt(1, food.getId_food());
            preparedStatement.setInt(2, quantity);
            preparedStatement.setInt(3, customerId);

            preparedStatement.executeUpdate();
        }
    }


    public void updateCartItem(int foodId, int quantity, int customerId) throws ClassNotFoundException, SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_ITEM_SQL)) {

            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, foodId);
            preparedStatement.setInt(3, customerId);

            preparedStatement.executeUpdate();
        }
    }


    public List<CartItem> getCartItems() throws ClassNotFoundException, SQLException {
        List<CartItem> cartItems = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEMS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id_food");
                String name = resultSet.getString("name_food");
                String image = resultSet.getString("image_food");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("id_categories");
                int quantity = resultSet.getInt("quantity");
                int customerId = resultSet.getInt("id_customer");

                Customer customer = new Customer(); // Replace this with your logic to fetch customer details
                customer.setId_customer(customerId);

                Food food = new Food(id, name, image, price, categoryId);
                CartItem cartItem = new CartItem(food, quantity, customer);

                cartItems.add(cartItem);
            }
        }

        return cartItems;
    }
    
    public List<CartItem> getCartItemsCustomer(int customerId) throws ClassNotFoundException, SQLException {
        List<CartItem> cartItems = new ArrayList<>();

        String SELECT_CART_ITEMS_FOR_CUSTOMER_SQL =
                "SELECT f.*, c.quantity, c.id_customer FROM cart c JOIN food f ON c.id_food = f.id_food WHERE c.id_customer = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEMS_FOR_CUSTOMER_SQL)) {

            preparedStatement.setInt(1, customerId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id_food");
                    String name = resultSet.getString("name_food");
                    String image = resultSet.getString("image_food");
                    double price = resultSet.getDouble("price");
                    int categoryId = resultSet.getInt("id_categories");
                    int quantity = resultSet.getInt("quantity");
                    int customerIdResult = resultSet.getInt("id_customer");

                    Customer customer = new Customer(); // Replace this with your logic to fetch customer details
                    customer.setId_customer(customerIdResult);

                    Food food = new Food(id, name, image, price, categoryId);
                    CartItem cartItem = new CartItem(food, quantity, customer);

                    cartItems.add(cartItem);
                }
            }
        }

        return cartItems;
    }
    
    public boolean isItemInCart(int foodId, int customerId) throws ClassNotFoundException, SQLException {
        String CHECK_ITEM_IN_CART_SQL = "SELECT 1 FROM cart WHERE id_food = ? AND id_customer = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_ITEM_IN_CART_SQL)) {

            preparedStatement.setInt(1, foodId);
            preparedStatement.setInt(2, customerId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }
}
