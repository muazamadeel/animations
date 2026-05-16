import 'package:flutter/material.dart';

class SampleAnimatedSize extends StatefulWidget {
  const SampleAnimatedSize({super.key});

  @override
  State<SampleAnimatedSize> createState() => _SampleAnimatedSizeState();
}

class _SampleAnimatedSizeState extends State<SampleAnimatedSize>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSize Widget')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AnimatedSize(
                  duration: _duration,
                  curve: Curves.easeInOut,
                  child: Container(
                    width: _isExpanded ? 300 : 150,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isExpanded
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white,
                          size: _isExpanded ? 60 : 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _isExpanded ? 'Expanded' : 'Collapsed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _isExpanded ? 20 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_isExpanded) ...[
                          const SizedBox(height: 8),
                          const Text(
                            'More content visible',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
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
                ElevatedButton(
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isExpanded ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    _isExpanded ? 'Collapse' : 'Expand',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'AnimatedSize automatically animates size changes',
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
