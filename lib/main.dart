import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const FristcoCompanyApp());
}

class FristcoCompanyApp extends StatelessWidget {
  const FristcoCompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fristco Company',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}