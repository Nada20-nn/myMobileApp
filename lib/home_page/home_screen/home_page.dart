import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobileproj/add_item/add_item_screen.dart';
import 'package:mobileproj/dashboard/dashboard_screen.dart';
import 'package:mobileproj/profile/profile_page/profile_page.dart';
import 'package:mobileproj/profile/user_model.dart';
import 'package:provider/provider.dart';
import '../home_widget/home_widget.dart';

class HomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;

  const HomePage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nada ${title ?? "App"}"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: profileImage == null
                ? Icon(Icons.account_box)
                : CircleAvatar(
                    child: ClipOval(
                      child: Image.file(
                        profileImage,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              "We're built for software teams",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Our mission is to ensure teams can do their best work, no matter\n\n"
                "their size or budget. We focus on the details of everything we do",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                body ??
                    "Beneath the ground, a tree has a root system that acts as an anchor "
                    "and stores the water and nutrients the plant needs to grow.",
                textAlign: TextAlign.justify,
              ),
            ),
           SizedBox(
              height: 500,
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7, // Adjusted for better proportions
                ),
                itemCount: gridItems.length,
                itemBuilder:
                    (context, index) => MyPhoto(
                      text: gridItems[index]['text']!,
                      url: gridItems[index]['url']!,
                      subtitle: gridItems[index]['subtitle']!,
                    ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
