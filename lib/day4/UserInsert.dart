import 'package:flutter/material.dart';
import 'UserList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInsert(),
    );
  }
}

class UserInsert extends StatefulWidget {
  const UserInsert({super.key});

  @override
  State<UserInsert> createState() => _UserInsertState();
}

class _UserInsertState extends State<UserInsert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqlite 실습"),
        actions: [
          GestureDetector(child: Icon(Icons.menu), onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserList()),
            );
          })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Name")
              ),
              TextField(
                decoration: InputDecoration(labelText: "Age")
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){}, child: Text("사용자 추가"))
            ],
          ),
        ),
      ),
    );
  }
}

