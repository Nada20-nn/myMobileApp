import 'package:flutter/material.dart';
import 'package:mobileproj/profile/profile_page/profile_page.dart';

import "../home_widget/home_widget.dart";

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  const MyHomePage({this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("The ${title ?? "Tree"}"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/view.jpg'),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                body ??
                    "neath the ground, a tree has a root system that acts as an anchor and stores the water and nutrients the plant needs to grow.",
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MySeason(url: 'assets/tree.jpg', text: "tree1"),
                MySeason(url: 'assets/tree2.jpg', text: "tree2"),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
