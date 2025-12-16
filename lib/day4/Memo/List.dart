import 'package:flutter/material.dart';
import 'MemoDB.dart';
import 'Edit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MemoList extends StatelessWidget {
  const MemoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListScreen();
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // 샘플 데이터
  List<Map<String, dynamic>> list = const [];

  Future<void> _selectMemoList() async{
    List<Map<String, dynamic>> memo = await DB.selectMemoList();
    setState(() {
      list = memo;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectMemoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8BBD0),
              Color(0xFFBBDEFB),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 360,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                /// 헤더
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.list_alt,
                        color: Colors.pink,
                        size: 26,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '메모 목록',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                /// 리스트
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// 제목 + 아이콘
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    // 수정 기능 연결 예정
                                    bool flg = await Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>EditScreen(id : item['id']))
                                    );
                                    if(flg){
                                      _selectMemoList();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title : Text("삭제"),
                                        content: Text("${item["title"]}게시글을 정말 삭제하실건가요?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async{
                                                int result = await DB.deleteMemo(item["id"]);
                                                if(result > 0){
                                                  Fluttertoast.showToast(
                                                      msg: "삭제되었습니다.",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0
                                                  );
                                                  _selectMemoList();
                                                }
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("삭제")
                                          ),
                                          TextButton(
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("취소")
                                          )
                                        ],
                                      );
                                    },
                                  );
                                  },
                                ),
                              ],
                            ),

                            SizedBox(height: 6),

                            /// 내용
                            Text(
                              item['content'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            SizedBox(height: 10),

                            /// 날짜
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                item['date'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
