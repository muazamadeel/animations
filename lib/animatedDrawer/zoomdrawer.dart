import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerScreen extends StatelessWidget {
  const ZoomDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 50.0,
      showShadow: true,
      angle: -10.0,
      menuBackgroundColor: Colors.blueGrey,
      shadowLayer1Color: Colors.blueGrey.shade300,
      shadowLayer2Color: Colors.blueGrey.shade200,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuScreen: _MenuScreen(),
      mainScreen: _MainScreen(),
    );
  }
}

// ── Menu Screen ──
class _MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.only(top: 65, left: 20, bottom: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──
          Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              SizedBox(width: 08),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'zoom drawer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ── Menu Items ──
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MenuItem(icon: Icons.home, text: 'Home', isSelected: true),
              SizedBox(height: 20),
              _MenuItem(icon: Icons.person_outline, text: 'Profile'),
              SizedBox(height: 20),
              _MenuItem(icon: Icons.chat_bubble_outline, text: 'Messages'),
              SizedBox(height: 20),
              _MenuItem(icon: Icons.bookmark_border, text: 'Saved'),
              SizedBox(height: 20),
              _MenuItem(icon: Icons.favorite_border, text: 'Favorites'),
              SizedBox(height: 20),
              _MenuItem(icon: Icons.settings, text: 'Settings'),
            ],
          ),

          // ── Logout ──
          Row(
            children: [
              Icon(Icons.logout, color: Colors.white54),
              SizedBox(width: 5),
              Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Menu Item Helper ──
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const _MenuItem({
    required this.icon,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: isSelected ? Colors.white : Colors.white60, size: 22),
        SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white60,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ),
        if (isSelected) ...[
          SizedBox(width: 8),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }
}

// ── Main Screen ──
class _MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          // ── Top Bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => ZoomDrawer.of(context)!.toggle(),
                  child: Icon(Icons.menu, color: Colors.black87, size: 28),
                ),
                Text(
                  'Zoom Drawer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(Icons.notifications_outlined, color: Colors.black87),
              ],
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.menu_open,
                  size: 80,
                  color: Colors.blueGrey.shade200,
                ),
                SizedBox(height: 10),
                Text(
                  'Zoom Drawer!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
