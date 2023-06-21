package BookingHistory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.util.List;

public class Booking {
    private int bookingId;
    private String user_id;
    private String bookingName;
    private Timestamp dateTime;

    public Booking() {
        this.bookingId = bookingId;
        this.user_id = user_id;
        this.bookingName = bookingName;
        this.dateTime = dateTime;
    }

    // Getter methods
    public int getBookingId() {
        return bookingId;
    }

    public String getuser_id() {
        return user_id;
    }

    public String getBookingName() {
        return bookingName;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM client")) {
            while (resultSet.next()) {
                int bookingId = resultSet.getInt("client_id");
                String user_id = resultSet.getString("login");
                String bookingName = resultSet.getString("name");
                Timestamp dateTime = null;  // Replace with the real column name for datetime
                // Retrieve other columns as needed

                Booking booking = new Booking();
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/TransModus_Database"; //change databaseName as well
        String username = "username";
        String password = "password";
        return DriverManager.getConnection(url, username, password);
    }

}
