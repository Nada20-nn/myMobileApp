import 'package:flutter/material.dart';

const List<Map<String, String>> gridItems = [
  {'text': 'Nada', 'url': 'assets/view.jpg', 'subtitle': 'Nada: 9 CEO'},
  {'text': 'sea view', 'url': 'assets/tree.jpg', 'subtitle': 'tree'},
  {'text': 'lionnn', 'url': 'assets/lion.jpeg', 'subtitle': 'springyy springyy'},
  {'text': 'lionn', 'url': 'assets/lion.jpeg', 'subtitle': 'Professional lion'},
];

class MyPhoto extends StatelessWidget {
  final String url;
  final String text;
  final String subtitle;

  const MyPhoto({
    required this.text,
    required this.url,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoGridScreen extends StatelessWidget {
  const PhotoGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Grid")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We're built for software teams",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Our mission is to ensure teams can do their best work, no matter\n\n"
                    "their size or budget. We focus on the details of everything we do.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: gridItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return MyPhoto(
                    text: item['text']!,
                    url: item['url']!,
                    subtitle: item['subtitle']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
