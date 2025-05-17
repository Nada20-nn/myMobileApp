import 'package:flutter/material.dart';
import 'package:mobileproj/add_item/item_model.dart';
import 'package:mobileproj/dashboard/dashboard_screen.dart';
import 'package:mobileproj/dashboard/nav_bar.dart';
import 'package:mobileproj/details/details_screen/details_page.dart';
import 'package:mobileproj/favorite/favorite_model.dart';
import 'package:mobileproj/home_page/home_screen/home_page.dart';
import 'package:mobileproj/portfolio/portfolio/portfolio.dart';
import 'package:mobileproj/profile/user_model.dart';
import 'package:mobileproj/quiz.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel(),),
         ChangeNotifierProvider(create: (context) => ItemModel()),
           ChangeNotifierProvider(create: (context) => FavoriteModel())
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  //no inter
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:  NavBar(),
    );
  }
}
