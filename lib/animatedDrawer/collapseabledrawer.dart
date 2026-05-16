import 'package:flutter/material.dart';

class CollapsibleDrawerScreen extends StatefulWidget {
  const CollapsibleDrawerScreen({super.key});
  @override
  State<CollapsibleDrawerScreen> createState() =>
      _CollapsibleDrawerScreenState();
}

class _CollapsibleDrawerScreenState extends State<CollapsibleDrawerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool isExpanded = false;

  final double collapsedWidth = 70;
  final double expandedWidth = 220;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Home'},
    {'icon': Icons.person_outline, 'title': 'Profile'},
    {'icon': Icons.chat_bubble_outline, 'title': 'Message'},
    {'icon': Icons.bookmark_border, 'title': 'Saved'},
    {'icon': Icons.favorite_border, 'title': 'Favorites'},
    {'icon': Icons.settings, 'title': 'Settings'},
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _widthAnimation = Tween<double>(
      begin: collapsedWidth,
      end: expandedWidth,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    if (isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          // ── 1. Collapsible Sidebar ──
          AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1A237E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),

                    // ── Toggle Button ──
                    GestureDetector(
                      onTap: toggleDrawer,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_arrow,
                          progress: _controller,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // ── Profile ──
                    if (_widthAnimation.value > 120) ...[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: ((_widthAnimation.value - 120) / 100).clamp(
                          0.0,
                          1.0,
                        ),
                        child: Text(
                          'CollapseibleDrawer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ] else ...[
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],

                    // ── Menu Items ──
                    ...menuItems.asMap().entries.map((entry) {
                      int idx = entry.key;
                      Map item = entry.value;
                      bool isSelected = selectedIndex == idx;

                      return GestureDetector(
                        onTap: () => setState(() => selectedIndex = idx),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white.withOpacity(0.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['icon'],
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white60,
                                size: 22,
                              ),
                              // Text sirf expand hone pe aaye
                              if (_widthAnimation.value > 120)
                                Expanded(
                                  child: Opacity(
                                    opacity:
                                        ((_widthAnimation.value - 120) / 100)
                                            .clamp(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(
                                        item['title'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white60,
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),

                    Spacer(),

                    // ── Logout ──
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.white54, size: 22),
                            if (_widthAnimation.value > 120)
                              Opacity(
                                opacity: ((_widthAnimation.value - 120) / 100)
                                    .clamp(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Log out',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // ── 2. Main Content ──
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuItems[selectedIndex]['title'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          menuItems[selectedIndex]['icon'],
                          size: 80,
                          color: Colors.indigo.shade100,
                        ),
                        SizedBox(height: 16),
                        Text(
                          menuItems[selectedIndex]['title'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
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
