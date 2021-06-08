import 'package:path/path.dart';
import 'package:practice/Module/member.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {

  SQLiteDbProvider._privateConstructor();
  static final SQLiteDbProvider db = new SQLiteDbProvider._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), "MembersDb.db"),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE members(id INTEGER PRIMARY KEY, login TEXT, avatarUrl TEXT, isFavorite INTEGER)",
        );
      },
    );
  }

  Future<List<Member>> getAllMember() async {
    final db = await database;
    List<Map> maps = await db.query("members");
    List<Member> list = [];
    if(maps != null) maps.forEach((element) {
      Member m = Member.fromMap(element);
      list.add(m);
    });
    return list;
  }

  Future<Member> getMemberById(int id) async {
    final db = await database;
    var result = await db.query("members", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty? Member.fromMap(result.first) : null;
  }

  Future<void> insertMember(Member member) async {
    final db = await database;
    await db.insert(
      "members",
      member.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("----------------------------------- Inserted: ${member.login} ");
  }

  Future<void> updateMember(Member member) async {
    final db = await database;
    await db.update(
      "members",
      member.toMap(),
      where: "id = ?",
      whereArgs: [member.id],
    );
    print("----------------------------------- updated ");
  }

  Future<void> deleteMember(int id) async {
    final db = await database;
    await db.delete(
      "members",
      where: "id = ?",
      whereArgs: [id],
    );
    print("----------------------------------- Deleted: $id ");
  }
}
