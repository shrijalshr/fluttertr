import 'package:flutter/material.dart';

class CoreWidgetsScreen extends StatelessWidget {
  const CoreWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Core Widgets Showcase',
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
                '06. Basic Building Blocks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'These atomic widgets make up the visible layout of any screen.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 24),

              // 1. Text Widget
              _buildDemoSection(
                title: 'A. Text Widget',
                description: 'Displays a string of text with customizable font sizes, weights, styles, and colors.',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Plain Text (Default)',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    const Text('Hello Flutter, this is basic unstyled text.'),
                    const SizedBox(height: 16),
                    const Text(
                      'Styled Text (Customized)',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Premium Bold Indigo',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [Color(0xFF818CF8), Color(0xFFC084FC)],
                          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Italicized, spaced, and light-grey font style.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.2,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Container Widget
              _buildDemoSection(
                title: 'B. Container Widget',
                description: 'A versatile box featuring width, height, colors, padding, margins, borders, and rounded corners.',
                child: Column(
                  children: [
                    // Simple Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF38BDF8).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF0284C7), width: 1.5),
                      ),
                      child: const Text(
                        'Container: Border, Padding & Transparent Background',
                        style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Complex Container (Glassmorphic look)
                    Container(
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: const Text(
                        'Styled Shape',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Icon Widget
              _buildDemoSection(
                title: 'C. Icon Widget',
                description: 'Renders vectors from system font glyphs (like Material Icons) with custom size and color.',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.home_filled, color: Color(0xFF818CF8), size: 30),
                        SizedBox(height: 4),
                        Text('Home (30)', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.favorite_rounded, color: Color(0xFFEF4444), size: 45),
                        SizedBox(height: 4),
                        Text('Heart (45)', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bolt, color: Colors.amber, size: 60),
                        SizedBox(height: 4),
                        Text('Volt (60)', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 4. SizedBox Widget
              _buildDemoSection(
                title: 'D. SizedBox Widget',
                description: 'Creates a invisible spacer box with fixed width or height, or wraps a child with strict constraints.',
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF6366F1),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Top Container'),
                    ),
                    // Vertical spacer
                    const SizedBox(height: 30),
                    Container(
                      color: const Color(0xFFEC4899),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Bottom Container (Pushed 30px down)'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 5. Image Widget
              _buildDemoSection(
                title: 'E. Image Widget',
                description: 'Displays raster images from URL networks or bundle resources with BoxFit resize properties.',
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://picsum.photos/600/400',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover, // Fills container perfectly
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 180,
                            color: const Color(0xFF1E293B),
                            child: const Center(
                              child: CircularProgressIndicator(color: Color(0xFF6366F1)),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 180,
                            color: const Color(0xFF1E293B),
                            child: const Center(
                              child: Icon(Icons.broken_image_rounded, color: Colors.red, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'BoxFit.cover stretches/crops image to fill constraints.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontStyle: FontStyle.italic),
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
