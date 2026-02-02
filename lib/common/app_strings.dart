/// Application-wide string constants
/// Following Clean Code principles - no hardcoded UI text
class AppStrings {
  AppStrings._(); // Private constructor to prevent instantiation

  // App Info
  static const String appTitle = 'Flight Reservation';
  static const String appName = 'SkyBooker';

  // Search Screen
  static const String findYourFlight = 'Find Your Flight';
  static const String searchSubtitle = 'Search and book flights with ease';
  static const String searchFlights = 'Search Flights';
  static const String selectDepartureCity = 'Select departure city';
  static const String selectArrivalCity = 'Select arrival city';
  static const String selectADate = 'Select a date';

  // Labels
  static const String departureCity = 'Departure City';
  static const String arrivalCity = 'Arrival City';
  static const String departureDate = 'Departure Date';
  static const String numberOfPassengers = 'Number of Passengers';

  // Flight Results
  static const String flightResults = 'Flight Results';
  static const String passenger = 'Passenger';
  static const String passengers = 'Passengers';
  static const String byPrice = 'By Price';
  static const String byDuration = 'By Duration';

  // Flight Details
  static const String flightDetails = 'Flight Details';
  static const String aircraft = 'Aircraft';
  static const String seatPitch = 'Seat Pitch';
  static const String mealService = 'Meal Service';
  static const String notProvided = 'Not provided';
  static const String availableSeats = 'Available Seats';
  static const String seatsRemaining = 'seats remaining';
  static const String bookNow = 'Book Now';

  // Booking Screen
  static const String bookingDetails = 'Booking Details';
  static const String passengerInfo = 'Passenger Information';
  static const String passengerN =
      'Passenger'; // Used with number like "Passenger 1"
  static const String fullName = 'Full Name';
  static const String email = 'Email';
  static const String phoneNumber = 'Phone Number';
  static const String passportNumber = 'Passport Number';
  static const String seatPreference = 'Seat Preference';
  static const String next = 'Next';
  static const String bookFlight = 'Book Flight';

  // Seat Preferences
  static const String seatStandard = 'Standard';
  static const String seatWindow = 'Window';
  static const String seatAisle = 'Aisle';

  // Validation Messages
  static const String pleaseEnterName = 'Please enter passenger name';
  static const String pleaseEnterEmail = 'Please enter email address';
  static const String pleaseEnterValidEmail =
      'Please enter a valid email address';
  static const String pleaseEnterPhone = 'Please enter phone number';
  static const String pleaseEnterPassport = 'Please enter passport number';
  static const String pleaseFillAllFields = 'Please fill in all fields';
  static const String citiesMustBeDifferent =
      'Departure and arrival cities must be different';

  // Confirmation
  static const String bookingConfirmation = 'Booking Confirmation';
  static const String flight = 'Flight';
  static const String total = 'Total';
  static const String confirm = 'Confirm';
  static const String cancel = 'Cancel';
  static const String bookingSuccessful = 'Booking Successful!';
  static const String thankYou = 'Thank you for booking with us!';
  static const String confirmationSent =
      'A confirmation email has been sent to';
  static const String ok = 'OK';

  // Cities - could also be moved to data/cities.dart if preferred
  static const List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
  ];
}
