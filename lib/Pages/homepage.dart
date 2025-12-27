import 'package:flutter/material.dart';
import 'package:instar/constrains/home.dart';
import 'package:instar/constrains/instarappbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

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

          // Files
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: List.generate(
                  10,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
