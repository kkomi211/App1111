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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("하하"),
            Icon(Icons.eighteen_mp),
            ElevatedButton(
                onPressed: (){}, 
                child: Text("나는 버튼이야")
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.holiday_village)
            ),
            Container(width: 50, height: 50, color: Colors.cyanAccent),
            Image.asset("coke.jpg", width: 50, height: 50),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("cookie.jpg"),
            )
          ],
        ),
      )
    );
  }
}
