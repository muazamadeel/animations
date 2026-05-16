import 'package:flutter/material.dart';

class Animatedcrossfade extends StatefulWidget {
  const Animatedcrossfade({super.key});

  @override
  State<Animatedcrossfade> createState() => _AnimatedcrossfadeState();
}

class _AnimatedcrossfadeState extends State<Animatedcrossfade> {
  bool _showFirst = true;
  Duration _duration = const Duration(milliseconds: 500);
  CrossFadeState get _crossFadeState =>
      _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedCrossFade(
                firstChild: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(alpha: 0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 60),
                      SizedBox(height: 8),
                      Text(
                        'First Widget',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                secondChild: Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withValues(alpha: 0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 60),
                      SizedBox(height: 8),
                      Text(
                        'Second Widget',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                crossFadeState: _crossFadeState,
                duration: _duration,
                firstCurve: Curves.easeInOut,
                secondCurve: Curves.easeInOut,
                sizeCurve: Curves.easeInOut,
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
                ElevatedButton(
                  onPressed: () => setState(() => _showFirst = !_showFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _showFirst ? Colors.blue : Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    _showFirst ? 'Show Second Widget' : 'Show First Widget',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Currently showing: ${_showFirst ? "First" : "Second"} Widget',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Notice how both opacity and size animate smoothly',
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
