import 'package:flutter/material.dart';
import 'common/app_strings.dart';
import 'common/app_theme.dart';
import 'screens/flight_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      home: const FlightSearchScreen(),
    );
  }
}
