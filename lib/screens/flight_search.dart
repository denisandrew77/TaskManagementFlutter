import 'package:flutter/material.dart';
import '../common/app_strings.dart';
import '../common/app_theme.dart';
import '../utils/formatters.dart';
import 'flight_list.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String? selectedDeparture;
  String? selectedArrival;
  DateTime? selectedDate;
  int passengers = 1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _performSearch() {
    if (selectedDeparture == null ||
        selectedArrival == null ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.pleaseFillAllFields),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    if (selectedDeparture == selectedArrival) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.citiesMustBeDifferent),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightListScreen(
          departure: selectedDeparture!,
          arrival: selectedArrival!,
          date: selectedDate!,
          passengers: passengers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: AppTheme.headerGradient(),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: _SearchHeader(),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: AppTheme.cardDecoration(radius: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDepartureDropdown(),
                  const SizedBox(height: 20),
                  _buildArrivalDropdown(),
                  const SizedBox(height: 20),
                  _buildDatePicker(context),
                  const SizedBox(height: 20),
                  _buildPassengerCounter(),
                  const SizedBox(height: 24),
                  _buildSearchButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartureDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppStrings.departureCity, style: AppTheme.labelStyle),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: selectedDeparture,
          hint: const Text(AppStrings.selectDepartureCity),
          isExpanded: true,
          onChanged: (String? value) {
            setState(() {
              selectedDeparture = value;
            });
          },
          items: AppStrings.cities.map<DropdownMenuItem<String>>((
            String value,
          ) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildArrivalDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppStrings.arrivalCity, style: AppTheme.labelStyle),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: selectedArrival,
          hint: const Text(AppStrings.selectArrivalCity),
          isExpanded: true,
          onChanged: (String? value) {
            setState(() {
              selectedArrival = value;
            });
          },
          items: AppStrings.cities.map<DropdownMenuItem<String>>((
            String value,
          ) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppStrings.departureDate, style: AppTheme.labelStyle),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.grey300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? AppStrings.selectADate
                      : Formatters.formatDate(selectedDate!),
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedDate == null
                        ? AppTheme.grey500
                        : Colors.black,
                  ),
                ),
                Icon(Icons.calendar_today, color: AppTheme.primaryBlueShade600),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassengerCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppStrings.numberOfPassengers, style: AppTheme.labelStyle),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              onPressed: passengers > 1
                  ? () {
                      setState(() {
                        passengers--;
                      });
                    }
                  : null,
              icon: const Icon(Icons.remove_circle_outline),
              color: AppTheme.primaryBlueShade600,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.grey300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '$passengers',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: passengers < 9
                  ? () {
                      setState(() {
                        passengers++;
                      });
                    }
                  : null,
              icon: const Icon(Icons.add_circle_outline),
              color: AppTheme.primaryBlueShade600,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _performSearch,
        child: const Text(
          AppStrings.searchFlights,
          style: AppTheme.buttonTextStyle,
        ),
      ),
    );
  }
}

/// Header widget for the search screen
class _SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.flight, color: AppTheme.white, size: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.findYourFlight,
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppStrings.searchSubtitle,
                style: TextStyle(
                  color: AppTheme.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
