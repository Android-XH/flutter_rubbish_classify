import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/util/custom_appbar.dart';

class RubbishDetail extends StatelessWidget {
  final String imgUrl;

  const RubbishDetail({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, title: "详情"),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          imgUrl,
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
