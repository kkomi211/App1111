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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("테스트"),),
        drawer: Drawer(
          child: Column(
            children: [
              Container(width: double.infinity, height: 200, decoration:
                BoxDecoration(
                  image: DecorationImage(image: AssetImage("song2.jpg"), fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      CircleAvatar(radius: 50, backgroundImage: AssetImage("song.jpg"), ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("홍길동", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Text("test@naver.com", style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: ListView(
                children: [
                  ListTile(leading: Icon(Icons.home, color: Colors.blue,), title: Text("홈")),
                  ListTile(leading: Icon(Icons.shop, color: Colors.blue,), title: Text("쇼핑")),
                  ListTile(leading: Icon(Icons.category, color: Colors.blue,), title: Text("카테고리")),
                  ListTile(leading: Icon(Icons.heart_broken_outlined, color: Colors.blue,), title: Text("내 위시리스트")),
                  ListTile(leading: Icon(Icons.shopping_cart, color: Colors.blue,), title: Text("내 장바구니")),
                  ListTile(leading: Icon(Icons.lock, color: Colors.blue,), title: Text("로그인")),
                ],
              ))
            ],
          ),
        ),
        body: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
