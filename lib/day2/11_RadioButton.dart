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
  var _item = "java";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            RadioListTile<String>(
              value: "java",
              groupValue: _item,
              onChanged: (value) {
                setState(() {
                  _item = value!;
                });
              },
              title: Text("자바"),
            ),
            RadioListTile<String>(
              value: "oracle",
              groupValue: _item,
              onChanged: (value) {
                setState(() {
                  _item = value!;
                });
              },
              title: Text("오라클"),
            ),
            RadioListTile<String>(
              value: "html",
              groupValue: _item,
              onChanged: (value) {
                setState(() {
                  _item = value!;
                });
              },
              title: Text("html"),
            ),
          ],
        ),
      ),
    );
  }
}
