import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random _ran = Random();
  late double dy;
  late double dx;
  @override
  void initState() {
    super.initState();
    dy = _ran.nextDouble() * 300;
    dx = _ran.nextDouble() * 300;
  }

  void changePosition() {
    dy = _ran.nextDouble() * 300;
    dx = _ran.nextDouble() * 300;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: dy,
              left: dx,
              child: Container(
                width: 50, height: 50, color: Colors.yellow,
            )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      changePosition();
                    });
                  }, child: Text("위치 변경"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
