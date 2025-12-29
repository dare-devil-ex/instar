import 'package:flutter/material.dart';
import 'package:instar/models/colors.dart';
import 'package:instar/models/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.read<InstarState>();

    return Scaffold(
      backgroundColor: themeState.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      body: const Center(child: Text('Settings Page')),
    );
  }
}
