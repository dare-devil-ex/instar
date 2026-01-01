import 'package:flutter/material.dart';
import 'package:instar/Pages/aboutpage.dart';
import 'package:instar/Pages/homepage.dart';
import 'package:instar/Pages/settings.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/onboard.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final instarState = InstarState();
  await instarState.init();

  runApp(
    ChangeNotifierProvider.value(value: instarState, child: const Instar()),
  );
}

class Instar extends StatelessWidget {
  const Instar({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<InstarState>(context);

    if (!appState.initialized) {
      return Scaffold(
        body: Center(
          child: Lottie.asset(
            alignment: const Alignment(0, 0),
            repeat: true,
            animate: true,
            "assets/loader.json",
          ),
        ),
      );
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingScreen(),
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
