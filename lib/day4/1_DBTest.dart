import 'package:flutter/material.dart';
import 'db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {
                await DB.insertData("hong", 30, 170.5);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text("저장되었습니다.")
                //     )
                // );
              }, child: Text("insert test")),
              ElevatedButton(onPressed: () async {
                List<Map<String, dynamic>> list = [];
                list = await DB.getData();
                print(list);
              }, child: Text("select test")),
              ElevatedButton(onPressed: () async {
                int result = await DB.updateData(1, "kim", 24);
                print("${result > 0 ? '수정완료' : '수정실패'}");
              }, child: Text("update test")),
              ElevatedButton(onPressed: () async {
                int result = await DB.deleteData(6);
                print("${result > 0 ? '삭제완료' : '삭제실패'}");
              }, child: Text("delete test"))
            ],
          )
        ),
      ),
    );
  }
}
