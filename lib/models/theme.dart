import 'package:flutter/material.dart';
import 'colors.dart';

class InstarState extends ChangeNotifier {
  bool isDarkMode = false;
  bool hasLoaded = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void onBoardingFinished() {
    hasLoaded = true;
    notifyListeners();
  }
}

final lightIcon = Icons.light_mode_sharp;
final darkIcon = Icons.nightlight_round_sharp;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.igPurple,
  scaffoldBackgroundColor: AppColors.lightBackground,
  cardColor: AppColors.lightSurface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
    bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
  ),
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.downloadGreen),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.igPurple,
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkSurface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
    bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
  ),
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.downloadGreen),
);
