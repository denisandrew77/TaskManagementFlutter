import 'package:flutter/material.dart';
import '../models/flight.dart';
import '../widgets/expandable_flight_card.dart';

class FlightListScreen extends StatefulWidget {
  final String departure;
  final String arrival;
  final DateTime date;
  final int passengers;

  const FlightListScreen({
    Key? key,
    required this.departure,
    required this.arrival,
    required this.date,
    required this.passengers,
  }) : super(key: key);

  @override
  State<FlightListScreen> createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  late List<Flight> flights;
  String selectedSort = 'price'; // 'price' or 'duration'

  @override
  void initState() {
    super.initState();
    flights = _generateFlights();
  }

  List<Flight> _generateFlights() {
    return [
      Flight(
        id: '1',
        airline: 'Blue Airways',
        departureCity: widget.departure,
        arrivalCity: widget.arrival,
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
        departureCity: widget.departure,
        arrivalCity: widget.arrival,
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
        departureCity: widget.departure,
        arrivalCity: widget.arrival,
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
        departureCity: widget.departure,
        arrivalCity: widget.arrival,
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
        departureCity: widget.departure,
        arrivalCity: widget.arrival,
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

  void _sortFlights(String sortBy) {
    setState(() {
      selectedSort = sortBy;
      if (sortBy == 'price') {
        flights.sort((a, b) => a.price.compareTo(b.price));
      } else if (sortBy == 'duration') {
        flights.sort((a, b) => a.duration.compareTo(b.duration));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flight Results',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade600,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.departure} → ${widget.arrival}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.date.day}/${widget.date.month}/${widget.date.year} • ${widget.passengers} ${widget.passengers == 1 ? 'Passenger' : 'Passengers'}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: selectedSort != 'price'
                            ? () => _sortFlights('price')
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedSort == 'price'
                              ? Colors.white
                              : Colors.blue.shade700,
                        ),
                        child: Text(
                          'By Price',
                          style: TextStyle(
                            color: selectedSort == 'price'
                                ? Colors.blue.shade600
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: selectedSort != 'duration'
                            ? () => _sortFlights('duration')
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedSort == 'duration'
                              ? Colors.white
                              : Colors.blue.shade700,
                        ),
                        child: Text(
                          'By Duration',
                          style: TextStyle(
                            color: selectedSort == 'duration'
                                ? Colors.blue.shade600
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                return ExpandableFlightCard(
                  flight: flights[index],
                  onBook: () {},
                  passengers: widget.passengers,
                  context: context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
