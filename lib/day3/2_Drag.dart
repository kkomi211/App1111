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
  Offset position = Offset(150, 150);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: position.dy,
              left: position.dx,
              child: GestureDetector(
                child: Container(
                  width: 100, height: 100, color: Colors.blue[900]
                ),
                // onTap: (){print("클릭 됨");},
                onPanUpdate: (details){
                  setState(() {
                    position += details.delta;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
