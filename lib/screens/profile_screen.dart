import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // Required arguments to receive data from another screen
  final String name;
  final String email;

  const ProfileScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CircleAvatar that loads an image from the local assets folder
            const CircleAvatar(
              radius: 60,
              // Note: Ensure you have an 'avatar.png' inside the 'assets' folder
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 20),

            // Display the passed name
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Display the passed email
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
