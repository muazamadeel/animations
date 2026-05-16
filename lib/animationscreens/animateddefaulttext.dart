import 'package:flutter/material.dart';

class Animateddefaulttext extends StatefulWidget {
  const Animateddefaulttext({super.key});

  @override
  State<Animateddefaulttext> createState() => _AnimateddefaulttextState();
}

class _AnimateddefaulttextState extends State<Animateddefaulttext> {
  bool _isLarge = false;
  bool _isBold = false;
  bool _isColored = false;
  Duration _duration = const Duration(milliseconds: 500);

  TextStyle get _textStyle => TextStyle(
    fontSize: _isLarge ? 32 : 16,
    fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
    color: _isColored ? Colors.red : Colors.blue,
    letterSpacing: _isLarge ? 2.0 : 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedDefaultTextStyle Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AnimatedDefaultTextStyle(
                  style: _textStyle,
                  duration: _duration,
                  curve: Curves.easeInOut,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Animated Text Style'),
                      SizedBox(height: 16),
                      Text('This text inherits the animated style'),
                      SizedBox(height: 16),
                      Text('All children get the same style'),
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
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => _isLarge = !_isLarge),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isLarge ? Colors.blue : null,
                      ),
                      child: Text(_isLarge ? 'Large ✓' : 'Large'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _isBold = !_isBold),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isBold ? Colors.blue : null,
                      ),
                      child: Text(_isBold ? 'Bold ✓' : 'Bold'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _isColored = !_isColored),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isColored ? Colors.blue : null,
                      ),
                      child: Text(_isColored ? 'Red ✓' : 'Blue'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _isLarge = !_isLarge;
                    _isBold = !_isBold;
                    _isColored = !_isColored;
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Toggle All'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'All text widgets inherit the animated style',
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
}
