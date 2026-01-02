import 'dart:io';

class VideoItem {
  final File file;
  final String name;
  final int size;
  final String thumbnailPath;

  VideoItem({
    required this.file,
    required this.name,
    required this.size,
    required this.thumbnailPath,
  });
}

class PostItem {
  final File file;
  final String name;
  final int size;
  final String thumbnailPath;

  PostItem({
    required this.file,
    required this.name,
    required this.size,
    required this.thumbnailPath,
  });
}
