import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> getDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'memo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TBL_MEMO (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            date TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertMemo(String title, String content) async {
    print("title === > $title");
    final db = await getDatabase();
    int result = await db.insert('TBL_MEMO', {'title': title, 'content': content, 'date': DateTime.now().toIso8601String()});
    return result;
  }

  static Future<List<Map<String, dynamic>>> selectMemoList() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> list = await db.query('TBL_MEMO');
    return list;
  }

  static Future<int> deleteMemo(int id) async {
    final db = await getDatabase();
    int result = await db.delete('TBL_MEMO', where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<int> updateMemo(int id, String title, String content) async {
    final db = await getDatabase();
    int result = await db.update('TBL_MEMO', {'title': title, 'content': content, 'date': DateTime.now().toIso8601String()}, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<Map<String, dynamic>> selectMemoInfo(int id) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> list = await db.query('TBL_MEMO', where: "id = ?", whereArgs: [id]);
    return list[0];
  }

// 함수 작성
// date 넣을 때 'DATE': DateTime.now().toIso8601String(), 이런식
// ex )
// await db.insert(
//   'TBL_MEMO',
//   {
//     'title': title,
//     'content': content,
//     'date': DateTime.now().toIso8601String(),
//   },
// );
// 2025-12-16

// 꺼내서 쓸때는
// DateTime date = DateTime.parse(map['DATE']);
// 이런식으로 변경
}