import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/view/RouteTestView.dart';

class RouteTestViewState extends State<RouteTestView> {
  var _textOne = "routest";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GestureDetector(
      child: new Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            "$_textOne",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: () {
        _navigatorPop(context);
      },
      onTapDown: (TapDownDetails tails) {},
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(title: Text('动态路由')),
              body: Center(
                child: FlatButton(
                  child: Text('POP'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ));
      },

      onDoubleTap: () {
        _navigatorMain(context);
      },
    ));
  }

  //跳到首页去
  _navigatorMain(context) {
    Navigator.pushNamed(context, "/k");
  }
}

void _navigatorPop(BuildContext context) {
  Navigator.pop(context);
}
