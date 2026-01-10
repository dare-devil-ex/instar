import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestMediaPermission() async {
  if (Platform.isAndroid) {
    if (await Permission.videos.isGranted ||
        await Permission.photos.isGranted ||
        await Permission.storage.isGranted) {
      return true;
    }

    if (await Permission.videos.request().isGranted &&
        await Permission.photos.request().isGranted &&
        await Permission.storage.request().isGranted) {
      return true;
    }
  }

  return false;
}
