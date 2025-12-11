import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      "bulgogi.jpg", "coke.jpg", "cookie.jpg", "hihi.jpg", "kimbab.jpg"
    ];
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20
            ),
            itemCount: 20,
            itemBuilder: (context, index){
              return Image.asset("${labels[index % 5]}");
            }
        ),
      ),
    );
  }
}
