import 'package:flutter/material.dart';

class HolaScreen extends StatelessWidget {
  const HolaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      body: Center(
        child: Text(
          'Hola',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 9, 255, 0),
          ),
        ),
      ),
    );
  }
}
