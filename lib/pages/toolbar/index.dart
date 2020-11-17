

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';


import 'package:rubbishclassify/pages/toolbar/home/home.dart';
import 'package:rubbishclassify/pages/toolbar/market/market.dart';
import 'package:rubbishclassify/pages/toolbar/mine/mine.dart';
import 'package:rubbishclassify/routes/index.dart';

import 'package:rubbishclassify/util/icon.dart';



class Toolbar extends StatefulWidget {
  final String routeName;
  final Object arguments;

  // 初始化所有的toolbar页面
  static Home _home = Home();
  static Market _message = Market();
  static Mine _mine = Mine();

  /// 所有toolbar页面
  final Map<int, Map> pages = {
    0: _createPage(_home, appbar: _home.getAppBar(), routeName: Router.home),
    1: _createPage(_message,appbar: _message.getAppBar(), routeName: Router.market),
    2: _createPage(_mine, appbar: _mine.getAppBar(), routeName: Router.mine)
  };

  /// 创建页面map
  /// ```
  /// @param {Widget} page - 页面
  /// @param {Appbar} appbar - 当前页面是否显示appbar 默认为true
  /// ```
  static Map _createPage(Widget page, {AppBar appbar, String routeName}) {
    return {"widget": page, "appbar": appbar, "routeName": routeName};
  }

  static Toolbar _singleton;
  static _NavigationState _navigationState;

  Toolbar.singleton({
    this.routeName,
    this.arguments,
  });

  factory Toolbar({String routeName, Object arguments}) {
    if (_singleton == null) {
      _singleton = Toolbar.singleton(routeName: routeName, arguments: arguments);
    }
    if (_navigationState == null) {
      _navigationState = _NavigationState();
    }
    return _singleton;
  }

  // 通过 routeName 获取对应页面的索引
  getPageIndex(routeName) {
    switch (routeName) {
      case '/market':
        return 1;
      case '/mine':
        return 2;
      default:
        return 0;
    }
  }

  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Toolbar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map page = widget.pages[currentIndex];
    return Scaffold(
        appBar: page['appbar'],
        body: Container(color: hex('#fff'), child: page['widget']),
        bottomNavigationBar: Theme(
            data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: iconHome(),
                  title: Text('首页'),
                ),
                BottomNavigationBarItem(
                  icon: iconMarket(),
                  title: Text('环保商城'),
                ),
                BottomNavigationBarItem(
                  icon: iconMine(),
                  title: Text('我的'),
                ),
              ],
              unselectedFontSize: 13,
              // 未选中字体大小
              selectedFontSize: 15,
              // 选中字体大小
              selectedItemColor: rgba(84, 195, 119, 1),
              unselectedItemColor: rgba(112, 128, 144, 1),
              // 选中字体颜色
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )));
  }
}
