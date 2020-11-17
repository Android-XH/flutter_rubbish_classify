import 'dart:async';

import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Market extends StatefulWidget {

  static _MarketState _marketState;

  Market() {
  if (_marketState == null) {
    _marketState = _MarketState();
  }
  }
  getAppBar() => _marketState.createAppBar();

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  AppBar createAppBar() {
    /// 配置appbar
    return AppBar(
      leading: null,
      centerTitle: true,
      title: Text(
        "商城",
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
    return WebviewScaffold(
      url: "http://bbch5.leimingtech.com/goodsearch/gcIdSearch?keyword=a1bfbbcc6dbd40bd890e4806a8d70ce1",
      mediaPlaybackRequiresUserGesture: false,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      useWideViewPort: true,
      displayZoomControls:true,
      withOverviewMode: true,
    );
  }

}
