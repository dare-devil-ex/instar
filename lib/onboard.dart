import 'package:flutter/material.dart';
import 'package:instar/Pages/BoardingScreens/screen01.dart';
import 'package:instar/Pages/BoardingScreens/screen02.dart';
import 'package:instar/Pages/homepage.dart';
import 'package:instar/constrains/onboard.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  bool isLast = false;
  int currentPage = 0;

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (!await launchUrl(
        Uri.parse("tg://resolve?domain=lonemods"),
        mode: LaunchMode.externalApplication,
      )) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Telegram app is not installed')),
        );
      }
    } catch (e) {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLast = (index == 1);
                currentPage = index;
              });
            },
            controller: pageController,
            children: [Screen01(), Screen02()],
          ),

          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentPage > 0) {
                      launchURL("https://t.me/lonemods");
                    } else {
                      pageController.jumpToPage(1);
                    }
                  },
                  child: bottomContainer(isLast ? "Telegram" : "Skip"), // Chip
                ),

                SmoothPageIndicator(
                  controller: pageController,
                  effect: WormEffect(
                    type: WormType.thin,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                  count: 2,
                ),

                GestureDetector(
                  onTap: () {
                    if (currentPage > 0) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Homepage()),
                        (Route<dynamic> routes) => false,
                      );
                      context.read<InstarState>().onBoardingFinished();
                    } else {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: bottomContainer(isLast ? "Done" : "Next"), // Chip
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
