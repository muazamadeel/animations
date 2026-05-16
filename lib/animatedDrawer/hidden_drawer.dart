import 'package:animations/animationscreens/animatedalign.dart';
import 'package:animations/animationscreens/animatedbuilder.dart';
import 'package:animations/animationscreens/animatedcontainer.dart';
import 'package:animations/animationscreens/animatedcrossfade.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Drawer',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
        ),
        Drawer(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'AnimatedAlign',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
        ),
        Animatedalign(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'AnimatedBuilder',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
        ),
        Animatedbuilder(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'AnimatedContainer',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
        ),
        Animatedcontainer(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'AnimatedCrossFade',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
        ),
        Animatedcrossfade(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
      enableScaleAnimation: true,
      enableCornerAnimation: true,
    );
  }
}
