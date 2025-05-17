import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileproj/profile/profile_widget/user.dart';

class UserModel extends ChangeNotifier{//de bt update t8ayor


ImagePicker imagePicker = ImagePicker();
  // File? selectedImage;

  User ?_user; //var user mn no3 userclass
  User ? get user =>_user;//b null at first

  Future<void> selectImage(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null ) {
      if(_user!=null){
        _user ?.image =File(image!.path);
      }
      else{
        _user = User(name :"Nada", bio: "Code eat sleep Repeat" ,image: File(image!.path));

      }
       
        _user ?.image = File(image!.path);

        notifyListeners(); //lw fe ay update 
       
    }

}
 void deleteImage() {
    _user?.image = null;
    notifyListeners();
  }
}


