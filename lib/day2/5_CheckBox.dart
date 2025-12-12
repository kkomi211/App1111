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
  List<String> checkedList = [];
  List<String> imgList = [
    "java.jpg", "oracle.jpg", "html.jpg"
  ];

  void listChanged(String subject){
    setState(() {
      if(!checkedList.contains(subject)){
        checkedList.add(subject);
      }
      else{
        checkedList.remove(subject);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: Checkbox(
                value: checkedList.contains(imgList[0]), onChanged: (value){
                  listChanged(imgList[0]);
                }
              ),
              title: Text("자바"),
              onTap: () {
                listChanged(imgList[0]);
              }
            ),
            ListTile(
              leading: Checkbox(
                value: checkedList.contains(imgList[1]), onChanged: (value){
                  listChanged(imgList[1]);
                }
              ),
              title: Text("오라클"),
              onTap: () {
                listChanged(imgList[1]);
              },
            ),
            ListTile(
              leading: Checkbox(
                value: checkedList.contains(imgList[2]), onChanged: (value){
                  listChanged(imgList[2]);
                }
              ),
              title: Text("html"),
              onTap: () {
                listChanged(imgList[2]);
              }
            ),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  itemCount: checkedList.length,
                  itemBuilder: (context, index){
                    return Image.asset("${checkedList[index]}");
                  }
                )
            )
          ],
        ),
      ),
    );
  }
}
