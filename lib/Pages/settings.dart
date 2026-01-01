import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme.dart';
import '../utils/colors.dart';

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
