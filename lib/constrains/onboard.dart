import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instar/models/colors.dart';
import 'package:lottie/lottie.dart';

Widget lottieModel(String location, String phrase) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: Lottie.asset(
            alignment: Alignment(0, 0),
            repeat: true,
            animate: true,
            location,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Text(
            phrase,
            style: TextStyle(
              fontFamily: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ).fontFamily,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget bottomContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.igPurple, AppColors.igPink, AppColors.igOrange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.afacad().fontFamily,
      ),
    ),
  );
}
