import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text(
            "반갑습니다잇",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color : Colors.black
            )
        ),
      ),
    );
  }
}
