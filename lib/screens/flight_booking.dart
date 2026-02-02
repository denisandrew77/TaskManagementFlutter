import 'package:flutter/material.dart';
import '../common/app_strings.dart';
import '../common/app_theme.dart';
import '../models/flight.dart';
import '../utils/validators.dart';

class FlightBookingScreen extends StatefulWidget {
  final Flight flight;
  final int passengers;

  const FlightBookingScreen({
    Key? key,
    required this.flight,
    required this.passengers,
  }) : super(key: key);

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> passengerDetails = [];
  int currentPassenger = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  String _selectedSeatPreference = 'Standard';

  @override
  void initState() {
    super.initState();
    // Initialize empty passenger details list
    for (int i = 0; i < widget.passengers; i++) {
      passengerDetails.add({
        'name': '',
        'email': '',
        'phone': '',
        'passport': '',
        'seatPreference': 'Standard',
      });
    }
  }

  void _savePassengerDetails() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        passengerDetails[currentPassenger] = {
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'passport': _passportController.text,
          'seatPreference': _selectedSeatPreference,
        };
      });

      if (currentPassenger < widget.passengers - 1) {
        // Go to next passenger
        currentPassenger++;
        _clearForm();
      } else {
        // All passengers filled, go to confirmation
        _showConfirmation();
      }
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passportController.clear();
    _selectedSeatPreference = 'Standard';
  }

  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.bookingConfirmation),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${AppStrings.flight}: ${widget.flight.flightNumber}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.flight.departureCity} → ${widget.flight.arrivalCity}',
              ),
              const SizedBox(height: 8),
              Text(
                '${AppStrings.total}: \$${(widget.flight.price * widget.passengers).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.successGreen,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '${AppStrings.passengers}:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...passengerDetails.asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${entry.key + 1}. ${entry.value['name']} - ${entry.value['seatPreference']}',
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${AppStrings.bookingSuccessful} ${AppStrings.confirmationSent} ${passengerDetails[0]['email']}',
                  ),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 3),
                ),
              );
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.successGreen,
            ),
            child: const Text(AppStrings.confirm),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.passengerInfo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppTheme.primaryBlueShade600,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.flight.airline} - ${widget.flight.flightNumber}',
                    style: const TextStyle(
                      color: AppTheme.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${AppStrings.passengerN} ${currentPassenger + 1} of ${widget.passengers}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: AppTheme.cardDecoration(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(AppStrings.fullName, style: AppTheme.labelStyle),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: Validators.validateName,
                    ),
                    const SizedBox(height: 16),
                    const Text(AppStrings.email, style: AppTheme.labelStyle),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter email address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.phoneNumber,
                      style: AppTheme.labelStyle,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: Validators.validatePhone,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.passportNumber,
                      style: AppTheme.labelStyle,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passportController,
                      decoration: InputDecoration(
                        hintText: 'Enter passport number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.assignment),
                      ),
                      validator: Validators.validatePassport,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.seatPreference,
                      style: AppTheme.labelStyle,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedSeatPreference,
                      items:
                          [
                                AppStrings.seatStandard,
                                AppStrings.seatWindow,
                                AppStrings.seatAisle,
                                'Exit Row',
                              ]
                              .map(
                                (seat) => DropdownMenuItem(
                                  value: seat,
                                  child: Text(seat),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSeatPreference = value ?? 'Standard';
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.event_seat),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _savePassengerDetails,
                        child: Text(
                          currentPassenger < widget.passengers - 1
                              ? AppStrings.next
                              : AppStrings.bookFlight,
                          style: AppTheme.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
