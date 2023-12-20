package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.poster;

public class PosterDAO {
	
	private static final String INSERT_POSTER_SQL ="INSERT INTO poster (name_image, image) VALUES (?, ?)";
	private static final String VIEW_POSTER_SQL ="SELECT * FROM poster";
	private static final String DELETE_POSTER_SQL ="DELETE FROM poster WHERE id_image=?";
    
    // Hàm thêm poster
    public static boolean addPoster(poster poster) throws ClassNotFoundException{
    	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POSTER_SQL)) {
            preparedStatement.setString(1, poster.getName_image());
            preparedStatement.setString(2, poster.getImage());
            int rowsAffected = preparedStatement.executeUpdate();

            // Trả về true nếu có ít nhất một hàng được thêm vào cơ sở dữ liệu
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Xử lý lỗi SQL hoặc lỗi ClassNotFoundException
            e.printStackTrace();
            return false;
        }
    }

    // Hàm xem tất cả các poster
    public static List<poster> getAllPosters() throws ClassNotFoundException{
    	Class.forName("com.mysql.cj.jdbc.Driver");
        List<poster> posters = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VIEW_POSTER_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                poster poster = new poster();
                poster.setId_image(resultSet.getInt("id_image"));
                poster.setName_image(resultSet.getString("name_image"));
                poster.setImage(resultSet.getString("image"));
                posters.add(poster);
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL hoặc lỗi ClassNotFoundException
            e.printStackTrace();
        }
        return posters;
    }

    // Hàm xóa poster theo ID
    public static boolean deletePoster(int posterId) throws ClassNotFoundException{
    	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_POSTER_SQL)) {
            preparedStatement.setInt(1, posterId);
            int rowsAffected = preparedStatement.executeUpdate();

            // Trả về true nếu có ít nhất một hàng được xoá khỏi cơ sở dữ liệu
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Xử lý lỗi SQL hoặc lỗi ClassNotFoundException
            e.printStackTrace();
            return false;
        }
    }
}
