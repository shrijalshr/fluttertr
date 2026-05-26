import 'package:flutter/material.dart';
import 'nav_detail_screen.dart';

class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({super.key});

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  // Navigation return results
  String _returnedColor = 'None Selected yet';
  Color _returnedBoxColor = const Color(0xFF334155);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Navigation Demo Hub',
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
                '09. Multi-Screen Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Managing the screen stack using Navigator.push, Navigator.pop, and data handshakes.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 24),

              // Flow 1: Simple Push / Pop
              _buildDemoSection(
                title: 'Flow A: Simple Screen Push & Pop',
                description: 'Pushes a plain screen widget onto the stack. The detail page uses Navigator.pop to slide off.',
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavDetailScreen(
                            mode: NavShowcaseMode.simple,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Push Plain Detail Screen'),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Flow 2: Passing Parameters
              _buildDemoSection(
                title: 'Flow B: Passing Data to New Screen',
                description: 'Sends custom arguments (Name & Role) into the constructor of the detail screen widget.',
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavDetailScreen(
                            mode: NavShowcaseMode.receiveData,
                            passedName: 'Shrijal Shrestha',
                            passedRole: 'Lead Flutter Instructor',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0EA5E9),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Push Screen with Data'),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Flow 3: Awaiting Result on Return
              _buildDemoSection(
                title: 'Flow C: Await Returned Data on Return',
                description: 'Asynchronously waits for the detail page to be popped off, capturing whatever value is supplied back.',
                child: Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          // Await the pop value
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavDetailScreen(
                                mode: NavShowcaseMode.returnData,
                              ),
                            ),
                          );

                          // Update state with returned values
                          if (result != null && result is Map<String, dynamic>) {
                            setState(() {
                              _returnedColor = result['name'] ?? 'Unknown';
                              _returnedBoxColor = result['color'] ?? const Color(0xFF334155);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEC4899),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Pick Color & Get Result'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Returned Color Display Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _returnedBoxColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _returnedBoxColor.withOpacity(0.4), width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: _returnedBoxColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Returned Color: $_returnedColor',
                            style: TextStyle(color: _returnedBoxColor, fontWeight: FontWeight.bold),
                          ),
                        ],
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
