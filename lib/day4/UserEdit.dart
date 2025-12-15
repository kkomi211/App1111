import 'package:firstproject/day4/UserList.dart';
import 'package:flutter/material.dart';
import 'UserList.dart';

void main() {
  runApp(const UserEdit());
}

class UserEdit extends StatelessWidget {
  final String? name;
  final int? age;

  const UserEdit({super.key, this.name, this.age});

  @override
  Widget build(BuildContext context) {
    TextEditingController namectrl = TextEditingController();
    TextEditingController agectrl = TextEditingController();
    namectrl.text = "ㅇㅇ";
    agectrl.text = "13";
    return Scaffold(
      appBar: AppBar(title: Text("사용자 수정")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "이름"),
                controller: namectrl,
              ),
              TextField(
                decoration: InputDecoration(labelText: "나이"),
                controller: agectrl,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_)=>UserList())
                );
              }, child: Text("수정"))
            ],
          ),
        ),
      ),
    );
  }
}
