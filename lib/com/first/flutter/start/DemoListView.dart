import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/TestDemoListView.dart';

class DemoListView extends State<TestDemoListView> {
  var _list = [];

  @override
  void initState() {
    super.initState();
    var data = Random.secure().nextInt(100);
    //实现列表  然后各功能测试
    _list.add("$data加载图片");
    _list.add("请求网络页面");
    _list.add("使用手势控件");
    _list.add("shared_preferences _ 保存数据");
    _list.add("使用数据库");
    _list.add("路由跳转测试");
    _list.add("webview测试");
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
            key: Key("s1"),
            body: new ListView(
                children: _list.map((item) {
              return new InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 50,
                    color: Colors.red,
                    child: new Column(
                      children: <Widget>[
                        InkWell(
                          child: new Text(item.toString(),
                              textAlign: TextAlign.center),
                          onTap: () {
                            _itemClick(item, _list.indexOf(item));
                          },
                        )
                      ],
                    )),
                onTap: () {
                  _itemClick(item + " fa", _list.indexOf(item));
                },
              );
            }).toList())),
        onWillPop: () {
          print("_requestPop back");
          return new Future.value(false);
        });
  }

  _itemClick(txt, position) {
    setState(() {
      if (position == 0) {
        _navigatorToShowImage();
      } else if (position == 1) {
        _navigatorNetworkImage();
      } else if (position == 2) {
        _navigatorGestureDetector();
      } else if (position == 3) {
        _navigatorSharedPreferences();
      } else if (position == 4) {
        _navigatorSqlShow();
      } else if (position == 5) {
        _navigatorToRoute();
      } else if (position == 6) {
        _navigatorToWebview();
      }
    });
  }

  //跳转到图片展示页
  _navigatorToShowImage() {
    Navigator.pushNamed(context, "/c");
  }

  //跳转网络请求展示
  _navigatorNetworkImage() {
    Navigator.pushNamed(context, "/d");
  }

  //跳转手势使用页
  _navigatorGestureDetector() {
    Navigator.pushNamed(context, "/e", arguments: ["646", 3333]);
  }

  //持久化存储
  _navigatorSharedPreferences() {
    Navigator.pushNamed(context, "/f");
  }

  //数据库
  _navigatorSqlShow() {
    Navigator.pushNamed(context, "/g");
  }

  //route test
  _navigatorToRoute() {
    Navigator.pushNamed(context, "/h");
  }
  //webview test
  _navigatorToWebview() {
    Navigator.pushNamed(context, "/j");
  }
}
