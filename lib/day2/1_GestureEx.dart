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
  var _color = Colors.white;
  var _textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: (){
            setState(() {
              if(_color == Colors.white){
                _color = Colors.black;
                _textColor = Colors.white;
              }
              else{
                _color = Colors.white;
                _textColor = Colors.black;
              }
            });
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "클릭!",
              style: TextStyle(
                fontSize: 50,
                color: _textColor
              ),
            ),
          ),
        ),
        backgroundColor: _color,
      ),
    );
  }
}
