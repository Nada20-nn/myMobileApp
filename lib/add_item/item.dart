import 'dart:io';

class Item{//h3rf e;item bta3ty 2aly feha swar spring 2aly bkhtarha

@override
  bool operator ==(Object other) {
   
    return other is Item && other.title==title;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => title.hashCode;











Item({required this .images,required this.title , required this.body , required this.favorite});
  List <File> images;
  String title;
  String body;
  bool favorite;
  
}