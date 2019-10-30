import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/view/RequestMethodTest.dart';

class RequestMethodTestState extends State<RequestMethodTest> {
  var _list = ["get", "post", "delete"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
      children: _list.map((item) {
        return new InkWell(
          child: new Container(child: new Text(item, textAlign: TextAlign.center),
          color: Colors.amberAccent,),
          onTap: () {
            var response = sendRequest(_list.indexOf(item));
            print("sendRequest $item  $response");
          },
        );
      }).toList(),
    ));
  }

  sendRequest(position) async {
    var response;
    try {
      var http = HttpClient();
      if (position == 0) {
        //执行 get 请求
        String url = "http://wthrcdn.etouch.cn/weather_mini?city=深圳";
        var uri = Uri.parse(url);
        var request = await http.getUrl(uri);
        response = await request.close();
        if (response.statusCode == HttpStatus.ok) {
          String responseString = await response.transform(utf8.decoder).join();
          //有数据
          print("sendRequest  $responseString");
          setState(() {
            _list[position] = responseString;
          });
        }
      } else if (position == 1) {
        String url = "https://www.tianqiapi.com/api/";
        var request = await http.postUrl(Uri.parse(url));
        var bodyMap = {};
        bodyMap["version"] = "v1";
        bodyMap["cityid"] = "1011120201";
        bodyMap["city"] = "青岛";
        request.add(utf8.encode(json.encode(bodyMap)));
        response = await request.close();
        if (response.statusCode == HttpStatus.ok) {
          var stringResponse =await response.transform(utf8.decoder).join();
          setState(() {
            _list[position] = stringResponse;
          });

        } else {}
      }
      http.close();
    } catch (e) {
      print("test e $e");
    }
    return response;
  }
}
