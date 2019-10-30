


import 'package:flutter/material.dart';
import 'package:flutter_app/com/first/flutter/start/view/LoadImagePicture.dart';

class LoadImageState extends State<LoadImagePicture>{
   var _list = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563977065627&di=c1d22a08486c0ebda97e840414d36069&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201808%2F27%2F20180827043223_twunu.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563977065627&di=a69884bc073654a4a41c5da831fe0129&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fdf9c608cdc843e6fb6ef6d145cd69b14c9b79ca55968d-3UmfMm_fw658","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563977065626&di=c38419dff87eed3b5a4d39add00946c7&imgtype=0&src=http%3A%2F%2Fpic31.nipic.com%2F20130725%2F2929309_093830698178_2.jpg","http://hbimg.b0.upaiyun.com/586cdaa3a5f19c743c2dd54bb6b28d86ff2ca90717870-4FSzz5_fw658"];
  @override
  Widget build(BuildContext context) {
    // 
    return new Container(key: Key("LoadImageState"),child: new ListView(children: _list.map((item){
      return new Image.network(item);
    }).toList()),);
  }

}