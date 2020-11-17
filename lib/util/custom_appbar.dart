import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/util/icon.dart';

import 'global.dart';

/// 通用appbar
/// 
/// ```
/// @param {BuildContext} - context 如果context存在：左边有返回按钮，反之没有
/// @param {String} title - 标题
/// @param {bool} borderBottom - 是否显示底部border
/// ```
AppBar customAppbar({
  BuildContext context,
  String title ,
  bool borderBottom = false,
  List actions,
  Color backgroundColor,
  Color titleColor,
}) {
  return AppBar(
    centerTitle: false,
    title: Text(title??"", style: TextStyle(
      color:titleColor!=null?titleColor:rgba(56, 56, 56, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),),
    backgroundColor:backgroundColor!=null?backgroundColor:rgba(255, 255, 255, 1),
    elevation: 0,
    leading: context == null ? null : InkWell(
      child: iconBack(size: 22,color: titleColor!=null?titleColor:rgba(56, 56, 56, 1)),
      onTap: () => Navigator.pop(context),
    ),
    bottom: PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          border: G.borderBottom(show: borderBottom)
        ),
      ),
      preferredSize: Size.fromHeight(0),
    ),
    actions: actions,
  );
}