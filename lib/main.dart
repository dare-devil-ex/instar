import 'package:flutter/material.dart';
import 'package:instar/Pages/aboutpage.dart';
import 'package:instar/Pages/homepage.dart';
import 'package:instar/Pages/settings.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/onboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => InstarState(), child: const Instar()),
  );
}

class Instar extends StatelessWidget {
  const Instar({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<InstarState>(context);

    return MaterialApp(
      routes: {
        '/home': (context) => const Homepage(),
        '/settings': (context) => const Settings(),
        '/about': (context) => const Aboutpage(),
      },
      debugShowCheckedModeBanner: false,
      theme: appState.isDarkMode ? darkTheme : lightTheme,
      themeMode: ThemeMode.system,
      home: appState.hasLoaded ? const Homepage() : const OnBoardingScreen(),
    );
  }
}
