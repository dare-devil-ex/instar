import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

Future<String> saveThumbnail(Uint8List bytes, String fileName) async {
  final dir = await getTemporaryDirectory(); // temp folder
  final thumbFile = File(p.join(dir.path, fileName));
  await thumbFile.writeAsBytes(bytes);
  return thumbFile.path;
}

Future<bool> requestMediaPermission() async {
  if (Platform.isAndroid) {
    if (await Permission.videos.isGranted ||
        await Permission.photos.isGranted ||
        await Permission.storage.isGranted) {
      return true;
    }

    if (await Permission.videos.request().isGranted &&
        await Permission.photos.request().isGranted) {
      return true;
    }

    if (await Permission.storage.request().isGranted) {
      return true;
    }
  }

  return false;
}