import 'package:flutter/material.dart';
import 'package:mobileproj/add_item/item.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Item> _fav = [];

  // Getter to expose the private _fav list
  List<Item> get fav => _fav;

  // Add item to favorites if it’s not already in the list
  void add(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item); // lw el screen mfehash el item d, e3mlha add
      item.favorite = true; // 3shan lw 3ndk icon y3rf yghyr el color
      notifyListeners(); // y3ml rebuild ll UI
    }
  }

  // Remove item from favorites if it exists in the list
  void remove(Item item) {
    if (_fav.contains(item)) {
      _fav.remove(item); // 3shan ttms7 mn el fav page
      item.favorite = false; // 3shan tghyr el icon color l gray
      notifyListeners(); // y3ml rebuild ll UI
    }
  }

  // Toggle favorite status (used in icon buttons)
  void isFavorite(Item item) {
    item.favorite = !item.favorite; // lw kan true yb2a false, wl 3ks
    item.favorite ? add(item) : remove(item); // yshoof hy7otha wla yshof yshlha
  }
}
