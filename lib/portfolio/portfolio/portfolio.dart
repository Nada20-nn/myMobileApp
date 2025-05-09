import 'package:flutter/material.dart';
import 'package:mobileproj/portfolio/portfolio_widget/contact.dart';

import '../portfolio_widget/portfolio_widget.dart';

// ==================== Logic Part ====================
class MobilePhone {
  final String brand;
  final String model;
  final int? storage;
  final double price;
  final String serialNumber;

  //Const
  MobilePhone({
    required this.brand,
    required this.model,
    this.storage,
    this.price = 0.0,
    required this.serialNumber,
  });

  // Named Constr
  MobilePhone.withDefaultStorage({
    required this.brand,
    required this.model,
    int? storage,
    this.price = 0.0,
    required this.serialNumber,
  }) : storage = storage ?? 64; 

  // Const constr
  const MobilePhone.constant({
    required this.brand,
    required this.model,
    required this.storage,
    this.price = 0.0,
    required this.serialNumber,
  });

  
  @override
  String toString() {
    return 'MobilePhone(brand: $brand, model: $model, storage: ${storage ?? "Unknown"} GB, price: \$$price, serialNumber: $serialNumber)';
  }

  
  MobilePhone copyWith({
    String? brand,
    String? model,
    int? storage,
    double? price,
    String? serialNumber,
  }) {
    return MobilePhone(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      storage: storage ?? this.storage,
      price: price ?? this.price,
      serialNumber: serialNumber ?? this.serialNumber,
    );
  }
}
////////////
class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String imagePath = 'assets/nada1.jpg'; 

  void changeImage() {
    setState(() {
      imagePath =
          imagePath == 'assets/nada1.jpg'
              ? 'assets/nada2.jpg'
              : 'assets/nada1.jpg'; // Toggling
    });
  }

  @override
  Widget build(BuildContext context) {
    
    MobilePhone myPhone = MobilePhone.withDefaultStorage(
      brand: "Apple",
      model: "iPhone 15",
      price: 20000.99,
      serialNumber: "XYZ123456",
    )..toString(); 
    

    return Scaffold(
      appBar: AppBar(title: const Text("My Portfolio"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: changeImage,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hey There, I'm Nadaa",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "I design beautifully simple things. And I love what I do.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
              },
              child: const Text("Contact Me"),
            ),
            const SizedBox(height: 20),
             Text(
      myPhone.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    ),

          ],
          
        ),
      ),
    );
  }
}
