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
  var num = 0;
  var _color = Colors.purple[200];
  var _color2 = Colors.blue[200];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("숫자 증가"), backgroundColor: Colors.purple),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("버튼 누르면 숫자 증가"),
                  Text(num.toString())
                ]
              ),
            ),
            Positioned(
              bottom: 20,
              right: 5,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    num++;
                  });
                },
                child: Text("+"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: num % 2 == 0 ? _color : _color2,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero)
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}
