import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Center(
        // child: Icon(Icons.home)
        // child: ElevatedButton(
        //     onPressed: (){
        //       print("버튼 클릭 창!");
        //     },
        //     child: Text("날 눌러")
        // )
        child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.camera_front)
        ),
      )
    );
  }
}
