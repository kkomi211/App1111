import 'package:flutter/material.dart';
import 'UserList.dart';
import 'db.dart';

void main() => runApp(UserInsert());

class UserInsert extends StatelessWidget {
  const UserInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : UserInsertExam()
    );
  }
}

class UserInsertExam extends StatefulWidget {
  const UserInsertExam({super.key});

  @override
  State<UserInsertExam> createState() => _UserInsertExamState();
}

class _UserInsertExamState extends State<UserInsertExam> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text("sqflite 실습"),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserList(),));
                },
                icon: Icon(Icons.list)
            )
          ],
        ),
        body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                    labelText: "Name"
                ),
              ),
              TextField(
                controller: ageCtrl,
                decoration: InputDecoration(
                    labelText: "Age"
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    String name = nameCtrl.text;
                    int age = int.tryParse(ageCtrl.text) ?? 0;
                    await DB.insertUserData(name, age);
                  },
                  child: Text("사용자 추가")
              ),
              ElevatedButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> list = await DB.getUserData();
                    print(list);
                  },
                  child: Text("사용자 확인")
              )
            ],
          ),
        )

    );
  }
}