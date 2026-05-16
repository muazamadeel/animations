import 'package:flutter/material.dart';

class Animatedbuilder extends StatefulWidget {
  const Animatedbuilder({super.key});

  @override
  State<Animatedbuilder> createState() => _AnimatedbuilderState();
}

class _AnimatedbuilderState extends State<Animatedbuilder>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late AnimationController _colorController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _colorController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedBuilder Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _rotationAnimation,
                  _scaleAnimation,
                  _colorAnimation,
                ]),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * 3.14159,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: _colorAnimation.value,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  _colorAnimation.value?.withValues(
                                    alpha: 0.5,
                                  ) ??
                                  Colors.transparent,
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: child,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.star, color: Colors.white, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_rotationController.isAnimating) {
                          _rotationController.stop();
                        } else {
                          _rotationController.repeat();
                        }
                      },
                      child: Text(
                        _rotationController.isAnimating
                            ? 'Stop Rotation'
                            : 'Start Rotation',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_scaleController.status ==
                            AnimationStatus.completed) {
                          _scaleController.reverse();
                        } else {
                          _scaleController.forward();
                        }
                      },
                      child: const Text('Toggle Scale'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_colorController.status == AnimationStatus.completed) {
                      _colorController.reverse();
                    } else {
                      _colorController.forward();
                    }
                  },
                  child: const Text('Toggle Color'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }
}
