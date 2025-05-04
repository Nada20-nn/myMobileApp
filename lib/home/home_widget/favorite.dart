
import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool click = false;

  void toggleFavorite() {
    setState(() {
      click = !click;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleFavorite,
      icon: Icon(Icons.favorite, color: click ? Colors.red : Colors.grey),
    );
  }
}