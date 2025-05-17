import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileproj/add_item/item.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    //3shan adef item gded w anadi bl obj
    _items.add(item);
    notifyListeners(); //hbl8 en edaf 3ndy haga
  }

  ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage =
      []; //store in list of file type 3shan tb2a list of imgs a3rf a3rdha 3ndy

  Future<void> selectImage() async {
    List<XFile>? images = await imagePicker.pickMultiImage(); //msh btakhod haga

    if (images != null) {
      selectedImage!.addAll(
        images.map((toElement) => File(toElement.path)).toList(),
      ); //not null
    }
    notifyListeners(); //3shan tsm3 lma ykon fe changes
  }

  void removeImage(index) {
    {
      //htet el cancel fe setState 3shan onClick ttshal
      selectedImage!.removeAt(index);
      notifyListeners();

      //y3ny y3ml remove ll index 2aly hwa feha
    }
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem; //getter

  void selectItem(Item item) {
    //takhod items w t3rdha fe details screen
    _selectedItem = item; //hylkn fe item 2aly hb3to 3n tare2 func
    notifyListeners();
  }
}
