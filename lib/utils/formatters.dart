/// Formatting utilities for dates, currency, etc.
class Formatters {
  Formatters._(); // Private constructor

  /// Formats a DateTime to a readable date string (DD/MM/YYYY)
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  /// Formats a price to currency string
  static String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  /// Formats passenger count with proper singular/plural
  static String formatPassengerCount(int count) {
    return '$count ${count == 1 ? 'Passenger' : 'Passengers'}';
  }

  /// Formats route string (Departure → Arrival)
  static String formatRoute(String departure, String arrival) {
    return '$departure → $arrival';
  }
}
