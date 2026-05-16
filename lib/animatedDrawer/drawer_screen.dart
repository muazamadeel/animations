import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 60, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ── Header ──
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  'Animated Drawer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(icon: Icons.settings, text: 'Settings'),
                SizedBox(height: 20),
                DrawerItem(icon: Icons.person_outline, text: 'Profile'),
                SizedBox(height: 20),
                DrawerItem(icon: Icons.chat_bubble_outline, text: 'Messages'),
                SizedBox(height: 20),
                DrawerItem(icon: Icons.bookmark_border, text: 'Saved'),
                SizedBox(height: 20),
                DrawerItem(icon: Icons.favorite_border, text: 'Favorites'),
                SizedBox(height: 20),
                DrawerItem(icon: Icons.lightbulb_outline, text: 'Hint'),
              ],
            ),

            // ── Logout ──
            Row(
              children: [
                Icon(Icons.logout, color: Colors.white54),
                SizedBox(width: 10),
                Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white54,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const DrawerItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
