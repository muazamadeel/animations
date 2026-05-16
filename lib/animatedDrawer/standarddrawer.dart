import 'package:flutter/material.dart';

class StandardDrawerScreen extends StatelessWidget {
  const StandardDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── Built-in Drawer ──
      drawer: Drawer(
        child: Container(
          color: Color(0xFF1A237E),
          child: Column(
            children: [
              // ── Header ──
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF283593)),
                accountName: Text(
                  'Standard Drawer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                accountEmail: Text('Animated Drawer'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),

              // ── Menu Items ──
              _DrawerItem(
                icon: Icons.home,
                title: 'Home',
                onTap: () => Navigator.pop(context),
              ),
              _DrawerItem(
                icon: Icons.person_outline,
                title: 'Profile',
                onTap: () => Navigator.pop(context),
              ),
              _DrawerItem(
                icon: Icons.chat_bubble_outline,
                title: 'Messages',
                onTap: () => Navigator.pop(context),
              ),
              _DrawerItem(
                icon: Icons.bookmark_border,
                title: 'Saved',
                onTap: () => Navigator.pop(context),
              ),
              _DrawerItem(
                icon: Icons.favorite_border,
                title: 'Favorites',
                onTap: () => Navigator.pop(context),
              ),
              _DrawerItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () => Navigator.pop(context),
              ),

              Spacer(),
              Divider(color: Colors.white24),

              // ── Logout ──
              _DrawerItem(
                icon: Icons.logout,
                title: 'Log out',
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ── AppBar ──
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        title: Text('Standard Drawer', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // ── Body ──
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 80, color: Colors.indigo.shade100),
            SizedBox(height: 16),
            Text(
              'Standard Drawer!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ── Drawer Item Helper ──
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: TextStyle(color: Colors.white70)),
      onTap: onTap,
      hoverColor: Colors.white10,
    );
  }
}
