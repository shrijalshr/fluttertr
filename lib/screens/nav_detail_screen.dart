import 'package:flutter/material.dart';

enum NavShowcaseMode {
  simple,
  receiveData,
  returnData,
}

class NavDetailScreen extends StatelessWidget {
  final NavShowcaseMode mode;
  final String? passedName;
  final String? passedRole;

  const NavDetailScreen({
    super.key,
    required this.mode,
    this.passedName,
    this.passedRole,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Text(_getAppBarTitle()),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Center illustration/icon based on mode
            Icon(
              _getModeIcon(),
              size: 80,
              color: _getModeColor(),
            ),
            const SizedBox(height: 24),

            // Dynamic Body Layout
            _buildBodyContent(context),
            
            const SizedBox(height: 40),

            // Always provide a manual Back/Pop button for students to learn
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0xFF334155)),
                ),
              ),
              child: const Text('Cancel & Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  String _getAppBarTitle() {
    switch (mode) {
      case NavShowcaseMode.simple:
        return 'Simple Detail Screen';
      case NavShowcaseMode.receiveData:
        return 'Parameters Loaded';
      case NavShowcaseMode.returnData:
        return 'Select a Value';
    }
  }

  IconData _getModeIcon() {
    switch (mode) {
      case NavShowcaseMode.simple:
        return Icons.layers_outlined;
      case NavShowcaseMode.receiveData:
        return Icons.badge_outlined;
      case NavShowcaseMode.returnData:
        return Icons.color_lens_outlined;
    }
  }

  Color _getModeColor() {
    switch (mode) {
      case NavShowcaseMode.simple:
        return const Color(0xFF6366F1);
      case NavShowcaseMode.receiveData:
        return const Color(0xFF0EA5E9);
      case NavShowcaseMode.returnData:
        return const Color(0xFFEC4899);
    }
  }

  Widget _buildBodyContent(BuildContext context) {
    switch (mode) {
      case NavShowcaseMode.simple:
        return const Column(
          children: [
            Text(
              'Card Pushed Successfully!',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'This screen is just a widget in a Scaffold. It sits on top of the Home Screen. Popping this off will reveal the Home Screen underneath.',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
        );

      case NavShowcaseMode.receiveData:
        return Column(
          children: [
            const Text(
              'Parsed Data Card',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: Column(
                children: [
                  const Text('STUDENT LICENSE', style: TextStyle(color: Color(0xFF0EA5E9), letterSpacing: 1.5, fontSize: 11, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    passedName ?? 'No Name Provided',
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    passedRole ?? 'No Role Provided',
                    style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        );

      case NavShowcaseMode.returnData:
        return Column(
          children: [
            const Text(
              'Select a Color to Return',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tapping any options below will trigger Navigator.pop(context, value) returning the selection payload asynchronously.',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12, height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorOption(context, 'Indigo', const Color(0xFF6366F1)),
                _buildColorOption(context, 'Cyan', const Color(0xFF0EA5E9)),
                _buildColorOption(context, 'Emerald', const Color(0xFF10B981)),
              ],
            )
          ],
        );
    }
  }

  Widget _buildColorOption(BuildContext context, String label, Color color) {
    return InkWell(
      onTap: () {
        // Return structured payload back on POP
        Navigator.pop(context, {
          'name': label,
          'color': color,
        });
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
