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

    var checkList = [];
    List<String> list = ["할일이 뭐지"];
    TextEditingController _todoctrl = TextEditingController();

    void listck(String ls){
      if(checkList.contains(ls)){
        checkList.remove(ls);
      }
      else{
        checkList.add(ls);
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("할 일")),
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: _todoctrl
                  )),
                  SizedBox(width: 20),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      list.add(_todoctrl.text);
                      _todoctrl.text = "";
                    });
                  }, child: Text("추가"))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(value: checkList.contains(list[index]), onChanged: (value){
                      setState(() {
                        listck(list[index]);
                        print("ch");
                      });
                    }),
                    title: Text("${list[index]}"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
