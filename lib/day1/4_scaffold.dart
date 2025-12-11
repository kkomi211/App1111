import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("상단 영역!! 타이틀!"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              // Container(height: 200, color: Colors.green[200]),
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green[200]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("cookie.jpg")),
                    SizedBox(height: 5),
                    Text("홍길동", style: TextStyle(color: Colors.blue)),
                    Text("test@naver.com", style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
              ListTile(leading: Icon(Icons.home), title: Text("홈"), onTap: (){}),
              ListTile(leading: Icon(Icons.camera_alt), title: Text("카메라"), onTap: (){}),
              ListTile(leading: Icon(Icons.logout), title: Text("로그아웃"), onTap: (){})
            ],
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset("cookie.jpg", width: 60, height: 60, fit: BoxFit.contain),
              title: Text("아주 좋은 쿠키", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("150,000원, 인천 부평동"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("클릭 성공");
              },
            ),
            Divider(height: 1, color: Colors.grey),
            ListTile(
              leading: Image.asset("bulgogi.jpg", width: 60, height: 60, fit: BoxFit.contain),
              title: Text("맛있는 불고기", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("250,000원, 서울 강남구"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("클릭 성공2");
              },
            ),
            Divider(height: 1, color: Colors.grey),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.domain), iconSize: 40),
              IconButton(onPressed: (){}, icon: Icon(Icons.home), iconSize: 40),
              IconButton(onPressed: (){}, icon: Icon(Icons.backspace), iconSize: 40)
            ],
          ),
        ),
      )
    );
  }
}
