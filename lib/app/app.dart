import 'package:coffee_biz/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CoffeeBizApp extends StatefulWidget {
  const CoffeeBizApp({super.key});

  @override
  State<CoffeeBizApp> createState() => _CoffeeBizAppState();
}

class _CoffeeBizAppState extends State<CoffeeBizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}