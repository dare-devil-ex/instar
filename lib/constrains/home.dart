import 'package:flutter/material.dart';
import 'package:instar/models/colors.dart';

class InstarDrawer extends StatelessWidget {
  const InstarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  "images/logo.png",
                ),
                Text(
                  'Instar',
                  style: TextStyle(
                    color: AppColors.darkTextPrimary,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          title(Icon(Icons.home), 'Home'),
          title(Icon(Icons.settings), 'Settings'),
          Divider(indent: 10, endIndent: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            child: title(Icon(Icons.info), 'About'),
          ),
        ],
      ),
    );
  }
}


var searchBar = SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: AppColors.darkTextSecondary,
          overflow: TextOverflow.fade,
        ),

        suffixIcon: GestureDetector(
          onTap: () {
            // Paste action
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.paste_rounded,
              color: AppColors.darkTextSecondary,
              semanticLabel: "Paste",
            ),
          ),
        ),
        hintText: "Paste url here",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  ),
);

Widget title(Icon icon, String text) {
  return ListTile(leading: icon, title: Text(text));
}
