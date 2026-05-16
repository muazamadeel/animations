import 'package:flutter/material.dart';

class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: _color.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                duration: _duration,
                curve: Curves.easeInOut,
                child: const Icon(Icons.star, color: Colors.white, size: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Duration: ${_duration.inMilliseconds}ms'),
                Slider(
                  value: _duration.inMilliseconds.toDouble(),
                  min: 100,
                  max: 2000,
                  divisions: 19,
                  onChanged: (value) => setState(
                    () => _duration = Duration(milliseconds: value.toInt()),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _width = _width == 100 ? 200 : 100;
                        _height = _height == 100 ? 150 : 100;
                      }),
                      child: const Text('Size'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _color = _color == Colors.blue
                            ? Colors.red
                            : Colors.blue;
                      }),
                      child: const Text('Color'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _borderRadius =
                            _borderRadius == BorderRadius.circular(8)
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(8);
                      }),
                      child: const Text('Shape'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _width =
                        50 +
                        (200 *
                            (0.5 +
                                0.5 *
                                    (DateTime.now().millisecondsSinceEpoch %
                                        1000) /
                                    1000));
                    _height =
                        50 +
                        (200 *
                            (0.5 +
                                0.5 *
                                    (DateTime.now().millisecondsSinceEpoch %
                                        1500) /
                                    1500));
                    _color = Color(
                      (0xFF000000 +
                              (0xFFFFFF *
                                  (DateTime.now().millisecondsSinceEpoch %
                                      2000) /
                                  2000))
                          .toInt(),
                    );
                  }),
                  child: const Text('Random'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
