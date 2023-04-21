import 'package:flutter/material.dart';
import 'package:poke/app_theme.dart';
import 'package:poke/di/locator.dart';
import 'package:poke/home/screen/home_screen.dart';

void main() async {
  setupDI();
  await locator.allReady();
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke',
      theme: PokeAppTheme.appTheme,
      darkTheme: PokeAppTheme.appTheme,
      home: const HomeScreen(),
    );
  }
}