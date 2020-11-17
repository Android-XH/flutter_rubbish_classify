import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';


import 'package:rubbishclassify/util/icon.dart';

class ASearch extends StatelessWidget {
  final String hint;
  final VoidCallback onPressed;

  const ASearch({Key key, this.hint, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
          height: 40.0,
          decoration: new BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //设置四周边框
            border: new Border.all(width: 0.5, color: rgba(102, 102, 102, 1)),
          ),
          padding: EdgeInsets.only(left: 10.0),
          child:Row(
            children: <Widget>[
              iconSearch(color: rgba(102, 102, 102, 1)),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  hint??"请输入搜索内容...",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: rgba(153, 153, 153, 1),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
      ),
    );
  }

}
