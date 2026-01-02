import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/models/download_items_model.dart';
import 'package:instar/utils/permissions.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<PostItem> savedposts = [];

  @override
  void initState() {
    loadPosts();
    super.initState();
  }

  Future<void> loadPosts() async {
    final result = await loadInstarPosts();
    setState(() {
      savedposts = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorState = context.watch<InstarState>();

    return Container(
      child: savedposts.isEmpty
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
                  'No posts available',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: savedposts.length,
              itemBuilder: (context, index) {
                // post
                final post = savedposts[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  height: 120,
                  decoration: BoxDecoration(
                    color: colorState.isDarkMode
                        ? AppColors.darkCardBackground
                        : AppColors.lightCardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 14),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(post.thumbnailPath),
                            width: 100,
                            height: 100,
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
                                post.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: colorState.isDarkMode
                                      ? AppColors.darkCardTitle
                                      : AppColors.lightCardTitle,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Size: ${post.size} MB',
                              style: TextStyle(
                                color: colorState.isDarkMode
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Date: 2024-06-${index + 1}',
                              style: TextStyle(
                                color: colorState.isDarkMode
                                    ? AppColors.darkCardSubtitle
                                    : AppColors.lightCardSubtitle,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      size: 21,
                                      color: AppColors.shareIcon,
                                    ),
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
                );
              },
            ),
    );
  }
}
