import '../models/flight.dart';

/// Static flight data for the application
/// In a real app, this would come from an API
class FlightData {
  FlightData._(); // Private constructor

  /// Generates a list of sample flights for a given route
  static List<Flight> generateFlights(String departure, String arrival) {
    return [
      Flight(
        id: '1',
        airline: 'Blue Airways',
        departureCity: departure,
        arrivalCity: arrival,
        departureTime: '08:00',
        arrivalTime: '11:30',
        duration: '5h 30m',
        price: 299.99,
        seats: 145,
        aircraftType: 'Boeing 737',
        flightNumber: 'BA102',
        seatPitch: '31 inches',
        mealProvided: true,
        mealType: 'Breakfast & Snacks',
      ),
      Flight(
        id: '2',
        airline: 'SkyLine Airlines',
        departureCity: departure,
        arrivalCity: arrival,
        departureTime: '10:15',
        arrivalTime: '13:45',
        duration: '5h 30m',
        price: 249.99,
        seats: 89,
        aircraftType: 'Airbus A320',
        flightNumber: 'SL205',
        seatPitch: '30 inches',
        mealProvided: false,
        mealType: '',
      ),
      Flight(
        id: '3',
        airline: 'Red Star Aviation',
        departureCity: departure,
        arrivalCity: arrival,
        departureTime: '14:20',
        arrivalTime: '17:50',
        duration: '5h 30m',
        price: 349.99,
        seats: 220,
        aircraftType: 'Boeing 787',
        flightNumber: 'RSA512',
        seatPitch: '32 inches',
        mealProvided: true,
        mealType: 'Full Service Meal',
      ),
      Flight(
        id: '4',
        airline: 'Blue Airways',
        departureCity: departure,
        arrivalCity: arrival,
        departureTime: '16:00',
        arrivalTime: '19:30',
        duration: '5h 30m',
        price: 279.99,
        seats: 156,
        aircraftType: 'Airbus A321',
        flightNumber: 'BA318',
        seatPitch: '31 inches',
        mealProvided: true,
        mealType: 'Lunch & Beverages',
      ),
      Flight(
        id: '5',
        airline: 'SkyLine Airlines',
        departureCity: departure,
        arrivalCity: arrival,
        departureTime: '18:45',
        arrivalTime: '22:15',
        duration: '5h 30m',
        price: 199.99,
        seats: 64,
        aircraftType: 'Boeing 737',
        flightNumber: 'SL412',
        seatPitch: '30 inches',
        mealProvided: false,
        mealType: '',
      ),
    ];
  }
}
