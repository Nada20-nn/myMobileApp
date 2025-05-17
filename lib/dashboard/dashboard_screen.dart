import 'package:flutter/material.dart';
import 'package:mobileproj/add_item/item.dart';
import 'package:mobileproj/add_item/item_model.dart';
import 'package:mobileproj/details/details_screen/details_page.dart';
import 'package:mobileproj/add_item/add_item_screen.dart';
import 'package:mobileproj/details/details_widget/details_widget.dart';
import 'package:mobileproj/favorite/favorite_model.dart';
import 'package:mobileproj/profile/profile_page/profile_page.dart';
import 'package:mobileproj/profile/user_model.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage= Provider.of<UserModel>(context, ).user?.image; //3shan y3rd pp bta3ty bdal shakl icon fo2
    final items= Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:profileImage==null? Icon(Icons.account_box): CircleAvatar(child: ClipOval(child: Image.file(profileImage, height: 50,width: 50,fit: BoxFit.cover,),),),//bthot pp bta3ty lw 8ayrtha fo2 
          ),
        ],
      
      
      
      
      
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ), // kol 2 items yzhro gmb b3d
        itemCount: items.items.length,//3la hsab items that i added
        itemBuilder: (context, index) {
          return InkWell( // 3bara 3n widget lma ad8t 3aleha t3ml action mo3yn



            onTap: () {


              items.selectItem(Item(images:items.items[index].  images, title:items.items[index]. title, body:items.items[index]. body, favorite: items.items[index].favorite));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              ); // when click it returns to this pg
            },
            child: SizedBox(
              child: Column(
                children: [
                  Image.file(items.items[index].images.first,height: 125,width: 200,fit: BoxFit.cover,),//awl item fe imgs
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // space between title&icon
                    children: [
                      Text(items.items[index].title),//3la hsab index hhot tit
                      FavoriteWidget(index: items.items.indexOf(items.items[index]),)
                  //     IconButton(onPressed: () {

                  //  Provider.of<FavoriteModel> (context,listen: false).add(items.items[index]);





                  //     }, icon: Icon(Icons.favorite)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          ); // lw rge3t ywadeni 3la dashboard screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
