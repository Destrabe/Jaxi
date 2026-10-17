import 'package:flutter/material.dart';

import 'screens/hola_screen.dart';

void main() {
  runApp(const JaxiApp());
}

class JaxiApp extends StatelessWidget {
  const JaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HolaScreen(),
    );
  }
}
