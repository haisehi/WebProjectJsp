package Demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import Model.CategoryFood;

public class CategoryFoodDAO {


    private static final String INSERT_CATEGORY_FOOD_SQL = "INSERT INTO categories (name_categories, image_categories) VALUES (?, ?)";
    private static final String SELECT_ALL_CATEGORIES_SQL = "SELECT * FROM categories";
    private static final String UPDATE_CATEGORY_FOOD_SQL = "UPDATE categories SET name_categories = ?, image_categories = ? WHERE id_categories = ?";
    private static final String SELECT_CATEGORY_BY_ID_SQL = "SELECT * FROM categories WHERE id_categories = ?";
    private static final String DELETE_CATEGORY_SQL = "DELETE FROM categories WHERE id_categories = ?";
    //thêm dữ liệu
    public int addCategoryFood(CategoryFood category) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_FOOD_SQL)) {

            preparedStatement.setString(1, category.getName_categories());
            preparedStatement.setString(2, category.getImage_categories());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    //hiển thị dữ liệu
    public List<CategoryFood> getAllCategories() throws ClassNotFoundException {
        List<CategoryFood> categories = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id_categories");
                String name = resultSet.getString("name_categories");
                String image = resultSet.getString("image_categories");

                CategoryFood category = new CategoryFood();
                category.setId_categories(id);
                category.setName_categories(name);
                category.setImage_categories(image);

                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
    //cập nhập dữ liệu
    public int updateCategoryFood(CategoryFood category) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CATEGORY_FOOD_SQL)) {

               preparedStatement.setString(1, category.getName_categories());
               preparedStatement.setString(2, category.getImage_categories());
               preparedStatement.setInt(3, category.getId_categories());

               result = preparedStatement.executeUpdate();

           } catch (SQLException e) {
               e.printStackTrace();
           }


        return result;
    }
    //lấy id category
    public CategoryFood getCategoryById(int categoryId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        CategoryFood category = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID_SQL)) {

            preparedStatement.setInt(1, categoryId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id_categories");
                    String name = resultSet.getString("name_categories");
                    String image = resultSet.getString("image_categories");

                    category = new CategoryFood();
                    category.setId_categories(id);
                    category.setName_categories(name);
                    category.setImage_categories(image);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }
    
    //xoá
    public int deleteCategoryFood(int categoryId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CATEGORY_SQL)) {

            preparedStatement.setInt(1, categoryId);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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
