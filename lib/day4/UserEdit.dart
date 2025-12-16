import 'package:flutter/material.dart';
import 'db.dart';
import 'UserList.dart';


class UserEdit extends StatefulWidget {
  final int? userId;
  UserEdit({super.key, this.userId});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUserInfo(widget.userId!);
  }

  Future<void> _selectUserInfo(int id) async{
    var user = await DB.getUserInfo(id);
    var info = user.first;
    setState(() {
      nameCtrl.text = info["name"];
      ageCtrl.text = info["age"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text("사용자 수정"),
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
                    await DB.updateUserData(widget.userId!, name, age);
                    Navigator.pop(context, true);
                  },
                  child: Text("수정")
              )
            ],
          ),
        )

    );
  }
}