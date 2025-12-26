import 'package:flutter/material.dart';
import 'package:instar/models/colors.dart';
import 'package:lottie/lottie.dart';

var appBar = SliverAppBar(
  elevation: 0,
  leading: Icon(Icons.menu),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 9.0),
      child: Icon(Icons.settings),
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

var searchBar = SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.download),
        hintText: "Paste url here",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  ),
);
