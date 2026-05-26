import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileCardScreen extends StatelessWidget {
  final UserProfile profile;

  const ProfileCardScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Text(
          'Your Profile Card',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Premium Glassmorphic Card Container
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 380),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.35),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.12),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Card Header Banner Gradient
                      Container(
                        height: 90,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26),
                            topRight: Radius.circular(26),
                          ),
                        ),
                      ),

                      // Profile Avatar Stack Overlay
                      Transform.translate(
                        offset: const Offset(0, -45),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer Ring
                            Container(
                              width: 96,
                              height: 96,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Color(0xFF6366F1), Color(0xFF38BDF8)],
                                ),
                              ),
                            ),
                            // Inner Avatar Image/Fallback
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                profile.avatarUrl,
                                width: 88,
                                height: 88,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    width: 88,
                                    height: 88,
                                    color: const Color(0xFF1E293B),
                                    child: Center(
                                      child: Text(
                                        profile.initials,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 88,
                                    height: 88,
                                    color: const Color(0xFF6366F1),
                                    child: Center(
                                      child: Text(
                                        profile.initials,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Card Content
                      Transform.translate(
                        offset: const Offset(0, -30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              // Name
                              Text(
                                profile.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),

                              // Role Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6366F1).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.3)),
                                ),
                                child: Text(
                                  profile.role,
                                  style: const TextStyle(
                                    color: Color(0xFF818CF8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),

                              // Separator Line
                              Container(
                                width: 50,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF334155),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 18),

                              // Bio Text
                              Text(
                                profile.bio,
                                style: const TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),

                              // Interactive Social Links Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (profile.githubHandle != null) ...[
                                    _buildSocialButton(
                                      context,
                                      Icons.code_rounded,
                                      'GitHub',
                                      'https://github.com/${profile.githubHandle}',
                                      const Color(0xFF38BDF8),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                  if (profile.twitterHandle != null) ...[
                                    _buildSocialButton(
                                      context,
                                      Icons.alternate_email_rounded,
                                      'Twitter',
                                      'https://twitter.com/${profile.twitterHandle}',
                                      const Color(0xFFEC4899),
                                    ),
                                  ],
                                  if (profile.githubHandle == null && profile.twitterHandle == null)
                                    const Text(
                                      'No social handles linked.',
                                      style: TextStyle(color: Colors.white24, fontSize: 12, fontStyle: FontStyle.italic),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Exit Guide Info Box
                Container(
                  constraints: const BoxConstraints(maxWidth: 380),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.military_tech_rounded, color: Colors.amber, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '🎉 Awesome! You\'ve executed all Phase 2 goals: OOP objects, core/layout widgets, buttons, and route navigation.',
                          style: TextStyle(
                            color: Color(0xFFE2E8F0),
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    IconData icon,
    String label,
    String url,
    Color accentColor,
  ) {
    return InkWell(
      onTap: () {
        // Show a custom snackbar showing dynamic links worked!
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF1E293B),
            content: Row(
              children: [
                Icon(icon, color: accentColor, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Simulating navigation to: $url',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accentColor.withOpacity(0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: accentColor, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: accentColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
