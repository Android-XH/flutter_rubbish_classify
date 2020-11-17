/*
 * @Author: meetqy
 * @since: 2019-09-24 14:23:27
 * @lastTime: 2019-11-23 11:50:01
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rubbishclassify/request/request.dart';
import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/loading.dart';

/// global
class G {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// toolbar routeName
  static final List toolbarRouteNameList = [
    Router.launch,
    Router.toolbar,
    Router.home,
    Router.market,
    Router.mine
  ];

  /// 初始化request
  static final Request req = Request();

  static final bool isDebug = true;

  static bool isLoginRouter = false;

  static Future toast(String text, {ToastGravity gravity}) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: gravity ?? ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: rgba(30, 96, 249, .45),
          textColor: Colors.white,
          fontSize: 16.0);

  static Future errToast(String text, {ToastGravity gravity}) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: gravity ?? ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: rgba(243, 109, 51, .45),
          textColor: Colors.white,
          fontSize: 16.0);

  /// 初始化loading
  static final Loading loading = Loading();

  /// 手动延时
  static sleep({int milliseconds = 1000}) async =>
      await Future.delayed(Duration(milliseconds: milliseconds));

  /// 获取当前的state
  static NavigatorState getCurrentState() => navigatorKey.currentState;

  /// 获取当前的context
  static BuildContext getCurrentContext() => navigatorKey.currentContext;

  /// 获取屏幕上下边距
  /// 用于兼容全面屏，刘海屏
  static EdgeInsets screenPadding() =>
      MediaQuery.of(getCurrentContext()).padding;

  /// 获取屏幕宽度
  static double screenWidth() => MediaQuery.of(getCurrentContext()).size.width;

  /// 获取屏幕高度
  static double screenHeight() =>
      MediaQuery.of(getCurrentContext()).size.height;

  /// 跳转页面使用 G.pushNamed
  static void pushNamed(String routeName, {Object arguments}) {
    ///不带返回的页面
    if (toolbarRouteNameList.indexOf(routeName) > -1) {
      getCurrentState().pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }else{
      ///正常打开新页面
      getCurrentState().pushNamed(routeName, arguments: arguments);
    }

  }

  /// 返回页面
  static void pop() {
    getCurrentState().pop();
  }

  /// 底部border
  /// ```
  /// @param {Color} color
  /// @param {bool} show  是否显示底部border
  /// ```
  static Border borderBottom({Color color, bool show = true}) {
    return Border(
        bottom: BorderSide(
            color: (color == null || !show)
                ? (show ? rgba(238, 238, 238, 1) : Colors.transparent)
                : color,
            width: 1));
  }

  /// 获取时间戳
  /// 不传值 代表获取当前时间戳
  static int getTime([DateTime time]) {
    if (time == null) {
      return (DateTime.now().millisecondsSinceEpoch / 1000).round();
    } else {
      return (time.millisecondsSinceEpoch / 1000).round();
    }
  }
}
