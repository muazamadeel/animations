import 'package:flutter/material.dart';

class SampleAnimatedPositioned extends StatefulWidget {
  const SampleAnimatedPositioned({super.key});

  @override
  State<SampleAnimatedPositioned> createState() =>
      _SampleAnimatedPositionedState();
}

class _SampleAnimatedPositionedState extends State<SampleAnimatedPositioned> {
  double _left = 50;
  double _top = 50;
  double _width = 100;
  double _height = 100;
  Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPositioned Widget')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: _left,
                    top: _top,
                    width: _width,
                    height: _height,
                    duration: _duration,
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha: 0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.open_with,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Drag Me',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
                const Text('Positions:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _left = 20;
                        _top = 20;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Top Left',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _left = 150;
                        _top = 20;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        'Top Right',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _left = 85;
                        _top = 100;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Center',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _left = 20;
                        _top = 180;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Bottom Left',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _left = 150;
                        _top = 180;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        'Bottom Right',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Size:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _width = 80;
                        _height = 80;
                      }),
                      child: const Text('Small'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _width = 120;
                        _height = 120;
                      }),
                      child: const Text('Large'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _width = 150;
                        _height = 80;
                      }),
                      child: const Text('Wide'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _width = 80;
                        _height = 150;
                      }),
                      child: const Text('Tall'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _left =
                        20 +
                        (150 *
                            (DateTime.now().millisecondsSinceEpoch % 1000) /
                            1000);
                    _top =
                        20 +
                        (160 *
                            (DateTime.now().millisecondsSinceEpoch % 1500) /
                            1500);
                    _width =
                        80 +
                        (70 *
                            (DateTime.now().millisecondsSinceEpoch % 800) /
                            800);
                    _height =
                        80 +
                        (70 *
                            (DateTime.now().millisecondsSinceEpoch % 1200) /
                            1200);
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Random',
                    style: TextStyle(color: Colors.white),
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
