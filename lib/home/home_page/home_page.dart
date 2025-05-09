import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobileproj/firstScreen.dart';
import 'package:mobileproj/profile/profile_page/profile_page.dart';

import "../home_widget/home_widget.dart";

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;

  const MyHomePage({this.image, this.title, this.body, super.key});

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
               image == null || image!.isEmpty? Image.asset('assets/view.jpg') : Image.file(image![0], height: 300,fit: BoxFit.cover,width: double.infinity,), // lw fadya or b null this img will appear or tdeni img 2aly feha

            Row(
              mainAxisAlignment: MainAxisAlignment.end, //fav,share
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

            // lw image fadya y3rd row
            (image == null || image!.isEmpty)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MySeason(url: 'assets/tree.jpg', text: "tree1"),
                      MySeason(url: 'assets/tree2.jpg', text: "tree2"),
                    ],
                  )
                : SizedBox(
                    height: 500,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: image!.length, //list hykon feha kam img not null
                      itemBuilder: (context, index) => Image.file(
                        image![index], // 2aly hy3rdli shakl
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,//for spaces 
                        crossAxisSpacing: 10,
                      ), //h3rd kam element gamb b3d, w space 2aly hsebha ad eh
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
