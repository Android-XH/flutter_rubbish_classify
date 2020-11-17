import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:rubbishclassify/util/global.dart';
import 'package:rubbishclassify/util/icon.dart';
import 'package:rubbishclassify/widgets/a_button/index.dart';

class Mine extends StatefulWidget {
  static _MineState _mineState;

  Mine() {
    if (_mineState == null) {
      _mineState = _MineState();
    }
  }

  getAppBar() => _mineState.createAppBar();

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  AppBar createAppBar() {
    /// 配置appbar
    return AppBar(
      leading: null,
      centerTitle: true,
      title: Text(
        "我的",
        style: TextStyle(
            color: rgba(255, 255, 255, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: rgba(84, 195, 119, 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rgba(245, 245, 245, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(27),
                  child: Image.network(
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1618065806,14298536&fm=26&gp=0.jpg",
                    width: 75,
                    height: 75,
                    fit: BoxFit.fill,
                  )),
            ),
            Text(
              "点击登录",
              style: TextStyle(
                  color: rgba(102, 102, 102, 1),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),

           Container(
             margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
             height: 10,
           ),
            _space("我的订单",onPressed: (){
                G.toast("努力建设中...");
            }),
            Divider(color: rgba(235, 235, 235, 1),height: 1,),
            _space("我的收货地址",onPressed: (){
              G.toast("努力建设中...");
            }),
            Divider(color: rgba(235, 235, 235, 1),height: 1),
            _space("我的测试得分",onPressed: (){
              G.toast("努力建设中...");
            }),
            Divider(color: rgba(235, 235, 235, 1),height: 1),
            _space("关于我们",onPressed: (){
              G.toast("努力建设中...");
            }),
            Divider(color: rgba(235, 235, 235, 1),height: 1,),
            _space("地址管理",onPressed: (){
              G.toast("努力建设中...");
            }),
          ],
        ),
      ),
    );
  }
  Widget _space(String title, {Null Function() onPressed}) {
    return AButton.rightIcon(
        height: 50.0,
        textChild: Text(
          title,
          style: TextStyle(color: rgba(51, 51, 51, 1), fontSize: 17),
        ),
        icon: iconArrowRight(color: rgba(51, 51, 51, 1), size: 14),
        plain: false,
        onPressed: onPressed);
  }
}
