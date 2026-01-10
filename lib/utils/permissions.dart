import 'package:instar/utils/functions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart' as p;

import '../models/download_items_model.dart';

Future<List<VideoItem>> loadInstarVideos() async {
  final dir = Directory('/storage/emulated/0/Instar');

  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final tempDir = await getTemporaryDirectory();

  final videoFiles = dir.listSync(recursive: true).whereType<File>().where((
    file,
  ) {
    final ext = file.path.toLowerCase();
    return ext.endsWith('.mp4') || ext.endsWith('.mkv') || ext.endsWith('.mov');
  }).toList();

  List<VideoItem> videos = [];

  for (final file in videoFiles) {
    final thumbPath = await VideoThumbnail.thumbnailFile(
      video: file.path,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 400,
      quality: 99,
    );

    final stat = await file.stat();

    if (thumbPath == null) continue;

    videos.add(
      VideoItem(
        file: file,
        name: p.basename(file.path),
        size: stat.size,
        thumbnailPath: thumbPath,
      ),
    );
  }

  return videos;
}

Future<List<PostItem>> loadInstarPosts() async {
  final dir = Directory('/storage/emulated/0/Instar');

  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final postFiles = dir.listSync(recursive: true).whereType<File>().where((
    file,
  ) {
    final ext = file.path.toLowerCase();
    return ext.endsWith('.jpg') || ext.endsWith('.png');
  }).toList();
  List<PostItem> posts = [];

  for (final file in postFiles) {
    final stat = await file.stat();

    posts.add(
      PostItem(
        file: file,
        name: p.basename(file.path),
        size: stat.size,
        thumbnailPath: file.path,
      ),
    );
  }

  return posts;
}

Future<bool> checkGalleryPermission() async {
  requestMediaPermission();
  if (Platform.isAndroid) {
    return await Permission.videos.isGranted ||
        await Permission.photos.isGranted ||
        await Permission.storage.isGranted;
  }
  return false;
}
