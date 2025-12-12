import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var place = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Align(
        alignment: place,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (place == Alignment.center) {
                place = Alignment.topCenter;
              } else {
                place = Alignment.center;
              }
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[100]),
          child: Text("Flutter"),
        ),
      ),
    );
  }
}
