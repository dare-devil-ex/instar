import 'package:flutter/material.dart';
import 'package:instar/constrains/home.dart';
import 'package:instar/models/theme.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<InstarState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appState.isDarkMode
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        iconTheme: IconThemeData(
          color: appState.isDarkMode
              ? AppColors.lightBackground
              : AppColors.lightTextSecondary,
        ),
      ),
      drawer: InstarDrawer(),
      backgroundColor: appState.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Instar\nVersion: ${appState.version}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appState.isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
