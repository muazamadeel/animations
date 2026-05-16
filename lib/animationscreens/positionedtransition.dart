import 'package:flutter/material.dart';

class SamplePositionedTransition extends StatefulWidget {
  const SamplePositionedTransition({super.key});

  @override
  State<SamplePositionedTransition> createState() =>
      _SamplePositionedTransitionState();
}

class _SamplePositionedTransitionState extends State<SamplePositionedTransition>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;
  // bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _updateAnimation();
  }

  void _updateAnimation() {
    _animation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(50, 50, 50, 50),
      end: const RelativeRect.fromLTRB(20, 20, 20, 20),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PositionedTransition Widget')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha: 0.4),
                            blurRadius: 12,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.open_with, color: Colors.white, size: 50),
                          SizedBox(height: 8),
                          Text(
                            'Positioned',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Transition',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Duration: ${_controller.duration!.inMilliseconds}ms'),
                Slider(
                  value: _controller.duration!.inMilliseconds.toDouble(),
                  min: 200,
                  max: 3000,
                  divisions: 28,
                  onChanged: (value) {
                    setState(() {
                      _controller.duration = Duration(
                        milliseconds: value.toInt(),
                      );
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Animation Progress: ${(_controller.value * 100).toInt()}%',
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _animation =
                            RelativeRectTween(
                              begin: const RelativeRect.fromLTRB(
                                100,
                                100,
                                100,
                                100,
                              ),
                              end: const RelativeRect.fromLTRB(20, 20, 20, 20),
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.easeInOut,
                              ),
                            );
                        _controller.forward();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Expand',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _animation =
                            RelativeRectTween(
                              begin: const RelativeRect.fromLTRB(
                                20,
                                20,
                                20,
                                20,
                              ),
                              end: const RelativeRect.fromLTRB(
                                100,
                                100,
                                100,
                                100,
                              ),
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.easeInOut,
                              ),
                            );
                        _controller.forward();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Collapse',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _animation =
                            RelativeRectTween(
                              begin: const RelativeRect.fromLTRB(
                                50,
                                150,
                                50,
                                50,
                              ),
                              end: const RelativeRect.fromLTRB(50, 20, 50, 150),
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.bounceOut,
                              ),
                            );
                        _controller.forward();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Move Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _animation =
                            RelativeRectTween(
                              begin: const RelativeRect.fromLTRB(
                                150,
                                50,
                                20,
                                50,
                              ),
                              end: const RelativeRect.fromLTRB(20, 50, 150, 50),
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.elasticOut,
                              ),
                            );
                        _controller.forward();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        'Move Left',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _controller.repeat(reverse: true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        'Repeat',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _controller.reset(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'PositionedTransition animates RelativeRect changes',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
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
    _controller.dispose();
    super.dispose();
  }
}
