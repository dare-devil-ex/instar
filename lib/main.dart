import 'package:flutter/material.dart';
import 'package:instar/Pages/homepage.dart';
import 'package:instar/Pages/settings.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/onboard.dart';

void main() {
  runApp(const Instar());
}

class Instar extends StatelessWidget {
  const Instar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const Homepage(),
        '/settings': (context) => const Settings(),
      },
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: OnBoardingScreen(),
    );
  }
}
