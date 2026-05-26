// ─── Phase 2 Mini-Project Model: UserProfile ───────────────────────────
//
// This model class demonstrates Object-Oriented Programming (OOP) in a
// real-world Flutter context. It encapsulates the student's name, role,
// biography, and custom links into a single, cohesive blueprint.

class UserProfile {
  // Instance Variables (Properties)
  final String name;
  final String role;
  final String bio;
  final String avatarUrl;
  final String? githubHandle;
  final String? twitterHandle;

  // Shorthand Constructor (Enforcing positional and named parameters)
  UserProfile({
    required this.name,
    required this.role,
    required this.bio,
    required this.avatarUrl,
    this.githubHandle,
    this.twitterHandle,
  });

  // Getter (Computed property) to get initials for default avatar fallback
  String get initials {
    if (name.isEmpty) return '??';
    final parts = name.trim().split(' ');
    if (parts.length > 1) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
