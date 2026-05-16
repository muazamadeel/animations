import 'package:flutter/material.dart';

class SampleAnimatedPhysicalModel extends StatefulWidget {
  const SampleAnimatedPhysicalModel({super.key});

  @override
  State<SampleAnimatedPhysicalModel> createState() =>
      _SampleAnimatedPhysicalModelState();
}

class _SampleAnimatedPhysicalModelState
    extends State<SampleAnimatedPhysicalModel> {
  double _elevation = 4.0;
  Color _color = Colors.blue;
  Color _shadowColor = Colors.black;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPhysicalModel Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedPhysicalModel(
                shape: BoxShape.rectangle,
                elevation: _elevation,
                color: _color,
                shadowColor: _shadowColor,
                borderRadius: _borderRadius,
                duration: _duration,
                curve: Curves.easeInOut,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.layers, color: Colors.white, size: 60),
                      SizedBox(height: 8),
                      Text(
                        'Physical Model',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Material Design Shadow',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
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
                Text('Elevation: ${_elevation.toInt()}'),
                Slider(
                  value: _elevation,
                  min: 0,
                  max: 24,
                  divisions: 24,
                  onChanged: (value) => setState(() => _elevation = value),
                ),
                const SizedBox(height: 16),
                const Text('Colors:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.blue),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Blue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.red),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Red',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.green),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Green',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _color = Colors.purple),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        'Purple',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Border Radius:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(
                        () => _borderRadius = BorderRadius.circular(0),
                      ),
                      child: const Text('Square'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(
                        () => _borderRadius = BorderRadius.circular(8),
                      ),
                      child: const Text('Rounded'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(
                        () => _borderRadius = BorderRadius.circular(100),
                      ),
                      child: const Text('Circle'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Shadow Color:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _shadowColor = Colors.black),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Black',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _shadowColor = Colors.red),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Red',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _shadowColor = Colors.blue),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Blue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
