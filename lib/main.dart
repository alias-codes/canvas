import 'package:flutter/material.dart';
import './pages/circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brain Train',
      theme: ThemeData.light(),
      home: const Circle(),
    );
  }
}
