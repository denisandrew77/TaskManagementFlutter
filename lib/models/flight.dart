class Flight {
  final String id;
  final String airline;
  final String departureCity;
  final String arrivalCity;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final double price;
  final int seats;
  final String aircraftType;
  final String flightNumber;
  final String seatPitch;
  final bool mealProvided;
  final String mealType;

  Flight({
    required this.id,
    required this.airline,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.seats,
    required this.aircraftType,
    required this.flightNumber,
    required this.seatPitch,
    required this.mealProvided,
    required this.mealType,
  });
}
