package Demo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.bookParty;

public class BookPartyDAO {

    private static final String INSERT_BOOK_PARTY_SQL = "INSERT INTO book_party (fullname, phone, email, date, time, quantity, address, content) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_BOOK_PARTIES_SQL = "SELECT * FROM book_party";
    
    public int bookParty(bookParty party) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        int result = 0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_PARTY_SQL)) {

            preparedStatement.setString(1, party.getFullname());
            preparedStatement.setInt(2, party.getPhone());
            preparedStatement.setString(3, party.getEmail());
            preparedStatement.setDate(4, party.getDate());
            preparedStatement.setString(5, party.getTime());
            preparedStatement.setInt(6, party.getQuantity());
            preparedStatement.setString(7, party.getAddress());
            preparedStatement.setString(8, party.getContent());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<bookParty> getAllBookParties() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        List<bookParty> parties = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BOOK_PARTIES_SQL)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                bookParty party = new bookParty();
                party.setId_party(resultSet.getInt("id_party"));
                party.setFullname(resultSet.getString("fullname"));
                party.setPhone(resultSet.getInt("phone"));
                party.setEmail(resultSet.getString("email"));
                party.setDate(resultSet.getDate("date"));
                party.setTime(resultSet.getString("time"));
                party.setQuantity(resultSet.getInt("quantity"));
                party.setAddress(resultSet.getString("address"));
                party.setContent(resultSet.getString("content"));

                parties.add(party);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parties;
    }
}
