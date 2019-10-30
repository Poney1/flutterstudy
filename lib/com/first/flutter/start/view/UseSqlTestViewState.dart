import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'UseSqlTestView.dart';

class UseSqlTestViewState extends State<UseSqlTestView> {
  var _createSql = " 创建数据库 ";
  var _insertSql = " 插入数据 ";
  var _readSql = " 读取数据 ";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(children: <Widget>[
      InkWell(
        child: new Container(
          height: 100,
          child: new Center(child: new Text("$_createSql")),
        ),
        onTap: () {
          _createSqlite();
        },
      ),
      InkWell(
        child: new Container(
          height: 100,
          child: new Center(child: new Text("$_insertSql")),
        ),
        onTap: () {
          _insertSqlite();
        },
      ),
      InkWell(
        child: new Container(
          height: 100,
          child: new Center(child: new Text("$_readSql")),
        ),
        onTap: () {
          _readSqlite();
        },
      )
    ]));
  }

  //创建数据库
  _createSqlite() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'demo.db');
    print("_createSqlite $path");
    await deleteDatabase(path);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY,name TEXT,value INTEGER,num REAL)');
    });
  }

  //插入数据
  _insertSqlite() async {
    var database = await openDatabase("demo.db");
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name,value,num) VALUES ("some name",1234,456.789)');
      print("_insertSqlite-- $id1");
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name,value,num) VALUES(?,?,?)',
          ["lixiangxiang", 1234567, 9809885]);
      print("_insertSqlite--id2  $id2");
    });
    await database.close();
  }

  //读取插入数据
  _readSqlite() async {
    var database = await openDatabase("demo.db");
    var records = await database.query("Test");
//    Map<String,dynamic> dMaps = records.first;
//    dMaps['my_column'] = 1;
//    Map<String,dynamic> dMapss = Map<String,dynamic>.from(dMaps);
//    dMapss['my_column'] = 1;

    await database.transaction((txn) async {
      Future<List<Map<String, dynamic>>> queryFuture = txn
          .rawQuery('SELECT * FROM "Test" WHERE name = ? ', ['lixiangxiang']);
      queryFuture.then((lists) {
        Map<String, dynamic> mapLists = lists.first;
        dynamic ds = mapLists.values;
        setState(() {
          _readSql = ds.toString();
        });
      });
      print("_insertSqlite-- $_readSql");
    });
    await database.close();
  }
}
