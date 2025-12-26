import 'package:flutter/material.dart';
import 'package:instar/constrains/onboard.dart';

class Screen02 extends StatelessWidget {
  const Screen02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lottieModel("assets/telegram.json", "Follow me on Telegram"),
    );
  }
}
