import 'package:flutter/material.dart';
import '../common/app_strings.dart';
import '../common/app_theme.dart';
import '../data/flight_data.dart';
import '../models/flight.dart';
import '../utils/formatters.dart';
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
    flights = FlightData.generateFlights(widget.departure, widget.arrival);
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
          AppStrings.flightResults,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppTheme.primaryBlueShade600,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Formatters.formatRoute(widget.departure, widget.arrival),
                  style: const TextStyle(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${Formatters.formatDate(widget.date)} • ${Formatters.formatPassengerCount(widget.passengers)}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
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
                              ? AppTheme.white
                              : AppTheme.primaryBlueShade700,
                        ),
                        child: Text(
                          AppStrings.byPrice,
                          style: TextStyle(
                            color: selectedSort == 'price'
                                ? AppTheme.primaryBlueShade600
                                : AppTheme.white,
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
                              ? AppTheme.white
                              : AppTheme.primaryBlueShade700,
                        ),
                        child: Text(
                          AppStrings.byDuration,
                          style: TextStyle(
                            color: selectedSort == 'duration'
                                ? AppTheme.primaryBlueShade600
                                : AppTheme.white,
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
