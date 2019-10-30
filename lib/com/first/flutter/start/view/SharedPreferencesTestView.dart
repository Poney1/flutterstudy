import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/com/first/flutter/start/view/SharedPreferencesTest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTestView extends State<SharedPreferencesTest> {
  var _test = "testShared";
  var _i = 0;
  var _testPutString = "设置数据";
  var _testGetString = "读取缓存数据";

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: new Column(
        children: <Widget>[
          InkWell(
              child: new Center(child: Text("$_testPutString")),
              onDoubleTap: () {
                setState(() {
                  var testString  = _putString("child");
                  print("1111"  );
                });
              }),
          InkWell(
              child: new Center(child: Text("$_testGetString")),
              onDoubleTap: () {
                _testGetString = _readString();
              })
        ],
      ),
    ));
  }

  //设置数据
  _putString(String testString) async {
    var prefs = await SharedPreferences.getInstance();
    _i++;
    await prefs.setString(_test, testString + String.fromCharCode(_i) + "$_i");
  }

  //读取数据
  _readString() async {
    var  prefs = await SharedPreferences.getInstance();
    String response =   prefs.getString(_test);
    setState(() {
      _testGetString = response;
    });
  }
}
