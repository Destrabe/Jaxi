import 'package:flutter/material.dart';

class HolaScreen extends StatelessWidget {
  const HolaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF150F3A),
      body: Center(
        child: Text(
          'Hola',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
