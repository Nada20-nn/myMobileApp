import 'dart:io'; // Needed for File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileproj/home/home_page/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage =
      []; //store in list of file type 3shan tb2a list of imgs a3rf a3rdha 3ndy

  Future<void> selectImage() async {
    List<XFile>? images = await imagePicker.pickMultiImage(); //msh btakhod haga

    if (images != null && mounted) {
      setState(() {
        selectedImage!.addAll(
          images.map((toElement) => File(toElement.path)).toList(),
        ); //not null
        // selectedImage = File(image.path);
      });
    }
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/view.jpg"),
          ),
        ),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(10),
        child: ListView(
          //smooth scroll in title &body
          children: [
            SizedBox(height: 30),

            selectedImage == null || selectedImage!.isEmpty
                ? Container(
                  //lw fadya hyrg3 container
                  color: Colors.white38, //transparent 3shan tzhar bg 2aly 3ndy
                  height: 150,
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                )
                : Row(//3shan lw fe swar ekhtrtha w 3ayza arg3 azawd tany
                  children: [

               Container(
                  //lw fadya hyrg3 container
                  color: Colors.white38, //transparent 3shan tzhar bg 2aly 3ndy
                  height: 100,
                  width: 100,
                  child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ),




                    SizedBox(
                      height: 100, // 
                      width: MediaQuery.sizeOf(context).width -120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            selectedImage!
                                .map(
                                  (toElement) => Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ), //add padding between selected images
                                        child: Image.file(
                                          toElement,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                    
                                      IconButton(
                                        onPressed: () {
                                          setState(() {//htet el cancel fe setState 3shan onClick ttshal
                                            selectedImage!.removeAt(
                                              selectedImage!.indexOf(toElement),
                                            );
                                          });
                                          //y3ny y3ml remove ll index 2aly hwa feha
                                        },
                                        icon: Icon(Icons.cancel),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(), //to change from files to widgets
                      ),
                    ),
                  ],
                ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: body,
                minLines: 3,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Body",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          //push replace
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MyHomePage(title: title.text, body: body.text, image: selectedImage//3shan ab3tlo imgs gdeda 2aly ekhtrtha m3 body w title),
            ),
          ));
        },
      ),
    );
  }
}
