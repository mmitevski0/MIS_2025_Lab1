import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lab 1",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/exam-details': (context) => const DetailsPage(),
      },
    );
  }
}
