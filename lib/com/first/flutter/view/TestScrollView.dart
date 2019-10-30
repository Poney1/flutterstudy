import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestScrollView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TestColumn();
  }
}

class TestColumn extends State<TestScrollView> {
  @override
  Widget build(BuildContext context) {
    return Container(padding :EdgeInsets.fromLTRB(10,200,30,40),child: new Column(
      children: <Widget>[
        new Text("列"),
        new Text(" ---sds  "),
        new Row(
          children: <Widget>[
            new Text("横--"),
            new Text("测试"),
            new Container(
              child: RaisedButton(
                onPressed: null,
                child: new Text("滑动按钮1"),
                color: Colors.white,
                colorBrightness: Brightness.light,
              ),
              margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
            ),
            new FlatButton(
              onPressed: () {
                setState(() {
                  _onTest(context);
                });
              },
              child: Text(
                "滑动按钮2",
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
              color: Colors.white,
            ),
          ],
        )
      ],
    ),);
  }

  _onTest(BuildContext context) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white);
    pushNavigatorB(context);
  }
  void pushNavigatorB(BuildContext context){
    Navigator.of(context).pushNamed("/b");
  }

}
