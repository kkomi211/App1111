import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random _ran = Random();
  List<Widget> list = [];
  int rmNum = 0;

  void listChange() {
    List<Widget> tempList = [];
    if (tempList.length > 0) {
      for (int i = 0; i < 10; i++) {
        tempList[i] = Positioned(
          top: _ran.nextDouble() * (MediaQuery.of(context).size.height - 100),
          left: _ran.nextDouble() * (MediaQuery.of(context).size.width - 100),
          child: GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: Center(child: Text("${i + 1}")),
            ),
            onTap: () {
              setState(() {
                removeList(i);
              });
            },
          ),
        );
      }
      rmNum = 0;
    } else {
      for (int i = 0; i < 10; i++) {
        tempList.add(
          Positioned(
            top: _ran.nextDouble() * (MediaQuery.of(context).size.height - 100),
            left: _ran.nextDouble() * (MediaQuery.of(context).size.width - 100),
            child: GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
                child: Center(child: Text("${i + 1}")),
              ),
              onTap: () {
                setState(() {
                  removeList(i);
                });
              },
            ),
          ),
        );
      }
      rmNum = 0;
    }
    setState(() {
      list = tempList;
    });
  }

  void removeList(int num){
    if(rmNum == num){
      print(num);
      print(rmNum);
      list.removeAt(0);
      rmNum++;
      if(rmNum == 10){
        listChange();
      }
    }
    else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Stack(children: list)),
            Container(
              height: 50,
              color: Colors.green[100],
              child: Center(child: ElevatedButton(onPressed: listChange, child: Text("박스생성"))),
            ),
          ],
        ),
      ),
    );
  }
}
