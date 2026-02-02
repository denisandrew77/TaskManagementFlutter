import 'package:flutter/material.dart';
import '../common/app_strings.dart';
import '../common/app_theme.dart';
import '../models/flight.dart';
import '../utils/formatters.dart';
import '../screens/flight_booking.dart' as booking_screen;

class ExpandableFlightCard extends StatefulWidget {
  final Flight flight;
  final VoidCallback onBook;
  final int passengers;
  final BuildContext context;

  const ExpandableFlightCard({
    Key? key,
    required this.flight,
    required this.onBook,
    required this.passengers,
    required this.context,
  }) : super(key: key);

  @override
  State<ExpandableFlightCard> createState() => _ExpandableFlightCardState();
}

class _ExpandableFlightCardState extends State<ExpandableFlightCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: AppTheme.cardDecoration(),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.flight.airline,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlueShade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.flight.flightNumber,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.primaryBlueShade900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.flight.departureTime,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.flight.departureCity,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.flight_takeoff,
                            color: AppTheme.primaryBlueShade600,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.flight.duration,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.flight.arrivalTime,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.flight.arrivalCity,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Formatters.formatPrice(widget.flight.price),
                        style: AppTheme.priceStyle,
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: AppTheme.primaryBlueShade600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.grey50,
                border: Border(top: BorderSide(color: AppTheme.grey200)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.flightDetails,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.flight,
                    label: AppStrings.aircraft,
                    value: widget.flight.aircraftType,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    icon: Icons.event_seat,
                    label: AppStrings.seatPitch,
                    value: widget.flight.seatPitch,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    icon: Icons.restaurant,
                    label: AppStrings.mealService,
                    value: widget.flight.mealProvided
                        ? widget.flight.mealType
                        : AppStrings.notProvided,
                    valueColor: widget.flight.mealProvided
                        ? Colors.green
                        : Colors.orange,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    icon: Icons.chair,
                    label: AppStrings.availableSeats,
                    value:
                        '${widget.flight.seats} ${AppStrings.seatsRemaining}',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          widget.context,
                          MaterialPageRoute(
                            builder: (context) =>
                                booking_screen.FlightBookingScreen(
                                  flight: widget.flight,
                                  passengers: widget.passengers,
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.successGreen,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        AppStrings.bookNow,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppTheme.primaryBlueShade600),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: valueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
