import 'package:flutter/material.dart';
import 'package:mobileproj/details/details_widget/details_widget.dart';

class NadaQuiz extends StatelessWidget {
  const NadaQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Nada")),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              Image.asset(
                "assets/nada2.jpg",
                width: 300,
                height: 300,
                // fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('i love designing beautiful things'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
