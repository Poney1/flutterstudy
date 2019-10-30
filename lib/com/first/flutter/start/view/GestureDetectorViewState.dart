import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/view/GestureDetectorView.dart';

class GestureDetectorViewState extends State<GestureDetectorView> {
  var _textOne = "wait modify";

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
          color: Colors.blueGrey,
          height: 100,
          child: new Center(
            child: Text(
              "$_textOne",
              textAlign: TextAlign.center,
            ),
          )),
      onTap: () {
        setState(() {
          _textOne = " onTap ";
        });
      },
      onTapDown: (TapDownDetails tails) {
        setState(() {
          var _x = tails.globalPosition.dx;
          var _y = tails.globalPosition.dy;
          _textOne = " $_x ~~ $_y";
        });
      },
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        setState(() {
          var _x = details.globalPosition.dx;
          var _y = details.globalPosition.dy;
          _textOne = " $_x ~~ $_y";
        });
      },
      onDoubleTap: () {
        setState(() {
          _textOne = " onDoubleTap ";
        });
      },
    );
  }
}
