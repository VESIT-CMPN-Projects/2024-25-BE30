import 'package:flutter/material.dart';
import 'landing_page.dart';

void main() {
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicinal Plants App',
      theme: ThemeData(
        primaryColor: const Color(0xFF16666B), // Theme color
      ),
      home: LandingPage(),
    );
  }
}
