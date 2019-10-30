import 'package:flutter/material.dart';

import 'TestListView.dart';

class PageCustomView extends State<TestListView> {
  List<int> _list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(),
      body:new ReorderableListView(children: _list.map((item){
        return Container(key: Key(String.fromCharCode(item)),
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
            color: Colors.white,
            child: Text(item.toString(),textAlign : TextAlign.center));
      }).toList(), onReorder: (int oldIndex,int newIndex){
        setState(() {
          if(newIndex > oldIndex){
            newIndex = -1;
          }
          final int item = _list.removeAt(oldIndex);
          _list.insert(newIndex, item);
        });
      }),);
  }
}
