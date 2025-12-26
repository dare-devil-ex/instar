import 'package:flutter/material.dart';
import 'package:instar/constrains/onboard.dart';

class Screen01 extends StatelessWidget {
  const Screen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lottieModel("assets/instagram.json", "Welcome to Instar"),
    );
  }
}
