import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/permissions.dart';

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
