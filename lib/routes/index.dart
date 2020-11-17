import 'package:flutter/material.dart';
import 'package:rubbishclassify/pages/detail/rubbish_detail.dart';
import 'package:rubbishclassify/pages/launch/launch.dart';
import 'package:rubbishclassify/pages/search/search_detail.dart';
import 'package:rubbishclassify/pages/search/search_img.dart';
import 'package:rubbishclassify/pages/search/search_voice.dart';
import 'package:rubbishclassify/pages/toolbar/index.dart';
import 'package:rubbishclassify/pages/webview/webview.dart';
import 'package:rubbishclassify/util/log_util.dart';


class Router {
  static final String launch = '/';
  static final String toolbar = "/toolbar";
  static final String home = '/home';
  static final String mine = '/mine';
  static final String market = '/market';

  static final String rubbishDetail = "/rubbish_detail";

  static final String search="/search";
  static final String searchImg="/search/img";
  static final String searchVoice="/search/voice";

  static final String webView="/web_view";

  static final _routes = {
    /// TODO: 从非toolbar页面跳转到toolbar页面的入场动画不一致
    launch: (BuildContext context, {Object args}) => Launch(),
    toolbar: (BuildContext context, {Object args}) => Toolbar(),
    home: (BuildContext context, {Object args}) => Toolbar(),
    mine: (BuildContext context, {Object args}) => Toolbar(),
    market: (BuildContext context, {Object args}) => Toolbar(),

    rubbishDetail: (BuildContext context, {Object args}) => RubbishDetail(
          imgUrl: args,
        ),
    search: (BuildContext context, {Object args}) => SearchDetail(
      searchTxtData: args,
    ),
    searchImg:(BuildContext context, {Object args}) => SearchImg(
      imgEntity: args,
    ),
    searchVoice:(BuildContext context, {Object args}) => SearchVoice(),
    webView:(BuildContext context,{Object args})=>FlutterWebView(webData: args,)

  };

  static Router _singleton;

  Router._internal();

  factory Router() {
    if (_singleton == null) {
      _singleton = Router._internal();
    }
    return _singleton;
  }

  /// 监听route
  Route getRoutes(RouteSettings settings) {
    String routeName = settings.name;
    final Function builder = Router._routes[routeName];
    LogUtil.e(settings);
    if (builder == null) {
      return null;
    } else {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              builder(context, args: settings.arguments));
    }
  }
}
