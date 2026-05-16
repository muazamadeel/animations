import 'package:flutter/material.dart';

class SampleTweenAnimationBuilder extends StatefulWidget {
  const SampleTweenAnimationBuilder({super.key});

  @override
  State<SampleTweenAnimationBuilder> createState() =>
      _SampleTweenAnimationBuilderState();
}

class _SampleTweenAnimationBuilderState
    extends State<SampleTweenAnimationBuilder> {
  double _targetValue = 1.0;
  Duration _duration = const Duration(milliseconds: 1000);
  Color _targetColor = Colors.blue;
  double _targetSize = 200;
  double _targetRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TweenAnimationBuilder Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _targetValue),
                duration: _duration,
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return TweenAnimationBuilder<Color?>(
                    tween: ColorTween(begin: Colors.grey, end: _targetColor),
                    duration: _duration,
                    builder: (context, color, child) {
                      return TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 100, end: _targetSize),
                        duration: _duration,
                        curve: Curves.easeInOut,
                        builder: (context, size, child) {
                          return Transform.rotate(
                            angle: _targetRotation * value,
                            child: Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(size * 0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: (color ?? Colors.grey).withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 15 * value,
                                    spreadRadius: 3 * value,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_awesome,
                                    color: Colors.white,
                                    size: size * 0.3,
                                  ),
                                  SizedBox(height: size * 0.05),
                                  Text(
                                    'Tween',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size * 0.12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Builder',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: size * 0.08,
                                    ),
                                  ),
                                  SizedBox(height: size * 0.05),
                                  Text(
                                    '${(value * 100).toInt()}%',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: size * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
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
                  min: 200,
                  max: 3000,
                  divisions: 28,
                  onChanged: (value) {
                    setState(() {
                      _duration = Duration(milliseconds: value.toInt());
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Target Value: ${_targetValue.toStringAsFixed(1)}'),
                Slider(
                  value: _targetValue,
                  min: 0.0,
                  max: 2.0,
                  divisions: 20,
                  onChanged: (value) {
                    setState(() {
                      _targetValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Size: ${_targetSize.toInt()}px'),
                Slider(
                  value: _targetSize,
                  min: 100,
                  max: 300,
                  divisions: 20,
                  onChanged: (value) {
                    setState(() {
                      _targetSize = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('Colors:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _colorButton(Colors.blue, 'Blue'),
                    _colorButton(Colors.red, 'Red'),
                    _colorButton(Colors.green, 'Green'),
                    _colorButton(Colors.purple, 'Purple'),
                    _colorButton(Colors.orange, 'Orange'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Rotation:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => _targetRotation = 0.0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _targetRotation == 0.0
                            ? Colors.blue
                            : null,
                      ),
                      child: Text(
                        '0°',
                        style: TextStyle(
                          color: _targetRotation == 0.0 ? Colors.white : null,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _targetRotation = 3.14159 / 2),
                      child: const Text('90°'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _targetRotation = 3.14159),
                      child: const Text('180°'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => _targetRotation = 3.14159 * 2),
                      child: const Text('360°'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'TweenAnimationBuilder automatically animates to target values',
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

  Widget _colorButton(Color color, String name) {
    return ElevatedButton(
      onPressed: () => setState(() => _targetColor = color),
      style: ElevatedButton.styleFrom(
        backgroundColor: _targetColor == color ? color : null,
        foregroundColor: _targetColor == color ? Colors.white : null,
      ),
      child: Text(name),
    );
  }
}
