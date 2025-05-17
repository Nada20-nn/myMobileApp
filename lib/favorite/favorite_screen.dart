import 'package:flutter/material.dart';
import 'package:mobileproj/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('favorite'),
      ),
       body: Consumer <FavoriteModel>(
        builder: (context,fav, child)
         => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ), // kol 2 items yzhro gmb b3d
          itemCount: fav.fav.length,//3la hsab items that i added
          itemBuilder: (context, index) {
            return SizedBox(
              child: Column(
                children: [
                  Image.file(fav.fav[index].images.first,height: 125,width: 200,fit: BoxFit.cover,),//awl item fe imgs
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // space between title&icon
                    children: [
                      Text(fav.fav[index].title),//3la hsab index hhot tit
                      IconButton(onPressed: () {

                        fav.fav[index].favorite=false;//3shan sora ttmesh mn fav pg
                     
                   fav.remove(fav.fav[index]);
                     
                     
                     
                     
                     
                      }, icon: Icon(Icons.favorite, color: Colors.red,)),
                    ],
                  ),
                ],
              ),
            );
          },
               ),
       ),
    );
  }
}