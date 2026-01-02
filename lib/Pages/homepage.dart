import 'package:flutter/material.dart';
import 'package:instar/constrains/home.dart';
import 'package:instar/constrains/instarappbar.dart';
import 'package:instar/constrains/reels.dart';
import 'package:instar/models/theme.dart';
import 'package:instar/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constrains/posts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    context.read<InstarState>().packageInfo();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InstarDrawer(),
      body: CustomScrollView(
        slivers: [
          // App Bar
          InstarAppbar(),

          // Search bar
          searchBar,

          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.downloadGreen,
                        dotHeight: 5,
                        spacing: 3,
                        dotWidth: 5,
                      ),
                      count: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Files
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView(
                physics: ClampingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [Reels(), Posts()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
