import 'package:flutter/material.dart';
import 'package:instar/models/colors.dart';
import 'package:instar/models/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InstarAppbar extends StatefulWidget {
  const InstarAppbar({super.key});

  @override
  State<InstarAppbar> createState() => _InstarAppbarState();
}

class _InstarAppbarState extends State<InstarAppbar> {
  late IconData defaultIcon = Icons.sunny;

  @override
  Widget build(BuildContext context) {
    final appState = context.read<InstarState>();

    return SliverAppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 9.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                appState.toggleTheme();
              });
            },
            child: Icon(appState.isDarkMode ? darkIcon : lightIcon),
          ),
        ),
      ],
      floating: true,
      stretch: true,
      backgroundColor: AppColors.darkBackground,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: Lottie.asset(
          alignment: Alignment(0, 0),
          repeat: true,
          animate: true,
          "assets/search.json",
        ),
      ),
    );
  }
}
