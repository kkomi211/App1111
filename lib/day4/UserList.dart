import 'package:firstproject/day4/UserInsert.dart';
import 'package:flutter/material.dart';
import 'UserEdit.dart';

void main() {
  runApp(const UserList());
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> list = [
      {"아이디" : "2", "이름" : "123", "나이" : 123},
      {"아이디" : "3", "이름" : "z", "나이" : 12},
      {"아이디" : "4", "이름" : "test", "나이" : 12}
    ];


    return Scaffold(
      appBar: AppBar(title: Text("사용자 목록"),),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("아이디 : ${list[index]['아이디']}, 이름 : ${list[index]['이름']}"),
            subtitle: Text("나이 : ${list[index]['나이']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_)=>UserEdit())
                  );
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),
          );
        },
      )

    );
  }
}
