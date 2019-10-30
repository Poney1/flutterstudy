import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/com/first/flutter/start/TestDemoListView.dart';
import 'package:flutter_app/com/first/flutter/start/view/GestureDetectorView.dart';
import 'package:flutter_app/com/first/flutter/start/view/LoadImagePicture.dart';
import 'package:flutter_app/com/first/flutter/start/view/RequestMethodTest.dart';
import 'package:flutter_app/com/first/flutter/start/view/RouteTestView.dart';
import 'package:flutter_app/com/first/flutter/start/view/SharedPreferencesTest.dart';
import 'package:flutter_app/com/first/flutter/start/view/UseSqlTestView.dart';
import 'package:flutter_app/com/first/flutter/start/view/WebViewTest.dart';
import 'package:flutter_app/com/first/flutter/view/TestPageCustomView.dart';

import 'MyPageSecond.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  StatelessElement createElement() {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
            color: Colors.white,
            title: 'Flutter',
            home: Scaffold(body: new TestDemoListView()),
            routes: <String, WidgetBuilder>{
              '/a': (BuildContext context) => new MyPageSecond(),
              '/b': (BuildContext context) => new TestPageCustomView(),
              '/c': (BuildContext context) => new LoadImagePicture(),
              '/d': (BuildContext context) => new RequestMethodTest(),
              '/e': (BuildContext context) => new GestureDetectorView(),
              '/f': (BuildContext context) => new SharedPreferencesTest(),
              '/g': (BuildContext context) => new UseSqlTestView(),
              '/h': (BuildContext context) => new RouteTestView(),
              '/k': (BuildContext context) => new TestDemoListView(),
              '/j': (BuildContext context) => new WebViewTest(),
            });
  }

}
