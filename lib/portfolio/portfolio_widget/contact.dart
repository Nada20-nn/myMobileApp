
// ==================== Contact Screen ====================
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Me"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("nada.elgedawy.nada@gmail.com"),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("01272812908"),
            ),
            const ListTile(
              leading: Icon(Icons.social_distance),
              title: Text("@nada.elgedawy"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
