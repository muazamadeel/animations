// import 'package:animations/animatedDrawer/drawer_screen.dart';
// import 'package:animations/animatedDrawer/hidden_drawer.dart';
// import 'package:animations/animationscreens/animatedalign.dart';
// import 'package:animations/animationscreens/animatedbuilder.dart';
// import 'package:animations/animationscreens/animatedcontainer.dart';
// import 'package:animations/animationscreens/animatedcrossfade.dart';
// import 'package:animations/animationscreens/animateddefaulttext.dart';
// import 'package:animations/animationscreens/animatedlist.dart';
// import 'package:animations/animationscreens/animatedopacity.dart';
// import 'package:animations/animationscreens/animatedpadding.dart';
// import 'package:animations/animationscreens/animatedphysicalmodel.dart';
// import 'package:animations/animationscreens/animatedpositioned.dart';
// import 'package:animations/animationscreens/animatedsize.dart';
// import 'package:animations/animationscreens/animatedswitcher.dart';
// import 'package:animations/animationscreens/fadetransition.dart';
// import 'package:animations/animationscreens/positionedtransition.dart';
// import 'package:animations/animationscreens/rotationtransition.dart';
// import 'package:animations/animationscreens/scaletransition.dart';
// import 'package:animations/animationscreens/sizetransition.dart';
// import 'package:animations/animationscreens/slidetransition.dart';
// import 'package:animations/animationscreens/tweenanimationbuilder.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   double xOffset = 0;
//   double yOffset = 0;
//   bool isDrawerOpen = false;

//   void openDrawer() {
//     setState(() {
//       xOffset = 260;
//       yOffset = 80;
//       isDrawerOpen = true;
//     });
//   }

//   void closeDrawer() {
//     setState(() {
//       xOffset = 0;
//       yOffset = 0;
//       isDrawerOpen = false;
//     });
//   }

//   final List<String> animations = [
//     "AnimatedAlign",
//     "AnimatedBuilder",
//     "AnimatedContainer",
//     "AnimatedCrossFade",
//     "AnimatedDefaultTextStyle",
//     "AnimatedList",
//     "AnimatedOpacity",
//     "AnimatedPadding",
//     "AnimatedPhysicalModel",
//     "AnimatedPositioned",
//     "AnimatedSize",
//     "AnimatedSwitcher",
//     "Fade Transition",
//     "PositionedTransition",
//     "Rotation Transition",
//     "Scale Transition",
//     "Size Transition",
//     "Slide Transition",
//     "TweenAnimationBuilder",
//     "Beautiful Drawer",
//     "Hidden Drawer",
//   ];

//   late final List<Widget Function()> screens = [
//     () => Animatedalign(),
//     () => Animatedbuilder(),
//     () => Animatedcontainer(),
//     () => Animatedcrossfade(),
//     () => Animateddefaulttext(),
//     () => Animatedlist(),
//     () => Animatedopacity(),
//     () => Animatedpadding(),
//     () => SampleAnimatedPhysicalModel(),
//     () => SampleAnimatedPositioned(),
//     () => SampleAnimatedSize(),
//     () => SampleAnimatedSwitcher(),
//     () => SampleFadeTransition(),
//     () => SamplePositionedTransition(),
//     () => SampleRotationTransition(),
//     () => SampleScaleTransition(),
//     () => SampleSizeTransition(),
//     () => SampleSlideTransition(),
//     () => SampleTweenAnimationBuilder(),
//     () => BeautifulDrawerScreen(),
//     () => HiddenDrawer(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: Stack(
//         children: [
//           DrawerScreen(),
//           AnimatedContainer(
//             duration: Duration(milliseconds: 250),
//             transform: Matrix4.translationValues(xOffset, yOffset, 0)
//               ..scale(isDrawerOpen ? 0.85 : 1.0)
//               ..rotateZ(isDrawerOpen ? -0.05 : 0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: 50),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: isDrawerOpen ? closeDrawer : openDrawer,
//                         child: Icon(
//                           isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Text(
//                         "Animations",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 10),

//                 // ── Grid Cards ──
//                 Expanded(
//                   child: GridView.builder(
//                     padding: EdgeInsets.all(10),
//                     itemCount: animations.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           if (isDrawerOpen) {
//                             closeDrawer();
//                           } else {
//                             openDrawer();
//                           }
//                         },
//                         child: Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Text(
//                                 animations[index],
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── DRAWER SCREEN ──────────────────────────────────
// class BeautifulDrawerScreen extends StatefulWidget {
//   const BeautifulDrawerScreen({super.key});
//   @override
//   State<BeautifulDrawerScreen> createState() => _BeautifulDrawerScreenState();
// }

// class _BeautifulDrawerScreenState extends State<BeautifulDrawerScreen> {
//   double xOffset = 0;
//   double yOffset = 0;
//   bool isDrawerOpen = false;

//   void openDrawer() {
//     setState(() {
//       xOffset = 290;
//       yOffset = 80;
//       isDrawerOpen = true;
//     });
//   }

//   void closeDrawer() {
//     setState(() {
//       xOffset = 0;
//       yOffset = 0;
//       isDrawerOpen = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: Stack(
//         children: [
//           DrawerScreen(),
//           AnimatedContainer(
//             duration: Duration(milliseconds: 250),
//             transform: Matrix4.translationValues(xOffset, yOffset, 0)
//               ..scale(isDrawerOpen ? 0.85 : 1.0)
//               ..rotateZ(isDrawerOpen ? -0.1 : 0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 50),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: isDrawerOpen ? closeDrawer : openDrawer,
//                           child: Icon(
//                             isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Text(
//                           "Beautiful Drawer",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 40),
//                   Center(
//                     child: Text(
//                       'Beautiful Animated Drawer\nMenu icon tap karo!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 18, color: Colors.black54),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:animations/animatedDrawer/collapseabledrawer.dart';
import 'package:animations/animatedDrawer/drawer_screen.dart';
import 'package:animations/animatedDrawer/hidden_drawer.dart';
import 'package:animations/animatedDrawer/standarddrawer.dart';
import 'package:animations/animatedDrawer/zoomdrawer.dart';
import 'package:animations/animationscreens/animatedalign.dart';
import 'package:animations/animationscreens/animatedbuilder.dart';
import 'package:animations/animationscreens/animatedcontainer.dart';
import 'package:animations/animationscreens/animatedcrossfade.dart';
import 'package:animations/animationscreens/animateddefaulttext.dart';
import 'package:animations/animationscreens/animatedlist.dart';
import 'package:animations/animationscreens/animatedopacity.dart';
import 'package:animations/animationscreens/animatedpadding.dart';
import 'package:animations/animationscreens/animatedphysicalmodel.dart';
import 'package:animations/animationscreens/animatedpositioned.dart';
import 'package:animations/animationscreens/animatedsize.dart';
import 'package:animations/animationscreens/animatedswitcher.dart';
import 'package:animations/animationscreens/fadetransition.dart';
import 'package:animations/animationscreens/positionedtransition.dart';
import 'package:animations/animationscreens/rotationtransition.dart';
import 'package:animations/animationscreens/scaletransition.dart';
import 'package:animations/animationscreens/sizetransition.dart';
import 'package:animations/animationscreens/slidetransition.dart';
import 'package:animations/animationscreens/tweenanimationbuilder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  void openDrawer() {
    setState(() {
      xOffset = 260;
      yOffset = 80;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      isDrawerOpen = false;
    });
  }

  final List<String> animations = [
    "AnimatedAlign",
    "AnimatedBuilder",
    "AnimatedContainer",
    "AnimatedCrossFade",
    "AnimatedDefaultTextStyle",
    "AnimatedList",
    "AnimatedOpacity",
    "AnimatedPadding",
    "AnimatedPhysicalModel",
    "AnimatedPositioned",
    "AnimatedSize",
    "AnimatedSwitcher",
    "Fade Transition",
    "PositionedTransition",
    "Rotation Transition",
    "Scale Transition",
    "Size Transition",
    "Slide Transition",
    "TweenAnimationBuilder",
    "Beautiful Drawer",
    "Zoom Drawer",
    "Hidden Drawer",
    "Standard Drawer",
    "Collapsible Drawer",
  ];

  late final List<Widget Function()> screens = [
    () => Animatedalign(),
    () => Animatedbuilder(),
    () => Animatedcontainer(),
    () => Animatedcrossfade(),
    () => Animateddefaulttext(),
    () => Animatedlist(),
    () => Animatedopacity(),
    () => Animatedpadding(),
    () => SampleAnimatedPhysicalModel(),
    () => SampleAnimatedPositioned(),
    () => SampleAnimatedSize(),
    () => SampleAnimatedSwitcher(),
    () => SampleFadeTransition(),
    () => SamplePositionedTransition(),
    () => SampleRotationTransition(),
    () => SampleScaleTransition(),
    () => SampleSizeTransition(),
    () => SampleSlideTransition(),
    () => SampleTweenAnimationBuilder(),
    () => BeautifulDrawerScreen(),
    () => ZoomDrawerScreen(),
    () => HiddenDrawer(),
    () => StandardDrawerScreen(),
    () => CollapsibleDrawerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.85 : 1.0)
              ..rotateZ(isDrawerOpen ? -0.05 : 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),

                // ── Top Bar ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      "Animations",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // ── Grid Cards ──
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: animations.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (isDrawerOpen) {
                            closeDrawer();
                          } else if (index == 19) {
                            openDrawer();
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => screens[index](),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                animations[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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

// ─── BEAUTIFUL DRAWER SCREEN ──────────────────────────────────
class BeautifulDrawerScreen extends StatefulWidget {
  const BeautifulDrawerScreen({super.key});
  @override
  State<BeautifulDrawerScreen> createState() => _BeautifulDrawerScreenState();
}

class _BeautifulDrawerScreenState extends State<BeautifulDrawerScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  void openDrawer() {
    setState(() {
      xOffset = 290;
      yOffset = 80;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.85 : 1.0)
              ..rotateZ(isDrawerOpen ? -0.1 : 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: isDrawerOpen ? closeDrawer : openDrawer,
                          child: Icon(
                            isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Beautiful Drawer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 40),
                  // Center(
                  //   child: Text(
                  //     'Beautiful Animated Drawer\nMenu icon tap karo!',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(fontSize: 18, color: Colors.black54),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
