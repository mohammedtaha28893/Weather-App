import 'package:flutter/material.dart';
import 'pages/weatherPage.dart';

void main() {
  runApp(const weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weatherpage(),
    );
  }
}

//8:15