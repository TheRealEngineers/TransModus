package BookingHistory;
import java.util.List;
import java.util.ArrayList;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        Booking booking = new Booking();
        List<Booking> bookings = booking.getAllBookings();

        // Process the retrieved bookings
        for (Booking b : bookings) {
            System.out.println("Booking ID: " + b.getbooking_id());
            System.out.println("User ID: " + b.getuser_id());
            System.out.println("Booking Name: " + b.getBookingName());
            System.out.println("DateTime: " + b.getDateTime());
            System.out.println();
        }
    }
}
