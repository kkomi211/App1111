import 'package:flutter/material.dart';
import 'db.dart';

void main() {
  runApp(const UserView());
}

class UserView extends StatefulWidget {
  final int? userId;

  const UserView({super.key, this.userId});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  var info = {};

  Future<void> _selectUserInfo() async {
    var user = await DB.getUserInfo(widget.userId!);
    setState(() {
      info = user.first;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 정보")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("아이디 : ${widget.userId!}", style: TextStyle(fontSize: 30)),
            Text("이름 : ${info['name']}", style: TextStyle(fontSize: 30)),
            Text("나이 : ${info['age']}", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
