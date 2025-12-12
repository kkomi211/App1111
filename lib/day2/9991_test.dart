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
  var _txt = "Flutter";
  var _color = Colors.purple[200];
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
                _txt = "재밌다";
                _color = Colors.blue[100];
              } else {
                place = Alignment.center;
                _txt = "Flutter";
                _color = Colors.purple[200];
              }
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: _color),
          child: Text("${_txt}"),
        ),
      ),
    );
  }
}
