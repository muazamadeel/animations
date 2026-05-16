import 'package:flutter/material.dart';

class Animatedalign extends StatefulWidget {
  const Animatedalign({super.key});

  @override
  State<Animatedalign> createState() => _AnimatedalignState();
}

class _AnimatedalignState extends State<Animatedalign> {
  Alignment _alignment = Alignment.topLeft;
  Duration _duration = const Duration(milliseconds: 500);

  final List<Alignment> _alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign Widget')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16),
              child: AnimatedAlign(
                alignment: _alignment,
                duration: _duration,
                curve: Curves.easeInOut,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.star, color: Colors.white, size: 40),
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
                  spacing: 8,
                  runSpacing: 8,
                  children: _alignments.map((alignment) {
                    return ElevatedButton(
                      onPressed: () => setState(() => _alignment = alignment),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _alignment == alignment
                            ? Colors.blue
                            : null,
                      ),
                      child: Text(_getAlignmentName(alignment)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getAlignmentName(Alignment alignment) {
    if (alignment == Alignment.topLeft) return 'TL';
    if (alignment == Alignment.topCenter) return 'TC';
    if (alignment == Alignment.topRight) return 'TR';
    if (alignment == Alignment.centerLeft) return 'CL';
    if (alignment == Alignment.center) return 'C';
    if (alignment == Alignment.centerRight) return 'CR';
    if (alignment == Alignment.bottomLeft) return 'BL';
    if (alignment == Alignment.bottomCenter) return 'BC';
    if (alignment == Alignment.bottomRight) return 'BR';
    return '';
  }
}
