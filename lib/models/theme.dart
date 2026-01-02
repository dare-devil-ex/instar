import 'package:flutter/material.dart';
import 'package:instar/utils/permissions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';

class InstarState extends ChangeNotifier {
  bool isDarkMode = false;
  bool hasLoaded = false;
  bool initialized = false;
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    hasLoaded = prefs.getBool('hasLoaded') ?? false;
    initialized = true;
    checkGalleryPermission();
    notifyListeners();
  }

  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  void packageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    notifyListeners();
  }

  Future<void> onBoardingFinished() async {
    hasLoaded = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasLoaded', hasLoaded);
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
