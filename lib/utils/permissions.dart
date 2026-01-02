import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart' as p;

import '../models/download_items_model.dart';

Future<bool> requestVideoPermission() async {
  if (Platform.isAndroid) {
    if (await Permission.videos.isGranted ||
        await Permission.storage.isGranted) {
      return true;
    }

    if (await Permission.videos.request().isGranted) {
      return true;
    }

    if (await Permission.storage.request().isGranted) {
      return true;
    }
  }

  return false;
}

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

    if (thumbPath == null) continue;

    videos.add(
      VideoItem(
        file: file,
        name: p.basename(file.path),
        size: await file.length(),
        thumbnailPath: thumbPath,
      ),
    );
  }

  return videos;
}

Future<List<PostItem>> loadInstarPosts() async {
  final dir = Directory('/storage/emulated/0/Instar/Posts');

  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final postFiles = dir.listSync(recursive: true).whereType<File>().where((
    file,
  ) {
    final ext = file.path.toLowerCase();
    return ext.endsWith('.jpg') ||
        ext.endsWith('.jpeg') ||
        ext.endsWith('.png');
  }).toList();

  List<PostItem> posts = [];

  for (final file in postFiles) {
    final thumbPath = file.path;

    posts.add(
      PostItem(
        file: file,
        name: p.basename(file.path),
        size: await file.length(),
        thumbnailPath: thumbPath,
      ),
    );
  }

  return posts;
}

Future<bool> checkGalleryPermission() async {
  requestVideoPermission();
  if (Platform.isAndroid) {
    return await Permission.videos.isGranted ||
        await Permission.storage.isGranted;
  }
  return false;
}
