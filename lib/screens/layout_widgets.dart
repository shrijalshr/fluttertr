import 'package:flutter/material.dart';

class LayoutWidgetsScreen extends StatefulWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  State<LayoutWidgetsScreen> createState() => _LayoutWidgetsScreenState();
}

class _LayoutWidgetsScreenState extends State<LayoutWidgetsScreen> {
  // Row/Column Interactive State
  MainAxisAlignment _rowAlignment = MainAxisAlignment.spaceEvenly;
  CrossAxisAlignment _columnAlignment = CrossAxisAlignment.center;
  bool _isRowActive = true; // Toggle between testing Row or Column

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Layout Sandbox & Demos',
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
                '07. Arranging Multiple Widgets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Mastering structures: Columns align vertically, Rows align horizontally, Stacks layer on top.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 24),

              // 1. Row & Column Interactive Sandbox
              Container(
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
                    // Sandbox Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '🎮 A. Row & Column Sandbox',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        // Toggle Row/Column Button
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isRowActive = !_isRowActive;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _isRowActive ? 'Switch to Column' : 'Switch to Row',
                              style: const TextStyle(color: Color(0xFF818CF8), fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap alignment options below to visually see the containers shift inside their container boundaries.',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                    ),
                    const SizedBox(height: 16),

                    // Interactive Display Box
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF475569)),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: _isRowActive
                          ? Row(
                              mainAxisAlignment: _rowAlignment,
                              children: _buildSandboxItems(),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: _columnAlignment,
                              children: _buildSandboxItems(),
                            ),
                    ),
                    const SizedBox(height: 16),

                    // Alignment Selectors
                    if (_isRowActive) ...[
                      const Text('Row MainAxisAlignment Options:', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildAlignmentButton('Start', MainAxisAlignment.start, _rowAlignment == MainAxisAlignment.start),
                          _buildAlignmentButton('Center', MainAxisAlignment.center, _rowAlignment == MainAxisAlignment.center),
                          _buildAlignmentButton('End', MainAxisAlignment.end, _rowAlignment == MainAxisAlignment.end),
                          _buildAlignmentButton('SpaceBetween', MainAxisAlignment.spaceBetween, _rowAlignment == MainAxisAlignment.spaceBetween),
                          _buildAlignmentButton('SpaceEvenly', MainAxisAlignment.spaceEvenly, _rowAlignment == MainAxisAlignment.spaceEvenly),
                        ],
                      )
                    ] else ...[
                      const Text('Column CrossAxisAlignment Options:', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildCrossAlignmentButton('Start', CrossAxisAlignment.start, _columnAlignment == CrossAxisAlignment.start),
                          _buildCrossAlignmentButton('Center', CrossAxisAlignment.center, _columnAlignment == CrossAxisAlignment.center),
                          _buildCrossAlignmentButton('End', CrossAxisAlignment.end, _columnAlignment == CrossAxisAlignment.end),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Padding & Expanded
              _buildDemoSection(
                title: 'B. Expanded & Padding Showcase',
                description: 'Padding surrounds elements with white space. Expanded makes a widget fill all remaining space in a Row or Column.',
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Normal widget
                      Container(
                        color: const Color(0xFFEC4899),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: const Text('Fixed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      
                      // Expanded Widget stretching
                      Expanded(
                        child: Container(
                          color: const Color(0xFF6366F1),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          child: const Text(
                            'Expanded (Fills Space)',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 3. Stack Showcase
              _buildDemoSection(
                title: 'C. Stack Widget Layering',
                description: 'Overlay elements on top of each other. Great for badges, avatar profile edits, and complex backgrounds.',
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 120,
                    child: Stack(
                      children: [
                        // Bottom Layer: Card
                        Container(
                          width: 180,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFF818CF8), Color(0xFF4F46E5)]),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Stack Base Card',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        // Top Layer: Absolute Positioned Badge
                        Positioned(
                          top: -5,
                          right: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFF1E293B), width: 2),
                            ),
                            child: const Text(
                              'HOT',
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        // Bottom Layer 2: Positioned Icon
                        const Positioned(
                          bottom: 25,
                          right: 25,
                          child: Icon(Icons.star, color: Colors.amber, size: 28),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. ListView Showcase
              _buildDemoSection(
                title: 'D. Scrollable ListView',
                description: 'A scrollable grid or column. Regular columns overflow and crash on small screens; ListViews handle scrolling automatically.',
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF475569)),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildListItem('Shrijal Shrestha', 'Flutter Dev Instructor', 'SS'),
                      _buildListItem('Ali Ahmed', 'Student Assistant', 'AA'),
                      _buildListItem('Zenith Limbu', 'UX Designer Lead', 'ZL'),
                      _buildListItem('Riya Sharma', 'Curriculum Auditor', 'RS'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper lists for interactive sandbox
  List<Widget> _buildSandboxItems() {
    return [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: const Color(0xFFEF4444), borderRadius: BorderRadius.circular(8)),
        child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: const Color(0xFF38BDF8), borderRadius: BorderRadius.circular(8)),
        child: const Center(child: Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: const Color(0xFF34D399), borderRadius: BorderRadius.circular(8)),
        child: const Center(child: Text('3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
    ];
  }

  Widget _buildAlignmentButton(String label, MainAxisAlignment align, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _rowAlignment = align;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF6366F1) : const Color(0xFF334155),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCrossAlignmentButton(String label, CrossAxisAlignment align, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _columnAlignment = align;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFEC4899) : const Color(0xFF334155),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.bold,
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

  Widget _buildListItem(String title, String subtitle, String initials) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF6366F1),
        child: Text(initials, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white24, size: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
