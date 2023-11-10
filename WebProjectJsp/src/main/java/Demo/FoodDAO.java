package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Food;

public class FoodDAO {
	private static final String INSERT_FOOD_SQL = "INSERT INTO food (name_food, image_food, price, id_categories) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_FOODS_SQL = "SELECT * FROM food f JOIN categories c ON f.id_categories = c.id_categories";
    private static final String UPDATE_FOOD_SQL = "UPDATE food SET name_food = ?, image_food = ?, price = ?, id_categories = ? WHERE id_food = ?";
    private static final String SELECT_FOOD_BY_ID_SQL = "SELECT * FROM food WHERE id_food = ?";
    private static final String DELETE_FOOD_SQL = "DELETE FROM food WHERE id_food = ?";

    // Thêm dữ liệu
    public int addFood(Food food) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FOOD_SQL)) {

            preparedStatement.setString(1, food.getName_food());
            preparedStatement.setString(2, food.getImage_food());
            
            preparedStatement.setDouble(3, food.getPrice());
            preparedStatement.setInt(4, food.getId_categories());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // Hiển thị dữ liệu
    public List<Food> getAllFoods() throws ClassNotFoundException {
        List<Food> foods = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FOODS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id_food");
                String name = resultSet.getString("name_food");
                String image = resultSet.getString("image_food");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("id_categories");

                Food food = new Food(id, name, image, price, categoryId);

                foods.add(food);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foods;
    }

    // Cập nhật dữ liệu
    public int updateFood(Food food) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FOOD_SQL)) {

            preparedStatement.setString(1, food.getName_food());
            preparedStatement.setString(2, food.getImage_food());
            preparedStatement.setDouble(3, food.getPrice());
            preparedStatement.setInt(4, food.getId_categories());
            preparedStatement.setInt(5, food.getId_food());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // Lấy thực thể Food theo ID
    public Food getFoodById(int foodId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Food food = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FOOD_BY_ID_SQL)) {

            preparedStatement.setInt(1, foodId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id_food");
                    String name = resultSet.getString("name_food");
                    String image = resultSet.getString("image_food");
                    double price = resultSet.getDouble("price");
                    int categoryId = resultSet.getInt("id_categories");

                    food = new Food(id, name, image, price, categoryId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return food;
    }

    // Xóa thực thể Food
    public int deleteFood(int foodId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FOOD_SQL)) {

            preparedStatement.setInt(1, foodId);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
