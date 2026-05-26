import 'package:flutter/material.dart';

class InteractionScreen extends StatefulWidget {
  const InteractionScreen({super.key});

  @override
  State<InteractionScreen> createState() => _InteractionScreenState();
}

class _InteractionScreenState extends State<InteractionScreen> {
  // Input & State variables
  final TextEditingController _textController = TextEditingController();
  String _submittedText = '';
  int _tapCount = 0;
  String _gestureFeedback = 'Try interacting with the box below!';

  @override
  void dispose() {
    _textController.dispose(); // Always clean up controllers to prevent memory leaks!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Basic Interaction Showcase',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '08. Capture User Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'How the app responds to buttons, text entries, and custom touch gestures.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 24),

              // 1. Interactive Buttons
              _buildDemoSection(
                title: 'A. Button Widgets',
                description: 'ElevatedButton (primary, raised), TextButton (secondary, flat), and IconButton (vector triggers).',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Elevated Button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _tapCount++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6366F1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('ElevatedButton'),
                        ),

                        // Text Button
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _tapCount = 0;
                            });
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFF43F5E),
                          ),
                          child: const Text('Reset Count'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Count State: ', style: TextStyle(color: Colors.white70)),
                        Text(
                          '$_tapCount Taps',
                          style: const TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 20),
                        // Icon Button
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF334155)),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.favorite),
                            color: Colors.redAccent,
                            iconSize: 24,
                            onPressed: () {
                              setState(() {
                                _tapCount += 5;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. User Input (TextField)
              _buildDemoSection(
                title: 'B. TextField Input & State',
                description: 'Use TextEditingController to read input text and setState to trigger UI updates.',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Enter your custom name',
                        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
                        hintText: 'e.g. Shrijal',
                        hintStyle: const TextStyle(color: Colors.white24),
                        prefixIcon: const Icon(Icons.person_outline_rounded, color: Color(0xFF6366F1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF334155)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _submittedText = _textController.text;
                          });
                        },
                        icon: const Icon(Icons.send_rounded, size: 16),
                        label: const Text('Submit Text'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0EA5E9),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    if (_submittedText.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0EA5E9).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF0EA5E9).withOpacity(0.3)),
                        ),
                        child: Text(
                          '👋 Hello, $_submittedText! Great job capturing this input!',
                          style: const TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. GestureDetector
              _buildDemoSection(
                title: 'C. GestureDetector Custom Touch',
                description: 'Wraps any widget to trigger actions on simple taps, double-taps, or long-press gestures.',
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _gestureFeedback = '✅ Single Tapped! 👆';
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          _gestureFeedback = '🔥 Double Tapped! ⚡';
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _gestureFeedback = '💎 Long Pressed! 👑';
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEC4899), Color(0xFFD946EF)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFEC4899).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'TAP / DOUBLE TAP / LONG PRESS ME',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF334155)),
                      ),
                      child: Text(
                        _gestureFeedback,
                        style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemoSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
