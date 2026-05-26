import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import 'profile_card_screen.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  // Key to validate the form inputs
  final _formKey = GlobalKey<FormState>();

  // Controllers to read text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();

  // Role selection state (Choice Chips)
  String _selectedRole = 'Flutter Developer';
  final List<String> _roles = [
    'Flutter Developer',
    'UI/UX Designer',
    'Product Manager',
    'Mobile Tech Lead'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _githubController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Create Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Goal Callout
                const Center(
                  child: Column(
                    children: [
                      Icon(Icons.badge_rounded, color: Color(0xFF6366F1), size: 50),
                      SizedBox(height: 12),
                      Text(
                        'Phase 2 Exit Mini-Project',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Input details to generate your premium profile card.',
                        style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Name field
                _buildFieldTitle('Full Name *'),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '❌ Name is required to build a card';
                    }
                    return null;
                  },
                  decoration: _buildInputDecoration(
                    hintText: 'e.g. Shrijal Shrestha',
                    prefixIcon: Icons.person_outline_rounded,
                  ),
                ),
                const SizedBox(height: 20),

                // Role Selector
                _buildFieldTitle('Syllabus Role Selection'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _roles.map((role) {
                    final bool isSelected = _selectedRole == role;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedRole = role;
                        });
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF6366F1).withOpacity(0.15) : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF334155),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isSelected ? Icons.check_circle : Icons.circle_outlined,
                              color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF475569),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              role,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Biography field
                _buildFieldTitle('Short Biography'),
                TextFormField(
                  controller: _bioController,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                  decoration: _buildInputDecoration(
                    hintText: 'Write a few words about your journey and skills...',
                    prefixIcon: Icons.history_edu_outlined,
                  ),
                ),
                const SizedBox(height: 20),

                // Social Fields
                _buildFieldTitle('Social Media Links (Optional)'),
                TextFormField(
                  controller: _githubController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration(
                    hintText: 'GitHub Username (e.g. shrijalshr)',
                    prefixIcon: Icons.code_rounded,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _twitterController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration(
                    hintText: 'Twitter Username (e.g. shrijal_dev)',
                    prefixIcon: Icons.alternate_email_rounded,
                  ),
                ),
                const SizedBox(height: 32),

                // SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.rocket_launch_rounded, size: 20),
                    label: const Text(
                      'Generate Profile Card',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: const Color(0xFF6366F1).withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String hintText, required IconData prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF475569), size: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF334155)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      filled: true,
      fillColor: const Color(0xFF1E293B),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  void _submitForm() {
    // Check form validation
    if (_formKey.currentState!.validate()) {
      // Package into our OOP UserProfile object
      final user = UserProfile(
        name: _nameController.text.trim(),
        role: _selectedRole,
        bio: _bioController.text.trim().isEmpty
            ? "Passionate technologist eager to learn mobile app architecture and modern design systems."
            : _bioController.text.trim(),
        avatarUrl: 'https://picsum.photos/150', // Premium default mock avatar URL
        githubHandle: _githubController.text.trim().isEmpty ? null : _githubController.text.trim(),
        twitterHandle: _twitterController.text.trim().isEmpty ? null : _twitterController.text.trim(),
      );

      // Navigate to Screen 2, passing the object
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileCardScreen(profile: user),
        ),
      );
    }
  }
}
