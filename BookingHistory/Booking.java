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
    private String userId;
    private String bookingName;
    private Timestamp dateTime;

    public Booking() {
        this.bookingId = bookingId;
        this.userId = userId;
        this.bookingName = bookingName;
        this.dateTime = dateTime;
    }

    // Getter methods
    public int getBookingId() {
        return bookingId;
    }

    public String getUserId() {
        return userId;
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
                String userId = resultSet.getString("login");
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
        String url = "jdbc:mysql://localhost:3306/your_database_name"; //change databaseName as well
        String username = "your_username"; // replace with our own database info
        String password = "your_password"; // replace with our own database info
        return DriverManager.getConnection(url, username, password);
    }

}
