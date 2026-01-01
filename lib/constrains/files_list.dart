import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/models/video_item.dart';
import 'package:instar/utils/permissions.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  List<VideoItem> videos = [];

  @override
  void initState() {
    loadVideos();
    super.initState();
  }

  Future<void> loadVideos() async {
    final result = await loadInstarVideos();
    setState(() {
      videos = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorState = context.read<InstarState>();

    return SliverToBoxAdapter(
      child: videos.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorState.isDarkMode
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'No videos available',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                children: List.generate(
                  videos.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 14),
                      child: Center(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(videos[index].thumbnailPath),
                                width: 100,
                                height: 100,
                                alignment: AlignmentGeometry.center,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    videos[index].name,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text('Size: ${videos[index].size} MB'),
                                SizedBox(height: 4),
                                Text('Date: 2024-06-${index + 1}'),
                              ],
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.share, size: 21),
                                        SizedBox(height: 8),
                                        Text('Share'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
