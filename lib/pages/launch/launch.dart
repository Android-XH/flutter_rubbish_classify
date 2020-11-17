import 'dart:async';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/global.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  /// 总倒计时时长
  int _countdownNum = 5;

  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: rgba(255, 255, 255, 1),
        body: Stack(
          children: [
            Positioned(
              top: 50.0,
              right: 15.0,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Container(
                  child: Text(
                    "（$_countdownNum秒）跳过",
                    style: TextStyle(
                        color: rgba(112, 128, 144, 1),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                onPressed: () {
                  G.pushNamed(Router.toolbar);
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 180.0),
              child: Image.asset(
                "assets/images/launch/icon_launch_logo.png",
                width: 319.0,
                height: 220.0,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 60.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "---垃圾分类助手 v 1.0.0---",
                  style: TextStyle(
                    color: rgba(112, 128, 144,1),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  /// 倒计时
  _countDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      setState(() {
        if (_countdownNum > 0) {
          _countdownNum--;
        } else {
          _timer.cancel();
          _timer = null;
          //倒计时结束后打开首页
          G.pushNamed(Router.toolbar);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁定时器
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
