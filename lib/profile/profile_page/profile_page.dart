import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  Future<void> selectImage(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void deleteImage() {
    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 100,
                    child: selectedImage == null
                        ? const Icon(Icons.person, size: 100)
                        : ClipOval(
                            child: Image.file(
                              selectedImage!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.camera_alt, size: 25),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(16),
                            height: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Choose Profile Photo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ProfileOptionButton(
                                      icon: Icons.camera_alt,
                                      label: 'Camera',
                                      onPressed: () {
                                        Navigator.pop(context);
                                        selectImage(ImageSource.camera);
                                      },
                                    ),
                                    ProfileOptionButton(
                                      icon: Icons.photo,
                                      label: 'Gallery',
                                      onPressed: () {
                                        Navigator.pop(context);
                                        selectImage(ImageSource.gallery);
                                      },
                                    ),
                                    if(selectedImage!=null)
                                    ProfileOptionButton(
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      iconColor: Colors.red,
                                      labelColor: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        deleteImage();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nada elgedawy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'nada@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? labelColor;

  const ProfileOptionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor ?? Colors.black),
        ),
        Text(
          label,
          style: TextStyle(color: labelColor ?? Colors.black),
        ),
      ],
    );
  }
}
