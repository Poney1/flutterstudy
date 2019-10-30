import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/view/WebViewTest.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewTestState extends State<WebViewTest> {
  final _flutterWebView = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    _flutterWebView.onUrlChanged.listen((String url) {
      print("url $url");
    });
    _flutterWebView.onScrollXChanged.listen((double x) {
      print("x  $x");
    });
    _flutterWebView.onScrollYChanged.listen((double y) {
      print("y  $y");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: new WebviewScaffold(
      url: "https://www.baidu.com",
      // 允许网页缩放
      withZoom: true,
      // 允许LocalStorage
      withLocalStorage: true,
      // 允许执行js代码
      withJavascript: true,
      scrollBar: false,
    ), onWillPop: (){
      return Future.value(true);
    }) ;
  }

/**
 * Scaffold(
    body: Container(
    child: new WebviewScaffold(
    key: Key("scrollBar"),
    url: "https://www.baidu.com",
    // 登录的URL
    appBar: new AppBar(
    title: new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Text("test"),
    ],
    ),
    iconTheme: new IconThemeData(color: Colors.white),
    ),
    withZoom: true,
    // 允许网页缩放
    withLocalStorage: true,
    // 允许LocalStorage
    withJavascript: true, // 允许执行js代码
    ),
    ))
 */
}
