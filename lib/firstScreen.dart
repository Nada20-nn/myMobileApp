import 'package:flutter/material.dart';
import 'package:mobileproj/home/home_page/home_page.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent
        ),
      body:Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/background.jpg"))
  ),
  margin: EdgeInsets.all(16), // optional: to separate from screen edges
  padding: EdgeInsets.all(10),
  child: Column(
    children: [
      SizedBox(height: 150,),
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
          //push replacement ta5od el content w tms7 el saf7a tmaman 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(
              //l2no el title mn el controller mn no3 object b bdna n7wlo ela string f bnswy .text
              title: title .text,
              body: body .text
            )),
          );
        },
      ),
    );
  }
}
