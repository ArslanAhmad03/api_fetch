
import 'package:dailywidget/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyanAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        ),
      ),
      home: const HomeView(),
    );
  }
}

