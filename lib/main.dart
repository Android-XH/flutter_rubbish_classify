import 'package:color_dart/rgba_color.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/global.dart';

final Router router = Router();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: G.navigatorKey,
      title: '垃圾分类助手',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            actionsIconTheme: IconThemeData(
              color: rgba(0, 0, 0, 0.5),
            ),
            elevation: 0,
          )),
      builder: (context, widget) {
        return MediaQuery(
          //设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget,
        );
      },
      initialRoute: Router.launch,
      onGenerateRoute: router.getRoutes,
    );
  }
}
