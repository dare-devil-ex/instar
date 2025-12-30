import 'package:flutter/material.dart';
import 'package:instar/constrains/home.dart';
import 'package:instar/constrains/instarappbar.dart';
import 'package:instar/constrains/files_list.dart';
import 'package:instar/models/theme.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<InstarState>().packageInfo();
    super.initState();
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

          // Files
          Files(),
        ],
      ),
    );
  }
}
