import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobileproj/add_item/add_item_screen.dart';
import 'package:mobileproj/add_item/item_model.dart';
import 'package:mobileproj/dashboard/dashboard_screen.dart';
import 'package:mobileproj/profile/profile_page/profile_page.dart';
import 'package:mobileproj/profile/user_model.dart';
import 'package:provider/provider.dart';
import "../details_widget/details_widget.dart";

class DetailsPage extends StatelessWidget {
  // final String? title;
  // final String? body;
  // final List<File>? image;

  // const DetailsPage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context, ).user?.image; //3shan y3rd pp bta3ty bdal shakl icon fo2
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("The ${items.selectedItem?.title ?? 'Item'}"),
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
                  ), //bthot pp bta3ty lw 8ayrtha fo2 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // h3rd sora 3latol msh h3ml check 3la null wla la
            items.selectedItem != null && items.selectedItem!.images.isNotEmpty
                ? Image.file(
                    items.selectedItem!.images
                    .first,
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ) // lw fadya or b null this img will appear or tdeni img 2aly feha
                : Image.asset(
                    'assets/view.jpg',
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, //fav,share
              children: [
                FavoriteWidget(index: items.items.indexOf(items.selectedItem!),),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                items.selectedItem?.body ??
                    "", // ?? "neath the ground..." lw habb a3ml default text
                // textAlign: TextAlign.justify,
              ),
            ),

            // lw image fadya y3rd row
            // (image == null || image!.isEmpty)
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           MySeason(url: 'assets/tree.jpg', text: "tree1"),
            //           MySeason(url: 'assets/tree2.jpg', text: "tree2"),
            //         ],
            //       )
            //     : 
            items.selectedItem != null && items.selectedItem!.images.isNotEmpty
                ? SizedBox(
                    height: 500,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.selectedItem!.images.length, //list hykon feha kam img not null
                      itemBuilder: (context, index) => Image.file(
                        items.selectedItem!.images[index], // 2aly hy3rdli shakl
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10, //for spaces 
                        crossAxisSpacing: 10,
                      ), //h3rd kam element gamb b3d, w space 2aly hsebha ad eh
                    ),
                  )
                : SizedBox(),
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
